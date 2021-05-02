Welcome to the Project1002 wiki!

## Introduction: 
In this project, we created an app called **"HashTag Generator"** that generates a Hashtag for the given picture. This can be achieved by either selecting the picture from a local machine or retrieve an image from the Facebook account of the user using "GraphAPI Tool" and the selected picture will send to Google cloud vision API, Based on the object, facial expressions, text detected in the image by API, it will generate labels. Using those labels this app suggests '#' tags for the images. Also, this app provides a feature to share the images along with provided Hashtags on Facebook

HashTag Generator: [Application URL](https://eco-cyclist-293107.uc.r.appspot.com)

## Table of contents:
1. Description
2. Demonstration of Application working
3. GAE issues and GAE Datastore
4. JAVA code Documentation
5. Code
6. Youtube
7. Analytics Report

## **1. Description:**

### 1.1 Code repository:
[Github Code Repository:](https://github.com/Kavithad04/Project1002)

### 1.2 Project Proposal:
[Project Proposal](https://github.com/rojabalakrishnan/SocialNetworkAppOnFacebook/wiki/Project-1-Proposal)

### 1.3 GitHub Commit History:

<img width="822" alt="Image (93)" src="https://user-images.githubusercontent.com/71798208/100970473-daee3280-34e9-11eb-834e-7d30ccd86018.png">


<img width="863" alt="Image (94)" src="https://user-images.githubusercontent.com/71798208/100970485-de81b980-34e9-11eb-93b6-4b8496e46098.png">


### 1.4 Java Class:-

    1.4.1 CloudVision.Java - This class performs the following task: 
        1) Invokes Cloud vision API and fetch the labels for the images retrieved from Facebook.
        2) Store and retrieve image_ID, image_URL, and the labels to/from the Datastore.

    1.4.2 Upload.Java - This class performs the following task:
        1) Invokes Cloud vision API and fetch the labels for the images uploaded to blobstore from Desktop.
        2) Store and retrieve image_ID, image_URL, and the labels to/from the Datastore.

### 1.5 JSP Files:-

    1.5.1 Home.JSP -
        1) Provides an interface to select images either from Facebook or upload from the local file system.
        2) If the user selects an image from Facebook, then pass the selected image will be sent to the 
        servlet for processing.                                                  
        3) Upload the file from the local file system to the blobstore and invoke the "Upload" servlet 
        for processing. 

    1.5.2 Labels.JSP - share an image to Facebook account -
        1) Display the response from the servlet containing the image and the corresponding labels 
        from CloudVision.
        2) Provide an option to share the image along with the labels converted as hashtags to Facebook.

##  **2. Demonstration of Application working:**

### 2.1 Home Page of the Application:

<img width="763" alt="Image (70)" src="https://user-images.githubusercontent.com/71798208/100691952-ac802400-333e-11eb-85d3-899bd575faf7.png">

### 2.2 Choose an Image from Facebook:

    2.2.1 Click on "Choose from Facebook" and then the user can log in to their Facebook account

<img width="800" alt="Image - 2020-12-03T002448 983" src="https://user-images.githubusercontent.com/71798208/100983429-290d3100-34fe-11eb-9c02-c1cf28fb5ee3.png">




    2.2.2 After log in to Facebook, User can see their name "Continue as 'Your Username'" 

<img width="800" alt="Image - 2020-12-03T002518 488" src="https://user-images.githubusercontent.com/71798208/100983440-2d394e80-34fe-11eb-9a33-0c466e09108c.png">
   
    

    2.2.3 Click on the "Continue as 'Your Username'" button, it will redirect to the next page. In that page, 
    user can see all the images what they are having in their account. Also, the user can choose an image to 
    generate hashtags by clicking on the image. Also, the user currently has 3 images, another image can be added 
    to the user's timeline. The same will be displayed on the "Hashtag generator" Application when I click 
    "countinue as 'user name'"

<img width="800" alt="Image - 2020-12-03T011012 150" src="https://user-images.githubusercontent.com/71798208/100988268-65439000-3504-11eb-98aa-9c368b538885.png">

<img width="800" alt="Image - 2020-12-03T011017 140" src="https://user-images.githubusercontent.com/71798208/100988279-68d71700-3504-11eb-994b-14979b9cb81e.png">

    2.2.4 Newly added photo is showing on the Application

