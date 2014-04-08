<%@page import="model.*, java.util.*, java.text.SimpleDateFormat,java.text.DateFormat"%>

<%

user normalUser = (user)session.getAttribute("authenticated");

betHistoryDataManager bhm = new betHistoryDataManager();
List<betHistory> bhs = bhm.retrieveAllUserbetHistory(normalUser.getId());

List<betHistory> bhsSorted = new ArrayList<betHistory>();
if(bhs == null || bhs.size()==0){

}else{
	//not null 
	Map<Date, Long> yourMap = new HashMap<Date, Long>();
	for(betHistory bh: bhs){
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(bh.getDrawDate());
		yourMap.put(date,bh.getId());
	}
	//sorted map of the date and id
	Map<Date, Long> sortedMap = new TreeMap<Date, Long>(yourMap).descendingMap();
	Iterator it = sortedMap.entrySet().iterator();
	while (it.hasNext()) {
		Map.Entry pairs = (Map.Entry)it.next();
		for(betHistory bh: bhs){
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String reportDate = df.format(pairs.getKey());
			if(reportDate.equals(bh.getDrawDate())){
				bhsSorted.add(bh);
			}
		}
			 
	}
}

String number = request.getParameter("limit");
int numberToShow = 10;
if(number== null){
	
}else{
	numberToShow = numberToShow + Integer.parseInt(number);
}
boolean maxReached=false;
//check that the max size must not be more than the limit
if(numberToShow >= bhsSorted.size() || numberToShow < 10){
	numberToShow = bhsSorted.size();
	maxReached=true;
}


/*
String string = "12/04/1989";
Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(string);
string = "10/03/1989";
Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(string);
string = "12/05/1989";
Date date3 = new SimpleDateFormat("dd/MM/yyyy").parse(string);

Map<Date, String> yourMap = new HashMap<Date, String>();
yourMap.put(date1,"1");
yourMap.put(date2,"2");
yourMap.put(date3,"3");
Map<Date, String> sortedMap = new TreeMap<Date, String>(yourMap).descendingMap();
*/

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
					<button type="button" class="btn btn-default" onclick="window.location='/DashBoard-Analysis.jsp';">Analysis</button>
				  </div>
				  <div class="btn-group">
					<button type="button" class="btn btn-default active">History</button>
				  </div>
				  
				</div><br>				
				
				<div class="row">
					<%if(bhs.size()==0){ %>
					 <font size="4" color="red">You had not made any purchases</font>
					<%}else{ %>
						<table class="table">
							<tr>
								<th>Draw date</th><th>BIG</th><th>SML</th><th>Type</th><th>Number</th>
							</tr>
							<%
							for(int i=0;i<numberToShow;i++){
							//for(betHistory bh: bhsSorted){ 
							%>
								<tr>
									<td><%=bhsSorted.get(i).getDrawDate() %></td>
									<td>$<%=bhsSorted.get(i).getBetBig()%></td>
									<td>$<%=bhsSorted.get(i).getBetSmall() %></td>
									<td><%=bhsSorted.get(i).getType() %></td>
									<td><%=bhsSorted.get(i).getBetNumber()%></td>
								</tr>				
							<%} %>
						</table>
						<%if(maxReached == false){ %>
						<p align="center"><a href="?limit=<%=numberToShow %>">More</a></p>		
						<%} %>
					<%} %>
				</div>
				
				<!-- 
				<div class="table-responsive">
					<table class="table">
						<th>Draw Date</th>
						<th>BIG</th>
						<th>SML</th>
						<th>Type</th>
						<th>Number</th>
						<tr>
							<td>Wed 11/02/14</td>
							<td>$0</td>
							<td>$4</td>
							<td>Ordinary</td>
							<td>1414</td>
						</tr>
					</table>
				</div>	 -->
				
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