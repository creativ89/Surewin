<%@page import="model.*, java.util.*"%>
<%
	
	String errorMsg = request.getParameter("errMsg");
	if(errorMsg == null){
		errorMsg = "";
	}

%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- header includes standard bootstrap stylesheet and css -->
<%@include file="common/header.jsp"%>
</head>

<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">
			<div class="navbar-header">
				
				<a class="navbar-brand" href="mainPage.jsp"><img
					src="assets/images/logo2.png" alt="Progressus HTML5 template"></a>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="mainPage.jsp">Home</a></li>
			<li class="active">Registration</li>
		</ol><br>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Register a new account</h3>
							<p class="text-center text-muted">If you have created an account, click <a href="User-Signin.jsp">here </a> to go back to log in. </p>
							<hr>

							<form method="post" action="processAddUser.do">
								<div class="top-margin">
								
								<% if (errorMsg == "")
									{
	
									}
									else{%>
										<div class="alert alert-danger"><%=errorMsg %></div>
									<%}%>
									
									<label>Full Name</label>
									<input type="text" class="form-control" name="fname">
								</div>								
								<div class="top-margin">
									<label>Email<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="email">
								</div>						
								<div class="top-margin">
									<label>Mobile No<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="mobileNo">
								</div>
								
								<div class="top-margin">
									<label>Date of Birth<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="dob" placeholder="DD/MM/YYYY">
								</div>

								<div class="row top-margin">
									<div class="col-sm-6">
										<label>Username<span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="username">
									</div>
									<div class="col-sm-6">
										<label>Password <span class="text-danger">*</span></label>
										<input type="password" class="form-control" name="password">
									</div>
								</div>

								<hr>

								<div class="row">								
									<div class="col-lg-4 text-right">
										<button class="btn btn-action" type="submit">Register</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	
<%@include file="common/footer.jsp"%>
</body>
</html>