<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

	user normalUser = (user)session.getAttribute("authenticated");
	
	userDataManager udm = new userDataManager();
	user modifiedUser = udm.retrieve(normalUser.getId());
	if (normalUser == null || modifiedUser ==null) {
			response.sendRedirect("mainPage.jsp");
			return;
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
			<li class="active">Setting</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Setting</h1>
				</header>
				
				<form class="form-horizontal" role="form">
				<div class="form group" align="center">
					<label class="col-xs-7 control-label"></label>
					<div class="col-xs-5">		
						<button type="button" class="btn btn-primary" onClick="window.location='/User-editAccountSettings.jsp';">Edit</button>
					</div><br><br><br>
				</div>				
				
					<div class="form-group" align="center">
						<label class="col-xs-4 control-label">Name</label>
						<div class="col-xs-8">
							<p class="form-control-static"><%=modifiedUser.getFullname()%></p>
						</div>
					</div>
					
					<div class="form-group" align="center">
						<label class="col-xs-4 control-label">Password</label>
						<div class="col-xs-8">
							<p class="form-control-static">******</p>
						</div>
					</div>

					<div class="form-group" align="center">
						<label class="col-xs-4 control-label">Date of Birth</label>
						<div class="col-xs-8">
							<p class="form-control-static"><%=modifiedUser.getDateOfBirth()%></p>
						</div>
					</div>

					<div class="form-group" align="center">
						<label class="col-xs-4 control-label">Contact No.</label>
						<div class="col-xs-8">
							<p class="form-control-static"><%=modifiedUser.getMobileNo()%></p>
						</div>
					</div>					

					<div class="form-group" align="center">
						<label class="col-xs-4 control-label">Bet Limit</label>
						<div class="col-xs-8">
							<p class="form-control-static">$<%=modifiedUser.getBetLimit()%></h4></p>
						</div>
					</div>					
				</form>
				
			
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