<img width="800" alt="Image - 2020-12-03T011021 363" src="https://user-images.githubusercontent.com/71798208/100988291-6a084400-3504-11eb-93e3-b807aac323e1.png">

    2.2.5 User can select any photo for processing the labels 

<img width="800" alt="Image - 2020-12-03T003520 141" src="https://user-images.githubusercontent.com/71798208/100984410-8fdf1a00-34ff-11eb-9f3a-a54adc252880.png">

    2.2.6 After choosing the image when the user clicks the "Generate" button, the image will be sent to 
    Google Cloud vision API to generate Labels along with scores. Whichever labels return a score of more than 
    75% will be sent to Google Datastore along with ImageID and ImageUrl.

<img width="800" alt="Image - 2020-12-03T004246 700" src="https://user-images.githubusercontent.com/71798208/100985182-83a78c80-3500-11eb-9de5-c1f90ef7cb9a.png">


<img width="800" alt="Image - 2020-12-03T004251 940" src="https://user-images.githubusercontent.com/71798208/100985193-8904d700-3500-11eb-8462-664f3c1e413d.png">


    2.2.7 Retrieve the same information from the datastore and display it on the browser. Here, the user can 
    Share the image on Facebook with the generated hashtags by clicking "Share on Facebook" and the same image can 
    be seen on User's Timeline

<img width="800" alt="Image - 2020-12-03T010109 592" src="https://user-images.githubusercontent.com/71798208/100987192-0b8e9600-3503-11eb-9e9c-2d0824a55e54.png">

    2.2.8 By clicking on "Share on Facebook" user can post this image on their timeline

<img width="800" alt="Image - 2020-12-03T004653 242" src="https://user-images.githubusercontent.com/71798208/100985700-1ea06680-3501-11eb-9869-b6296026c4c5.png">

    2.2.9 User can see the message once the post has been successful 


<img width="800" alt="Image - 2020-12-03T005253 453" src="https://user-images.githubusercontent.com/71798208/100986360-f107ed00-3501-11eb-8dd2-fd55c382b90f.png">

    2.2.10 Image has been posted on the Timeline

<img width="800" alt="Image - 2020-12-03T004625 241" src="https://user-images.githubusercontent.com/71798208/100985645-1516fe80-3501-11eb-8bb1-ff27ac4f49b9.png">

<img width="800" alt="Image - 2020-12-03T004646 239" src="https://user-images.githubusercontent.com/71798208/100985676-1b0cdf80-3501-11eb-8bf3-ea62f5fb6b13.png">

    2.2.11 Another example of sending the Facebook images done by another teammate, starting from choosing an image from the application and 
    sharing the image on Facebook

<img width="800" alt="Image - 2020-12-03T101855 530" src="https://user-images.githubusercontent.com/71798208/101071068-f5a7c200-3550-11eb-8b35-923184ce8f4d.png">
<img width="800" alt="Image - 2020-12-03T101932 785" src="https://user-images.githubusercontent.com/71798208/101071159-1243fa00-3551-11eb-9723-64a76e14daaf.png">
<img width="800" alt="Image - 2020-12-03T101957 026" src="https://user-images.githubusercontent.com/71798208/101071185-1a039e80-3551-11eb-8770-5ba144e994ee.png">
<img width="474" alt="Image - 2020-12-03T102013 915" src="https://user-images.githubusercontent.com/71798208/101071224-2687f700-3551-11eb-834b-f3c9e9b32bd2.png">
<img width="800" alt="Image - 2020-12-03T102027 510" src="https://user-images.githubusercontent.com/71798208/101071247-2e479b80-3551-11eb-9aeb-1e54b2168f25.png">
<img width="800" alt="Image - 2020-12-03T102027 510" src="https://user-images.githubusercontent.com/71798208/101071695-cc3b6600-3551-11eb-92f9-80e3cf3dca83.png">


### 2.3 Upload an Image from Desktop:

    2.3.1 Here, Users can choose either from Desktop or from Facebook. In this example, I chose an image 
    "kids-Hoola-hooping" from desktop


<img width="500" alt="Image - 2020-12-02T231326 619" src="https://user-images.githubusercontent.com/71798208/100976213-0ece5580-34f4-11eb-912c-a33aff5cfbb2.png">

    2.3.2 Google Cloud vision API process the image and generates labels, and labels that have got more than 
    75% will be sent to Google Datastore with a prefix '#' along with image_id and image_url

<img width="777" alt="Image - 2020-12-02T221710 209" src="https://user-images.githubusercontent.com/71798208/100972300-6d440580-34ed-11eb-893f-fba98405becd.png">


