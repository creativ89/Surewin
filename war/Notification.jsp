<%@page import="model.*, java.util.*"%>

<%
user normalUser2 = (user)session.getAttribute("authenticated");

if (normalUser2 == null) {
	response.sendRedirect("mainPage.jsp");
	return;
}
notificationDataManager ndm = new notificationDataManager();
List<notification> notifications = ndm.retrieveAllUserNotification(normalUser2.getUsername());
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
			<li class="active">Notification</li>
		</ol>

		<div class="row">			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Notification</h1>
				</header>
				<table class="table table-striped">
					<%for(notification n : notifications){ %>
					<tr>
						<td><%=n.getMessage() %><br>
						
							<font size="2"><%=n.getDateTime() %></font>
						</td>
					</tr>
					<%} %>
				</table>
				
				

			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	
</body>
</html>