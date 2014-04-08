<!DOCTYPE html>
<html lang="en">
<head>
<!-- header includes standard bootstrap stylesheet and css -->
<%@include file="common/header.jsp"%>
<!-- Google graph javascript -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Year', 'Winning', 'Loss' ], 
				[ '2014', 100, 1000 ],
				[ '2013', 1030, 540 ],
				[ '2012', 660, 1120 ],
				[ '2011', 1170, 460 ], 
				[ '2010', 1000, 400 ]									
				]);

		var options = {
			hAxis : {
				title : "Years",
				direction : -1,
				slantedText : true,
				slantedTextAngle : 90
			},
			vAxis : {
				title : "Amount",
				direction : 1,
				slantedText : true,
				slantedTextAngle : 90
			},
			'backgroundColor': {
    	        'fill': '#F4F4F4',
    	        'opacity': 100
    	     }
		}

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
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
			<li class="active">4D Dashboard</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">4D Dashboard</h1>
				</header>

				<div class="btn-group btn-group-justified">
				  <div class="btn-group">
					<button type="button" class="btn btn-default active" >Analysis</button>
				  </div>
				  <div class="btn-group">
					<button type="button" class="btn btn-default" onclick="window.location='DashBoard-BetHistory.jsp';">History</button>
				  </div>				  
				</div><br>						
	
				<div id="chart_div" style="width: 100%; height: 250px;" align="center"></div>
		
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