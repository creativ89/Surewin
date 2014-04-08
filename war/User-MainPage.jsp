<!DOCTYPE html>
<html lang="en">
<head>
<!-- header includes standard bootstrap stylesheet and css -->
<%@include file="common/header.jsp"%>
</head>

<body>
	<%@include file="common/navBarAfterLogin.jsp"%>
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">
		<!-- 
		<ol class="breadcrumb">
			<li><a href="User-MainPage.jsp">Home</a></li>
			<li class="active">User Profile</li>
		</ol>
 -->
		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
                	<div class="row">
                    <div class="col-xs-5"><img src="assets/images/Rosanne.png" alt="" align="right" width="100" height="100" /></div>
                    <div class="col-xs-7"><h4>Welcome</h4> <h2>Sweet Chin </h2></div>
                    </div>
                    
				</header>
					<h3 class="text-center thin">Winnings vs. Expenditures</h3>
                    		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
   <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Element', 'SGD$', { role: 'style' }, { role: 'annotation' } ],
          
          ['', 200, 'gold', 'Total Winnings($)' ],
      	  ['', 1500, 'color: #e0440e', 'Total Expenditures($)' ]
          
        ]);

        var options = {
        	hAxis : {
    			title : "Amount",
    		},
    		'backgroundColor': {
    	        'fill': '#F4F4F4',
    	        'opacity': 100
    	     },
			legend: { position: 'none'},
			 
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      $(document).ready(function () {
    	    $(window).resize(function(){
    	        drawChart();
    	    });
    	});
    </script>
			 
			<div id="chart_div" style="width:100%"></div>
					
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