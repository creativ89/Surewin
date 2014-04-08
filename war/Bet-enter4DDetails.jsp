<%@page import="model.*, java.util.*"%>
<%@page import="org.json.simple.JSONValue, org.json.simple.JSONArray, org.json.simple.JSONObject"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

	user normalUser = (user)session.getAttribute("authenticated");
		
	if (normalUser == null) {
			response.sendRedirect("mainPage.jsp");
			return;
	}
	
	int[] betPrice = {1,2,3,4,5,10,20,30,50,100};	
	int[] betNumber = {1,2,3,4,5,6,7,8,9};	
	
	//get all the information of the session
	String betCart = (String)session.getAttribute("betCart");
	if(betCart == null){
		betCart = "";
	}
	
	String betType = request.getParameter("betType");
	if(betType == null){
		betType="";
	}
			
	String drawDate = request.getParameter("drawDate");
	if(drawDate == null){
		drawDate = "";
	}
	
	String betBig = request.getParameter("betBig");
	if(betBig == null){
		betBig = "BIG";
	}
	String betSmall = request.getParameter("betSmall");
	if(betSmall == null){
		betSmall = "SMALL";
	}
%>

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
	
	function validate(evt) {
		  var theEvent = evt || window.event;
		  var key = theEvent.keyCode || theEvent.which;
		  key = String.fromCharCode( key );
		  var regex = /[0-9]|\./;
		  if( !regex.test(key) ) {
		    theEvent.returnValue = false;
		    if(theEvent.preventDefault) theEvent.preventDefault();
		  }
		}

	$(function() {
	    $('[rel=tooltip]').tooltip();
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
			<li class="active">4D Betting</li>
		</ol>	
		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">4D Betting</h1>
				</header>

								
				<% if (errorMsg == "")
				{
	
				}
				else{%>
					<div class="alert alert-danger"><%=errorMsg %></div>
				<%}%>
												
			<form class="form-horizontal" role="form"  action="processAddNumberToBetCart.do" method="get">
				<div class="form-group">
					<label class="col-sm-2 control-label">Bet Type
					<img src="image/info.jpeg" width="15" height="15" rel="tooltip"
					title="For more information, please visit the link at http://www.singaporepools.com.sg"  
					
					alt="Progressus HTML5 template">
					</label>
					<div class="col-sm-10">
						<select class="form-control" name="betType">
							<%if(!betType.equals("")){ %>
								<option value="<%=betType%>"><%=betType%></option>
							<%} %>
							 <option value="ordinary">Ordinary</option>
							 <option value="system">System Entry</option>
							 <option value="ibet">iBet</option>
							 <option value="4droll">4D Roll</option>
						</select>
					</div>
			  	</div>
			  	<div class="form-group">
					<label class="col-sm-2 control-label">Draw Date</label>
					<div class="col-sm-10">
						<input name="drawDate" type="text" class="form-control" id="datepicker" value="<%=drawDate %>" readonly="readonly" placeholder="Select A Date">
					</div>
			  	</div>
			  <div class="form-group">
				<label class="col-sm-2 control-label">Bet Amount</label>
				<div class="col-sm-5">
					<select class="form-control" name="betBig">
						<%if(betBig.equals("BIG")){ %>
						<option value="0">BIG</option>
						<%}else{ %>
						<option value="<%=betBig%>">$<%=betBig%></option>
						<%} %>
						<%for(int i:betPrice){ %>
							<option value="<%=i%>">$<%=i%></option>
						<%} %>	
					</select>
				</div><br>
				<div class="col-sm-5">
					<select class="form-control" name="betSmall">
						<%if(betSmall.equals("SMALL")){ %>
						<option value="0">SMALL</option>
						<%}else{ %>
						<option value="<%=betSmall%>">$<%=betSmall%></option>
						<%} %>
						<%for(int i:betPrice){ %>
							<option value="<%=i%>">$<%=i%></option>
						<%} %>
					</select>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Numbers Selected</label>
					<div class="col-sm-10">
						<input type="text" name="betNumber" class="form-control" placeholder="Enter a Number"  onkeypress='validate(event)' maxlength="4">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					  <button type="submit" class="btn btn-default">Add</button>
					</div>
				</div>			  
			</form>
			<br>	
			<!--  
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">-->
			<%if(!betCart.equals("")){%>
			<div class="row">				
				<div class="table">										
						<table class="table">			
							
							<tr>
								<th>Date</th><th>Number</th><th>Information</th><th ><span style="padding: 0 2px">&nbsp;</span></th>
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
									<%=(String)test.get("type")%>
								</td>
								<td><a href="processRemoveNumberFromBetCart.do?itemRow=<%=(String)test.get("id")%>">X</a></td>
							</tr>
			
							<%}%>
						</table>				
					</div>										
				</div>
				<a href="Bet-paymentPage.jsp" class="btn btn-primary" role="button">Buy</a><br><br>
				<%} %>		
			
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->

	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
</body>
</html>