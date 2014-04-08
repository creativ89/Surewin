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
			<li><a href="mainPage.jsp">Home</a></li>
			<li><a href="Bet-enter4DDetails.jsp">4D Betting</a></li>
			<li class="active">4D Payment</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">4D Payment</h1>
				</header>

			<form class="form-horizontal" role="form" action="processSaveBetCart.do" method="post">
			  <div class="form-group">
				<label class="col-sm-2 control-label">Cardholder Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Enter name" value="not required for test">
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label">Card Number</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Enter card number" value="not required for test">
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label">Expiry Date</label>
				<div class="col-sm-10">
					<input type="datetime" class="form-control" placeholder="Select A Date" value="test">
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label">CVC2/CVV2</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" value="test">
				</div>
			  </div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Buy</button>		
							
					</div>
				</div>			  
			</form>
					
				<br>	
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				</div>
				

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