<img width="821" alt="Image - 2020-12-02T221705 107" src="https://user-images.githubusercontent.com/71798208/100972305-6f0dc900-34ed-11eb-887f-dd18a99356f7.png">

    2.3.3 Retrieve the same information from the datastore and display it on the browser. Here, the user can 
    Share the image on Facebook with the generated hashtags by clicking "Share on Facebook" 

<img width="700" alt="Image - 2020-12-02T221715 960" src="https://user-images.githubusercontent.com/71798208/100972296-6c12d880-34ed-11eb-90da-ee5d675b3726.png">

    2.3.4 User can post the image by clicking the "Post on Facebook"



<img width="700" alt="Image - 2020-12-02T231320 303" src="https://user-images.githubusercontent.com/71798208/100976209-0d9d2880-34f4-11eb-9149-0fe5f98a3d4d.png">



    2.3.5 Posted Image on Timeline



<img width="709" alt="Image - 2020-12-02T221727 059" src="https://user-images.githubusercontent.com/71798208/100972288-69b07e80-34ed-11eb-8a03-af087d5d37cc.png">



## **3. GAE issues and GAE Datastore:**

In this project, we did not face any issue with the Google App Engine and Google Datastore but we faced an issue on the below scenarios 

### 3.1 Issues faced in this project:

    3.1.1 Cannot share multiple hashtags on Facebook along with an image because of a new policy by Facebook, If the 
    user wants an image to include a hashtag, then the user has to type by themselves.

    3.1.2 Instagram - In the Project proposal it has been mentioned that we also share an image with hashtags 
    on Instagram too but Instagram APIs are available only for Business accounts not for  Personal Facebook 
    profiles. 

### 3.2 Google DataStore:

    3.2.1 **Storing the Data:** In this Application, we store image_ID, image_URL, and resulting labels which 
    has a score above 75% to the Entity "User_images" in the datastore 
 
    3.2.2 Retrieving the Data: To retrieve the stored data, we run a query that pulls the specific row from 
    the "User_images" whose image_ID equals the one provided in the query and sends the response back 
    to the browser.

**And the Query we used is**   

`Query q = new Query("User_Images.")`
          `.setFilter(new Query.FilterPredicate("image_id", Query.FilterOperator.EQUAL, imageId));`

### 3.3 Datastore Dashboard:

We have created three Entity just for our verification and the one we used for our project is "User_Images"

    3.3.1 "User_Images" Entity

<img width="897" alt="Image - 2020-12-03T100621 569" src="https://user-images.githubusercontent.com/71798208/101069710-369ed700-354f-11eb-9342-5a17c7f1207b.png">

    3.3.2 "User_photo" Entity


<img width="800" alt="Image - 2020-12-03T100235 115" src="https://user-images.githubusercontent.com/71798208/101069495-f0497800-354e-11eb-9016-226715dfed92.png">

    3.3.3 "User_Photos" Entity

<img width="800" alt="Image - 2020-12-03T094157 435" src="https://user-images.githubusercontent.com/71798208/101066977-d22e4880-354b-11eb-93b6-6c4aa2111dc5.png">


### 3.4 Entity and the properties

<img width="844" alt="Image (89)" src="https://user-images.githubusercontent.com/71798208/100966910-de31f000-34e2-11eb-95ef-76503176dafc.png">


<img width="838" alt="Image (90)" src="https://user-images.githubusercontent.com/71798208/100966911-dffbb380-34e2-11eb-98fa-710674cf5b63.png">



### 3.3 Google App Engine:

**Dashboard:** 

<img width="835" alt="Image (88)" src="https://user-images.githubusercontent.com/71798208/100966907-dd00c300-34e2-11eb-9a64-eb4e177aeeed.png">


## **4. JAVA code Documentation:**

Java Doc: [Click here ](http://csweb01.csueastbay.edu/~sk9653/fb_project/)

## **5. Code:**

[Github Code repository path:](https://github.com/Kavithad04/Project1002)

[Images sent to Google Cloud Vision API](https://github.com/Kavithad04/Project1002/issues/7)

## **6. Youtube:**
[Youtube demonstration](https://www.youtube.com/watch?v=czw6c6dd068)

## 7. Analytics Report
[Report](https://drive.google.com/file/d/1oIfFwprbGrSYXfWt4-Zns51xgfNxg-fE/view?usp=sharing)



