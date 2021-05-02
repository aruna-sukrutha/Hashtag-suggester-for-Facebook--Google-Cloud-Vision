
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

    <title>Label Detection</title>
	<style>
		body {
			font: 400 15px Lato, sans-serif;
			line-height: 1.8;
			color: #818181;
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
			padding: 60px 50px;
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
<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId      : '2243976699080326',
			xfbml      : true,
			version    : 'v9.0'
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
<div id="portfolio" class="container-fluid text-center bg-grey">
	<h2>HashTag Generator</h2><br>
	<div class="row text-center ">
		<div class="col-sm-12">
			<div class="img-container">
				<img src="<%=request.getAttribute("imageUrl")%>" >
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
	<div id="alert" style="display:none" class ="alert alert-success"> <strong > Success!</strong> Posted Image with HashTag on Facebook.
	</div>
	<a href="/">Reset Image</a>
</div><br>


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