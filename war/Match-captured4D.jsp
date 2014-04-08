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
			<li><a href="Result-MainPage.jsp">4D Result</a></li>
			<li><a href="Match-capturePicture.jsp">4D Match Snapshot</a></li>
			<li class="active">4D Match confirmation</li>
		</ol>
		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Snapshot</h1>
				</header>

				<div class="table-responsive">
					<table class="table">
                    <tr>
						<td>Ticket No.</td>
						<td>128-55556803-095908</td>
                     </tr>
                      <tr>
						<td>Draw Date</td>
						<td>SAT 01/02/14</td>
                     </tr>
                     <tr>
						<td></td>
						<td>SUN 02/02/14</td>
                     </tr>
					</table>
				</div>
				
				<div class="table-responsive">
					<table class="table">
					<tr>	
                        <th>No.</th>
						<th>Number</th>
						<th>Information</th>
                    </tr>
                    <tr>	
                        <td>1)</td>
						<td>2000</td>
						<td>BIG $2<br>SML $0<br>Type: 4 permutations</td>
                      
                    </tr>
                    <tr>	
                        <td>2)</td>
						<td>0276</td>
						<td>BIG $4<br>SML $0<br>Type: 24 permutations</td>
                    </tr>
					</table>
				</div>
					
				<div class="form-group">
						<button type="submit" class="btn btn-default" onclick="window.location='/Match-capturePicture.jsp';">Recapture</button>
						<button type="button" class="btn btn-primary" onclick="window.location='/DashBoard-BetHistory.jsp';">Store</button>
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