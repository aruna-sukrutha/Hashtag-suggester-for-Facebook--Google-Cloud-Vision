<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-5HNZSEY6VK"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'G-5HNZSEY6VK');
	</script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>HashTag Suggester</title>
	<style>
		body {
			font: 400 15px Lato, sans-serif;
			line-height: 1.8;
			color: #191970;
			/* background: linear-gradient(to bottom, #ccffcc 0%, #66ccff 100%); */
			background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRsQXq_B2dOYZ3jwtesD6jX_07MOvCUJE6LA&usqp=CAU');
        
		}
		h2 {
			font-size: 24px;
			text-transform: uppercase;
			color: #303030;
			font-weight: 600;
		}
		.btn:not(:disabled):not(.disabled) {
			cursor: pointer;
			color: #f8f9fa;
		}
		.btn-success {
			background-color: #0062cc;
			border-color: #0062cc;
		}
		h4 {
			font-size: 19px;
			line-height: 1.375em;
			color: #303030;
			font-weight: 400;
			margin-bottom: 30px;
		}
		.container-fluid {
		    box-sizing: border-box;
			padding: 60px 50px;
			/* background: linear-gradient(to bottom, #ccffcc 0%, #66ccff 100%); */
			background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRsQXq_B2dOYZ3jwtesD6jX_07MOvCUJE6LA&usqp=CAU');
        
		}
		.bg-image 
		{
            /* background: linear-gradient(to bottom, #ccffcc 0%, #66ccff 100%); */
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRsQXq_B2dOYZ3jwtesD6jX_07MOvCUJE6LA&usqp=CAU');
        
            filter: blur(8px);
            -webkit-filter: blur(8px);
            height: 100%;  
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
		.bg-grey {
			background-color: #f6f6f6;
		}
		.item h4 {
			font-size: 19px;
			line-height: 1.375em;
			font-weight: 400;
			font-style: italic;
			margin: 70px 0;
		}
		.item span {
			font-style: normal;
		}
		.panel-footer .btn:hover {
			border: 1px solid #f4511e;
			background-color: #fff !important;
			color: #f4511e;
		}
		.panel-footer h3 {
			font-size: 32px;
		}
		.panel-footer h4 {
			color: #aaa;
			font-size: 14px;
		}
		.panel-footer .btn {
			margin: 15px 0;
			background-color: #f4511e;
			color: #fff;
		}
		.img-container {
			margin-left: auto;
			margin-right: auto;
			text-align: center;
			display: block;
			width:100%;
		}
		.hash-table {
			margin: auto;
			margin-top: 20;
		}
	</style>
  </head>
<body>
 <left><a href="https://hashtag-generate.uc.r.appspot.com/"><img src="http://lh3.googleusercontent.com/hvMFwzL4Ayx7RPoSqSowlOFAO_d_Z3Rsu_DMuMmWP9UHbffOBqI3b3ShjYGRrv8QAHkEiljmdYCwtucz9v3V4i6dcE1OUbJJWdPUd2RZk40" height="120px" width="200px"></a></left>
<!-- fb acript -->
<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId      : '288101902807985',
			xfbml      : true,
			version    : 'v10.0'
		});
		FB.AppEvents.logPageView();
	};
	(function(d, s, id){
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {return;}
		js = d.createElement(s); js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>

<!-- twitter acript -->
<script>
$(document).ready(function() {
   //Change quote on page
   $('#quoteBtn').click(function() {
      $('h3').html('Here is a new quote.');
   });
   
   //Change twitter content to share to new quote
   $('#quoteBtn').click(function(val) {
    val.preventDefault();
    
      // Remove existing iframe
    $('#tweet iframe').remove();
    
      //For generic button
    var newTweet = $('<a></a>')
    String url=request.getAttribute("imageUrl");
        .addClass('twitter-share-button')
        .attr('href', 'https://twitter.com/share')
        .attr('data-url',request.getAttribute("imageUrl"))
        .attr('data-text', 'Here is a new quote.')
        .attr('data-hashtags', request.getAttribute("imageLabels"))
         .attr('data-count', 'none');
    $('#tweet').append(newTweet);
   
      //For custom button
    var baseTweet = "https://twitter.com/intent/tweet?url=http%3A%2F%2Fexample.com&text=";
    var newText = 'Here is a new Quote';
    var encoded = encodeURI(newText);
    var customTweet = baseTweet += encoded;
    $('#tweet-custom > a').attr('href', customTweet);
    
    twttr.widgets.load();
   });
      
});
</script>

<div id="portfolio" class="container-fluid text-center bg-grey">
	<h2>HashTags for the Image</h2><br>
	<div class="row text-center " float="left" width=60%>
		<div class="col-sm-12">
			<div class="img-container">
				<img src="<%=request.getAttribute("imageUrl")%>" height=250px width=250px>
				<table class="hash-table">
					<tbody>
					<tr>

							<td><p><strong>${imageLabels}</strong></p></td>


					</tr>
					</tbody>
				</table>

			</div>
		</div>


	</div>

	<div id="shareBtn" class="btn btn-success clearfix">Share Image on Facebook</div>
	<br><br>
	<div class="container">
        
         <div id="tweet">
            <a class="twitter-share-button" href="https://twitter.com/share" data-url="<%=request.getAttribute("imageUrl")%>" data-hashtags="<%=request.getAttribute("imageLabels")%>" data-text="HashTag Suggester" data-count="none">Tweet</a>
         </div>
    </div>
<!--Javascript from Twitter-->
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

	
	<div id="alert" style="display:none" class ="alert alert-success"> <strong > Success!</strong> Posted Image with HashTag on Facebook.
	</div>
	<a href="/">Reset Image</a>
</div><br>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">
	function homepage(){
		window.location.href = "/";
	}
	document.getElementById('shareBtn').onclick = function() {
		FB.ui({
			display: 'popup',
			method: 'share',
			href: '<%=request.getAttribute("imageUrl")%>',
			hashtag:'${imageLabels}',
			quote:'${imageLabels}',
		}, function(response){
			if(response && !response.error) {
				document.getElementById('alert').style.display='block';
				setInterval(homepage, 4000);
			}
		});
	}
</script>
</body>
</html>