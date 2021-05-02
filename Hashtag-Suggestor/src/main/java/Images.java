import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.*;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.cloud.vision.v1.*;
import com.google.protobuf.ByteString;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@MultipartConfig
@WebServlet("/image") //for images uploaded from computer
public class Images extends HttpServlet {
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws  IOException {
		String fileName=req.getParameter("fileName");

		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		List<BlobKey> blobKeys = blobs.get("myFile"); //images uploaded are getting stored as blobs list

		if (blobKeys == null || blobKeys.isEmpty()) {
			res.sendRedirect("/"); //if no image is uploaded but clicked on upload button
		} else {
			//if image is uploaded then store the info

			String imageUrl = getUploadedFileUrl(blobKeys.get(0));
			byte[] blobBytes = getBlobBytes(blobKeys.get(0));
			List<EntityAnnotation> imageLabels = getImageLabels(blobBytes);
			processimage( req,res,fileName,imageUrl ,imageLabels);
		}
	}

    private void processimage(HttpServletRequest request, HttpServletResponse response,String imageId,String imageUrl,List<EntityAnnotation> imageLabels){
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		if (Hashtag.checkIfImageExists(datastore, imageId) == false) { //check if image exists in gae through Hashtag.java file with uploaded image id
			if (imageLabels != null) { //image already exists and we're getting image labels >75% score
				List<String> labels = imageLabels.stream().filter(label -> label.getScore() * 100 > 75)
						.map(EntityAnnotation::getDescription).collect(Collectors.toList());
				if (null != labels && !labels.isEmpty()) { //if labels match the 75% score send those labels to Hashtag.,java
					Hashtag.addImageDetailsToDataStore(imageUrl, labels, imageId, datastore);
					getImageFromStore(request, response, datastore, imageId);
				}
			}
		}else{
			getImageFromStore(request, response, datastore, imageId); //image to datastore and setting data to image like labels
		}



	}
	public void getImageFromStore(HttpServletRequest request, HttpServletResponse response, DatastoreService datastore, String PhotoId) {

		Query query = //check if images exists in datastore
				new Query("User_Images")
						.setFilter(new Query.FilterPredicate("image_id", Query.FilterOperator.EQUAL, PhotoId));
		PreparedQuery pq = datastore.prepare(query);
		List<Entity> results = pq.asList(FetchOptions.Builder.withDefaults());
		if(null != results) {
			results.forEach(user_images -> {
				String labelsFromStore = (String) user_images.getProperty("labels");
				System.out.println("labelsFromStore"+labelsFromStore);
				String image_url=user_images.getProperty("image_url").toString(); 
				request.setAttribute("imageUrl",image_url ); //uploaded image url is copied to imageurl(gae)
				request.setAttribute("imageLabels", labelsFromStore); //we're getting labels for uploaded image
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/Result.jsp");
				try {
					dispatcher.forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
		}

	}
	private String getUploadedFileUrl(BlobKey blobKey){
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		ServingUrlOptions options = ServingUrlOptions.Builder.withBlobKey(blobKey);
		return imagesService.getServingUrl(options); //uploaded image url is returned from datastore
	}


	private List<EntityAnnotation> getImageLabels(byte[] imgBytes) throws IOException {
		ByteString byteString = ByteString.copyFrom(imgBytes);
		Image image = Image.newBuilder().setContent(byteString).build();

		Feature feature = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build(); //label detection feature for the image is done here
		AnnotateImageRequest request =
				AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
		List<AnnotateImageRequest> requests = new ArrayList<>();
		requests.add(request); //labels that has been detected is added to the new list we hv created

		ImageAnnotatorClient client = ImageAnnotatorClient.create();//The ImageAnnotator service returns detected entities from the images
		BatchAnnotateImagesResponse batchResponse = client.batchAnnotateImages(requests);
		client.close();
		List<AnnotateImageResponse> imageResponses = batchResponse.getResponsesList();
		AnnotateImageResponse imageResponse = imageResponses.get(0);

		if (imageResponse.hasError()) {
			System.err.println("Error getting image labels: " + imageResponse.getError().getMessage());
			return null;
		}

		return imageResponse.getLabelAnnotationsList();//return labels list
	}


	private byte[] getBlobBytes(BlobKey blobKey) throws IOException {
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		ByteArrayOutputStream outputBytes = new ByteArrayOutputStream();

		int fetchSize = BlobstoreService.MAX_BLOB_FETCH_SIZE;
		long currentByteIndex = 0;
		boolean continueReading = true;
		while (continueReading) {
			// end index is inclusive, so we have to subtract 1 to get fetchSize bytes
			byte[] b = blobstoreService.fetchData(blobKey, currentByteIndex, currentByteIndex + fetchSize - 1);
			outputBytes.write(b);

			// if we read fewer bytes than we requested, then we reached the end
			if (b.length < fetchSize) {
				continueReading = false;
			}

			currentByteIndex += fetchSize;
		}

		return outputBytes.toByteArray();//returning blob size
	}

}

/*
Images.java //for upload images
Methods:
doPost
processimage
getImageFromStore
getUploadedFileUrl
getImageLabels
getBlobBytes
 */


