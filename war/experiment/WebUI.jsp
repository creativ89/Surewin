<% 
/*
String layout = (String)session.getAttribute("layout");
if(layout == null || layout.equals("")){
	response.sendRedirect("introductionPage.jsp");
}

Long currentUserId = (Long)session.getAttribute("testerId");
if(currentUserId == null || currentUserId.equals("")){
	response.sendRedirect("introductionPage.jsp");
}*/
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

<title>SureWin</title>

<link rel="shortcut icon" href="../assets/images/gt_favicon.png">

<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/font-awesome.min.css">

<!-- Custom styles for our template -->
<link rel="stylesheet" href="../assets/css/bootstrap-theme.css" media="screen">
<link rel="stylesheet" href="../assets/css/main.css">

<style type="text/css">
#over {
    background-image: url("/image/iphone-830-420.jpg");
    background-repeat: no-repeat;
    height: 850px;
    width: 500px;
    margin: 0 auto 30px;
    position: relative;
  
}


iframe {
    overflow:hidden;
    position: absolute;
    top: 110px;
    left: 53px;
}
</style>

<script language="javascript" type="text/javascript">
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
</script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body class="home">
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container1">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img
					src="../assets/images/logo2.png" alt="Progressus HTML5 template"></a>
			</div>
			
		</div>
	</div>
	<!-- /.navbar -->
	<br><br><br><br>
	<div class="container">	
		<div class="row">
		  <div class="col-xs-6">
		  <br>
		  <br>
		  		<h3>Web User Interface</h3>
		  </div>
		  		  
		  <div class="col-xs-6">
		  	<h3>Layout 2</h3>
			<div id="over" align="center">

			<iframe src="http://g3t5-surewin-v2.appspot.com//mainPage.jsp" width="320" height="580" frameborder="0"></iframe>
	
				
			</div>
		  </div>
		</div>
	</div>
	<!-- /Highlights -->

	
	<!-- Social links. @TODO: replace by link/instructions in template -->
	<section id="social">
		<div class="container">
			<div class="wrapper clearfix">
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style">
				<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_linkedin_counter"></a>
				<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
				</div>
				<!-- AddThis Button END -->
			</div>
		</div>
	</section>
	<!-- /social links -->

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>