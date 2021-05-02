Welcome to the Hashtag-Suggester wiki!

## Introduction:
Hashtag-Suggester:

For this project, we have created an application called the Hashtag Suggester which allows the user to upload a picture for hashtag suggestions. We can upload an image from the computer or select an image from Facebook for Hashtag suggestions by using a tool called the Graph API. These uploaded pictures are stored in the Google Datastore. The Cloud Vision API then analyses the uploaded image and then the appropriate hashtag is suggested. There's an option wherein the analyzed image along with the hashtags can be posted to Facebook and Twitter.

Hashtag Suggester application link:
https://hashtag-generate.appspot.com/

## Table of contents:
1. Introduction
2. Description
3. Demonstration of Application working
4. GAE Issues and GAE Datastore
5. Java Code Documentation
6. Code
8. Analytics
Project 1 Proposal

## **1. Description:**

### 1.1 Code repository:
[Github Code Repository](https://github.com/arunampalli/Hashtag-suggester-for-Facebook--Google-Cloud-Vision/tree/main/Hashtag-Suggestor)

### 1.2 Project Proposal:
[Project Proposal](https://github.com/arunampalli/Hashtag-suggester-for-Facebook--Google-Cloud-Vision/wiki/Project-1-Proposal)



### 1.3 Java Class:-

Description of Java Servlet/JSP files:
Java class:

* Hashtag.Java

This java class is responsible for invoking the cloud vision API. Which also helps in generating the labels for the pictures selected from Facebook. It also stores and retrieves the image ID, image URL, and labels from the Datastore.

* Images.Java

Similar to the Hashtag.java class, even here we are storing and retrieved the image ID, image URL, and the labels from the Datastore but this for images uploaded from computer. Along with invoking the Cloud Vision API and fetching the labels to or from the Datastore.
JSP Files:

* Upload.jsp

Firstly, all the UI design and styling is done in this JSP file. This interface gives the user the option of selecting the image either from the computer or Facebook. If the user decides to select an image from Facebook then the picture is sent to the servlet(Hashtag.java) for further processing and if the user selects to upload the photo from the lcomputer to the blobstore, then the Upload servlet is invoked for processing.

* Result.jsp

This is the second page which appears after uploading the image where the hashtags(labels) for the image are displayed after the image has been analyzed using the CloudVision API. It contains the necessary UI styling for this page which also has an option to post the analyzed image to Facebook and twitter.

##  **2. Demonstration of Application working:**

### **Our homepage:**

<img width="1403" alt="1" src="https://user-images.githubusercontent.com/65356966/116727218-1d347680-a999-11eb-824b-7bd4515d7457.png">

### Choosing an Image from the Computer:

If we do not choose an image and click Upload an error will show up saw "Please choose a file" as it is required field.

![Screenshot (169)](https://user-images.githubusercontent.com/65356966/116796606-9794f180-aa92-11eb-8045-dc64ec019494.png)

Choose an image from Computer or choose an image from Facebook.
In the below screenshot, we chose an image from the Computer.

<img width="1424" alt="2" src="https://user-images.githubusercontent.com/65356966/116727373-52d95f80-a999-11eb-8f0d-163f163f0cca.png">

Then click upload button which will take us to the following page, where the hashtags are displayed for the uploaded image.

![Screen Shot 2021-05-01 at 8 05 28 AM](https://user-images.githubusercontent.com/65356966/116795052-fc4a4f00-aa86-11eb-8299-4b91f299b8e6.png)


We can share it to either Twitter or Facebook by clicking on the "Share to Facebook Button" or on "Tweet" buttons.

<img width="1389" alt="twitter share" src="https://user-images.githubusercontent.com/65356966/116727703-c1b6b880-a999-11eb-95d4-ecdcc4441868.png">

<img width="1255" alt="twitter share2" src="https://user-images.githubusercontent.com/65356966/116728201-7a7cf780-a99a-11eb-9991-e4124898b3a7.png">


Here, it shows the image being shared on Facebook.

![fb share](https://user-images.githubusercontent.com/65356966/116796214-b5ad2280-aa8f-11eb-8f5b-72163ee29dfa.png)

![fb share2](https://user-images.githubusercontent.com/65356966/116796221-b9d94000-aa8f-11eb-94bd-144e40e97f1e.png)

![fb sahre 3](https://user-images.githubusercontent.com/65356966/116796225-bcd43080-aa8f-11eb-89cb-c48292b8ea16.png)


### Results showed when a new image is added to Facebook. (Choosing an Image from Facebook)

Firstly, we click on the Image From Facebook tab where we need to login into Facebook which will then take us to the page which will retrieve all the images from the Facebook account.

![1](https://user-images.githubusercontent.com/65356966/116796351-95319800-aa90-11eb-93b1-500b3e5de13c.png)

![2](https://user-images.githubusercontent.com/65356966/116796355-982c8880-aa90-11eb-8220-304d181e8bd8.png)


![3](https://user-images.githubusercontent.com/65356966/116796366-a7133b00-aa90-11eb-9250-6564813cecfc.png)

The page before adding the new image to Facebook:

![4](https://user-images.githubusercontent.com/65356966/116796376-b2fefd00-aa90-11eb-950c-fd8bf39c6af7.png)

We then go onto adding/posting a new image to Facebook as shown below.

![5](https://user-images.githubusercontent.com/65356966/116796400-e6418c00-aa90-11eb-8892-328ce4e9d1ae.png)

Repeating the first few steps, we then log into our Facebook to see the newly added image displayed in the application.

![6](https://user-images.githubusercontent.com/65356966/116796421-24d74680-aa91-11eb-9654-65eddd92c497.png)

Here, the user gets to select any picture of his choice for the Hashtag Suggestion. But in this case, we will select the newly added image for Hashtag Suggestions.

![7](https://user-images.githubusercontent.com/65356966/116796477-90211880-aa91-11eb-9a8a-6ea3ad2df7ed.png)

As soon as the user clicks the Upload button, the image is sent to the Google Cloud Vision API where the picture analysis takes place where the labels are generated for that picture along with its score which has to be above 75 percent in order to be picked and sent to Google Datastore along with the Image ID as well as the Image URL.

![8](https://user-images.githubusercontent.com/65356966/116796487-a929c980-aa91-11eb-8116-4d2c5ec112f3.png)

![9](https://user-images.githubusercontent.com/65356966/116796489-ac24ba00-aa91-11eb-87e5-c8847812e399.png)

From above, we pick the newly added picture to Facebook for analysis which will generate the hashtags for the same. We can see below that the hashtags have been generated where there's an option of sharing it to Facebook or to Twitter.

![10](https://user-images.githubusercontent.com/65356966/116796499-c8c0f200-aa91-11eb-9d1d-aebbe27db253.png)

This is what shows up when a Tweet is clicked.


![Tweet-1](https://user-images.githubusercontent.com/65356966/116796551-2a815c00-aa92-11eb-8fdf-af0fec446d35.png)

![Tweet-2](https://user-images.githubusercontent.com/65356966/116796553-2e14e300-aa92-11eb-8c78-2c0381a51697.png)

![Tweet-3](https://user-images.githubusercontent.com/65356966/116796555-2fdea680-aa92-11eb-9156-13d5f5690d00.png)


This is what shows up when the Share image to Facebook is clicked.

![11](https://user-images.githubusercontent.com/65356966/116796527-f7d76380-aa91-11eb-9b61-72a87e9410ba.png)

![12](https://user-images.githubusercontent.com/65356966/116796529-fad25400-aa91-11eb-979f-c8389f6f32fa.png)

![13](https://user-images.githubusercontent.com/65356966/116796530-fdcd4480-aa91-11eb-9e8c-7ef15caabb3e.png)

![14](https://user-images.githubusercontent.com/65356966/116796534-ff970800-aa91-11eb-8b78-0c01a25cfb51.png)

### Another teammate showing the choosing of an image from the application and sharing it on Facebook.
![Home-Page](https://user-images.githubusercontent.com/38745074/116807099-149d8680-aae6-11eb-9bf6-41f7caa5be38.png)
![Login-retrieving](https://user-images.githubusercontent.com/38745074/116807089-0fd8d280-aae6-11eb-867e-83c9e72e34ab.png)
![Clicking-Image ](https://user-images.githubusercontent.com/38745074/116807097-136c5980-aae6-11eb-8a64-ddec567f8af2.png)
![Post-On-News-Feed](https://user-images.githubusercontent.com/38745074/116807092-123b2c80-aae6-11eb-814d-e3b2287e5b47.png)
![Post-On-Facebook_Success_Notification](https://user-images.githubusercontent.com/38745074/116807091-11a29600-aae6-11eb-9075-d22befeb9ba3.png)
![Facebook-Result-Page](https://user-images.githubusercontent.com/38745074/116807098-1404f000-aae6-11eb-88e9-9e77f3285c81.png)

### 3.1 Issues faced in this project:

Issues faced in this project:

In this project, we did not face any issue with the Google App Engine and Google Datastore but we faced an issue on the below scenarios:

1. In the Project proposal it has been mentioned that we also share an image with hashtags
on Instagram too but Instagram APIs are available only for Business accounts not for  Personal Facebook
profiles.

2. Facebook buttons like Share and Continue with Facebbok buttons are not working at times.

3. Retrieving fb user images of a user is working in some systems only. For example, one of my teammates is able to see images in other system but not in their system for the application.

Google Datastore:

1) In this application we store the data in the image_ID, image_URL where the labels that have been generated have a score high than 75% to this Entity named **User_Images** in the Google Datastore.

2) In order to get the data from Google Datastore we will have to run a query that retrieves something specific from the User_Images where the image_ID is the same as the one that's given in the query after which the response is sent to the browser.

The query which is used is:

` Query query =`
              `new Query("User_Images").setFilter(new Query.FilterPredicate("image_id", Query.FilterOperator.EQUAL, imageId));`

3) The entity which we have used is **User_Images**.

![8](https://user-images.githubusercontent.com/65356966/116796654-f8bcc500-aa92-11eb-9d90-288673d94947.png)

4) The entity User_Images along with its properties/keys.

![9](https://user-images.githubusercontent.com/65356966/116796655-fc504c00-aa92-11eb-89fd-f67cac920de9.png)


Google App Engine Dashboard:

![Screenshot (200)](https://user-images.githubusercontent.com/65356966/116796665-138f3980-aa93-11eb-9326-985461da8f74.png)


## **4. JAVA code Documentation:**

Java Doc: [Click here ](http://csweb01.csueastbay.edu/~zj2972/Project1/)

## **5. Code:**

[Github Code repository path:](https://github.com/arunampalli/Hashtag-suggester-for-Facebook--Google-Cloud-Vision/tree/main/Hashtag-Suggestor)

[Images sent to Google Cloud Vision API](https://github.com/arunampalli/Hashtag-suggester-for-Facebook--Google-Cloud-Vision/wiki/Few-Images-sent-to-Google-Vision-API)

## **6. Youtube:**
[Youtube demonstration]()

## 7. Analytics Report
[Report](https://github.com/arunampalli/Hashtag-suggester-for-Facebook--Google-Cloud-Vision/wiki/8.-Analytics)
