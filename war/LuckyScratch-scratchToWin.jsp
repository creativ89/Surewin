<%@page import="model.*, java.util.*"%>
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
			<li><a href="LuckyScratch-CameraView.jsp">4D Generator</a></li>
			<li class="active">4D Number</li>
		</ol><br>

		<div class="row">
			
			<!-- Article main content -->
		  <article class="col-xs-12 maincontent">
			<div class="row">
			  <div class="col-sm-6 col-md-12">
			    <div class="thumbnail">
			      <img src="assets/images/shoe.jpg" alt="Responsive image">
			      <div class="caption">
			        <h1>Pair of Shoes</h1>
			        <p><h2>Lucky rating: <%=new Random().nextInt(100) %>%</h2></p>
			      </div>
			    </div>
			  </div>
			</div>		

		<br>
		<div class="span10" align="center">
			<h4>Random number generated</h4>
			<img src="assets/images/randomNumber.png" alt="" align="center"  width="200" height="100" />
			
		</div>
		<br>
		
		<div class="span10" align="center">		
			<button type="button" class="btn btn-primary" onclick="window.location='/Bet-enter4DDetails.jsp';">Purchase</button>
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