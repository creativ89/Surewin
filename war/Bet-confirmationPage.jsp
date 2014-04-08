<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONValue, org.json.simple.JSONArray, org.json.simple.JSONObject"%>
<%

String betCart = (String)session.getAttribute("betCart");
if(betCart == null || betCart.equals("")){
	betCart = "";
}
session.removeAttribute("betCart");	

Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//System.out.println(sdf.format(date));
%>
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

		<div class="row">
			<br><br><br>
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Payment Confirmation</h1>
				</header>

				<form class="form-horizontal" role="form">
					<h4>You have successfully placed your bet on the following:</h4><br>
					<h5>Purchase Date: <u><%=sdf.format(date) %></u></h5>
				</form><br><br>
				
				<div class="table">
					<table class="table">
						<tr>
							<th>Date</th>
							<th>Number</th>
							<th>Information</th>
						</tr>
						<%	
							Object obj = JSONValue.parse(betCart);
							JSONObject reqObj = (JSONObject) obj;		
							JSONArray allItem = (JSONArray) reqObj.get("item"); 
							
							int numberOfLoop = allItem.size();
							for(int i=0;i<numberOfLoop;i++){ 
								JSONObject test = (JSONObject)allItem.get(i);
							%>
							
							<tr>
								<td><%=(String)test.get("drawDate")%></td>
								<td><%=(String)test.get("betNumber")%></td>		
									
								<td>$<%=(String)test.get("betBig")%> big,
								$<%=(String)test.get("betSmall")%> sml,
								<%=(String)test.get("type")%></td>
									
							</tr>
						<%}%>		
					
					</table>
				</div>
					
				<button type="button" class="btn btn-primary" onClick="window.location='/DashBoard-BetHistory.jsp';">View Bet History</button><br><br>
			
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