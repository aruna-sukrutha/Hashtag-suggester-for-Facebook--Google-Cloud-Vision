import com.google.appengine.api.datastore.*;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import org.apache.commons.io.IOUtils;
import java.io.*;
import java.net.URL;
import java.util.*;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet(
        name = "Hashtag",
        urlPatterns = {"/hashtag"} //for fb images that's retrieved 
)
public class Hashtag extends HttpServlet {
    public Hashtag() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String url = request.getParameter("hiddenField");
        String FbPhotoId = request.getParameter("Fb_image_id");
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        if (checkIfImageExists(datastore, FbPhotoId) == false) { //checking if that fb image exist in datastore 
            List<EntityAnnotation> imageLabels = getImageLabels(url); //if doesn't exist get labels for this image url
            if (imageLabels != null) {
                List<String> lables = imageLabels.stream().filter(label -> label.getScore() * 100 > 75)
                        .map(EntityAnnotation::getDescription).collect(Collectors.toList());//storing labels with score >75%
                if (null != lables && !lables.isEmpty()) {

                    addImageDetailsToDataStore(url, lables, FbPhotoId, datastore); //adding image and related info to datastore
                    getImageFromStore(request, response, datastore, FbPhotoId); //image and info from datastore
                }
            }
        }else{
            getImageFromStore(request, response, datastore, FbPhotoId);//image and info from datastore
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    }

    public static void addImageDetailsToDataStore(String url, List<String> labels, String imageId, DatastoreService
            datastore) { //setting url,image id, labels for the image 
        Entity User_Images = new Entity("User_Images");
        User_Images.setProperty("image_id", imageId);
        User_Images.setProperty("image_url", url);
        StringBuffer result = new StringBuffer();
        for(String label: labels) {
            result.append("#").append(label).append(" "); //generating # tags...appending # to labels
        }
        User_Images.setProperty("labels", result.toString()); //converting labels result to a string
        datastore.put(User_Images);
    }

    private void getImageFromStore(HttpServletRequest request, HttpServletResponse response, DatastoreService datastore, String imageId) {

        Query query =
                new Query("User_Images") //checking if images exist in datastore
                        .setFilter(new Query.FilterPredicate("image_id", Query.FilterOperator.EQUAL, imageId));
        PreparedQuery pq = datastore.prepare(query);
        List<Entity> results = pq.asList(FetchOptions.Builder.withDefaults());
        if(null != results) { //if image exists get url, labels and set them to imageUrl, imageLabels
            results.forEach(user_Photo -> {
                String labelsFromStore = (String) user_Photo.getProperty("labels");
                String image_url=user_Photo.getProperty("image_url").toString();
                request.setAttribute("imageUrl",image_url );
                request.setAttribute("imageLabels", labelsFromStore);
                RequestDispatcher dispatcher = getServletContext() //sending client request to jsp file
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

    public static boolean checkIfImageExists(DatastoreService datastore, String imageId) {
        Query q =
                new Query("User_Images") //checking if image exists in datastore
                        .setFilter(new Query.FilterPredicate("image_id", Query.FilterOperator.EQUAL, imageId));
        PreparedQuery pq = datastore.prepare(q);
        Entity result = pq.asSingleEntity();
        if (result == null) {
            return false;//image doen't exists
        }
        return true;//image exists
    }

    private static byte[] downloadFile(URL url) throws Exception {
        try (InputStream in = url.openStream()) { //an input stream for reading from the URL connection.
            byte[] bytes = IOUtils.toByteArray(in);
            return bytes;
        }
    }
    private List<EntityAnnotation> getImageLabels(String imageUrl) {
        try {
            byte[] imgBytes = downloadFile(new URL(imageUrl));
            ByteString byteString = ByteString.copyFrom(imgBytes);
            Image image = Image.newBuilder().setContent(byteString).build();
            Feature feature = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build(); //label detection feature for the image is done here
            AnnotateImageRequest request =
                    AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
            List<AnnotateImageRequest> requests = new ArrayList<>();
            requests.add(request); //labels that has been detected is added to the new list we hv created
            
            ImageAnnotatorClient client = ImageAnnotatorClient.create(); //The ImageAnnotator service returns detected entities from the images
            BatchAnnotateImagesResponse batchResponse = client.batchAnnotateImages(requests);
            client.close();
            List<AnnotateImageResponse> imageResponses = batchResponse.getResponsesList();
            AnnotateImageResponse imageResponse = imageResponses.get(0);
            if (imageResponse.hasError()) {
                System.err.println("Error getting image labels: " + imageResponse.getError().getMessage());
                return null;
            }
            return imageResponse.getLabelAnnotationsList(); //return labels list
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}

/*
Hashtag.java //for fb images
Methods:
doPost
doGet-empty
addImageDetailsToDataStore
getImageFromStore
checkIfImageExists
downloadFile
getImageLabels
*/