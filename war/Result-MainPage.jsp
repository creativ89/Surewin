<!DOCTYPE html>
<html lang="en">
<head>
<!-- header includes standard bootstrap stylesheet and css -->
<%@include file="common/header.jsp"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">

<script>	
	$(function() {
		$("#datepicker").datepicker( { 
			dateFormat: 'dd/mm/yy',
		    beforeShowDay: function(date) {
		        var day = date.getDay();
		        return [(day != 1 && day != 2 && day != 4 && day != 5), ''];
		    }
		 });		
	});
</script>
</head>

<body>
	<%@include file="common/navBarAfterLogin.jsp"%>

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">
		<br><br><br><br>
		<ol class="breadcrumb">
			<li><a href="User-MainPage.jsp">Home</a></li>
			<li class="active">4D Results</li>
		</ol>

		<div class="row">			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">4D Results</h1>
				</header>

				<form class="form-inline" role="form" action="Result-drawDate.jsp" method="get">
					<input name="drawDate" type="text" class="form-control" id="datepicker" readonly="readonly" placeholder="Find A Particular Draw"><br>
					<button type="button" class="btn btn-primary">Search</button><br><br>
				</form>


				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Draw Date</th>
						</tr>
						<tr>
						    <td><a href="/Result-drawDate.jsp?drawNo=0001&drawDay=Wed&drawDate=29/01/2014">Wed 29/01/2014</a></td>
					    </tr>
					    <tr>
					 	    <td><a href="/Result-drawDate.jsp?drawNo=0002&drawDay=Sat&drawDate=01/02/2014">Sat 01/02/2014</a></td>
					    </tr>
					    <tr>
					  	    <td><a href="/Result-drawDate.jsp?drawNo=0003&drawDay=Sun&drawDate=02/02/2014">Sun 02/02/2014</a></td>
					    </tr>
					</table>
				</div>

				<header class="page-header">
					<h1 class="page-title">4D Match</h1>
				</header>
				<p align="center">
				<button type="button" class="btn btn-default" onclick="window.location='/Match-enter4DDetails.jsp';">Enter 4D Details</button>
				<button type="button" class="btn btn-default" onclick="window.location='/Match-capturePicture.jsp';">Capture 4D  Slip</button>
				</p>
				<!-- 
				<ul class="nav nav-pills nav-justified">
				  <li><a href="Match-enter4DDetails.jsp">Enter 4D Details</a></li>
				  <li><a href="Match-capturePicture.jsp">Capture 4D Slip</a></li>
				</ul>
				 -->
				

			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->

	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
</body>
</html>