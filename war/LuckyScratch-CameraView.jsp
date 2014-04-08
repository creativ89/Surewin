<!DOCTYPE html>
<html lang="en">
<head>
<!-- header includes standard bootstrap stylesheet and css -->
<%@include file="common/header.jsp"%>
</head>

<body>
	<%@include file="common/navBarAfterLogin.jsp"%>

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">
		<br><br><br><br>
		<ol class="breadcrumb">
			<li><a href="User-MainPage.jsp">Home</a></li>
			<li class="active">4D Number Generator</li>
		</ol>
		<div class="row">
			
			<!-- Article main content -->
		  <article class="col-xs-12 maincontent">
			<object height="1" width="1" data="assets/media/cameraShutter.mp3"></object>
			<img src="assets/images/shoe.gif" class="img-thumbnail" alt="Responsive image">
	<p></p>
    <div class="row">
    
    <div class="col-xs-5">
	<button type="button" id="startbutton" class="btn btn-default"  onclick="window.location='/User-MainPage.jsp';">Back</button>
    </div>
    <div class="col-xs-1"></div>
    <div class="col-xs-5">
	<button type="button" class="btn btn-primary" onclick="window.location='/LuckyScratch-scratchToWin.jsp';">Submit</button>
	</div>
    <div class="col-xs-1"></div>
    </div><br>
            </article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>