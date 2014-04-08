<%@include file="common/header.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	String drawNo = request.getParameter("drawNo");
	if (drawNo == null) {
		drawNo = "0004";
	}
	
	String drawDate = request.getParameter("drawDate");
	
	String drawDay = request.getParameter("drawDay");
	if (drawDay == null) {
		SimpleDateFormat format1=new SimpleDateFormat("dd/MM/yyyy");
		Date dt1=format1.parse(drawDate);
		DateFormat format2=new SimpleDateFormat("EEE"); 
		drawDay=format2.format(dt1);
	}
		
	String order = request.getParameter("order");
	
	ArrayList<String> topThree = new ArrayList<String>();
	topThree.add("7602");
	topThree.add("5163");
	topThree.add("4638");
	
	ArrayList<String> starterPrizes = new ArrayList<String>();
	starterPrizes.add("7309");
	starterPrizes.add("1648");
	starterPrizes.add("5943");
	starterPrizes.add("4859");
	starterPrizes.add("9483");
	starterPrizes.add("1435");
	starterPrizes.add("4028");
	starterPrizes.add("5873");
	starterPrizes.add("2935");
	starterPrizes.add("0908");
		
	ArrayList<String> consolationPrizes = new ArrayList<String>();
	consolationPrizes.add("4647");
	consolationPrizes.add("1947");
	consolationPrizes.add("5637");
	consolationPrizes.add("1546");
	consolationPrizes.add("9436");
	consolationPrizes.add("0184");
	consolationPrizes.add("3956");
	consolationPrizes.add("9485");
	consolationPrizes.add("1536");
	consolationPrizes.add("7346");
	
	if (order != null) {
		if (order.equals("asc")) {
			Collections.sort(starterPrizes);
			Collections.sort(consolationPrizes);
		}
		
		else if (order.equals("desc")) {
			Comparator comparator1 = Collections.reverseOrder();
			Collections.sort(starterPrizes, comparator1);
			
			//Comparator comparator2 = Collections.reverseOrder();
			Collections.sort(consolationPrizes, comparator1);
		}
	}
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
			<li><a href="Result-MainPage.jsp">4D Results</a></li>
			<li class="active"><%=drawDay %> <%=drawDate %></li>
		</ol>
		
		<div class="row"> 
    
    	<!-- Article main content -->
    	<article class="col-xs-12 maincontent">
      	<header class="page-header">
      		<h1 class="page-title">4D Result</h1>
      	</header>
	    <!--  
	    <div class="table-responsive">
        <table class="table">
          <tr>
            <th>Draw Date</th>
            <td>SAT 01/02/14</td>
          </tr>
        </table>
      </div>
      -->  
      <div class="table">
        <table class="table table-bordered">
          <tr>
            <th>1st Prize</th>
            <td><%= topThree.get(0) %></td>
          </tr>
          <tr>
            <th>2nd Prize</th>
            <td><%= topThree.get(1) %></td>
          </tr>
          <tr>
            <th>3rd Prize</th>
            <td><%= topThree.get(2) %></td>
          </tr>
        </table>
      </div>
    
      <p><b>Sort by:</b> <a href="/Result-drawDate.jsp?order=asc&drawNo=<%= drawNo %>&drawDay=<%= drawDay %>&drawDate=<%= drawDate %>">Ascending</a> | <a href="/Result-drawDate.jsp?order=desc&drawNo=<%= drawNo %>&drawDay=<%= drawDay %>&drawDate=<%= drawDate %>">Descending</a></p>

      <div style="float:left; width:50%;">
        <table class="table table-bordered">
          <tr>
            <th colspan = "2" align="center"><font size="1">Starter Prizes</font></th>
          </tr>
          <tr>
          <td align="center"><%= starterPrizes.get(0) %></td>
          <td align="center"><%= starterPrizes.get(1) %></td>
        </tr>
        <tr>
          <td align="center"><%= starterPrizes.get(2) %></td>
          <td align="center"><%= starterPrizes.get(3) %></td>
        </tr>
        <tr>
          <td align="center"><%= starterPrizes.get(4) %></td>
          <td align="center"><%= starterPrizes.get(5) %></td>
        </tr>
        <tr>
          <td align="center"><%= starterPrizes.get(6) %></td>
          <td align="center"><%= starterPrizes.get(7) %></td>
        </tr>
        <tr>
          <td align="center"><%= starterPrizes.get(8) %></td>
          <td align="center"><%= starterPrizes.get(9) %></td>
        </tr>  

        </table>
      </div>
      <div style="float:left; width:50%;">
			<table class="table table-bordered">
			  <tr>
				  <th colspan="2" align="center"><font size="1">Consolation Prizes</font></th>
			  </tr>
			  <tr>
			 	  <td align="center"><%= consolationPrizes.get(0) %></td><td align="center"><%= consolationPrizes.get(1) %></td>
			  </tr>
			  <tr>
			  	  <td align="center"><%= consolationPrizes.get(2) %></td><td align="center"><%= consolationPrizes.get(3) %></td>
			  </tr>
			  <tr>
			 	  <td align="center"><%= consolationPrizes.get(4) %></td><td align="center"><%= consolationPrizes.get(5) %></td>
			  </tr>
			  <tr>
			  	  <td align="center"><%= consolationPrizes.get(6) %></td><td align="center"><%= consolationPrizes.get(7) %></td>
			  </tr>
			  <tr>
			 	  <td align="center"><%= consolationPrizes.get(8) %></td><td align="center"><%= consolationPrizes.get(9) %></td>
			  </tr>
			</table> 
		</div>

      <div class="span10" align="center">
	<button type="button" class="btn btn-default" onclick="window.location='/Result-MainPage.jsp';">Back</button>
	</div>
    </article>
    <!-- /Article --> 
    
  </div>
</div>
<!-- /container --> 
<!-- JavaScript libs are placed at the end of the document so the pages load faster --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script> 
<script src="assets/js/headroom.min.js"></script> 
<script src="assets/js/jQuery.headroom.min.js"></script> 
<script src="assets/js/template.js"></script>
</body>
</html>