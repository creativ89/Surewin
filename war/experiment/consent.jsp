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


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	
<script type=text/javascript>
function validate(){
    var remember = document.getElementById('remember');
    if (remember.checked){
    	window.location.assign("instruction.jsp")
    }else{
        alert(" Please agree to the term and privacy policy before proceeding.")
    }
}
</script>
</head>

<body class="home">
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">
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


	<!-- Highlights - jumbotron -->
	<br><br><br><br>
	<div class="container">	
		<div class="jumbotron">	
			<h1>CONSENT FORM</h1>			
			<div class="row">
				<h4>
					<b>Study Title</b>: Determine if our interface will helps to reduce the time to bet a 4D.
					<br><br>
					<b>Description</b>: You are invited to participate in a research study on using SUREWIN, an application 
					that comprises of all your 4D betting needs, including a inapp betting and matching of the 4D results. 
					You will be asked to perform a series of tasks with the SUREWIN application on a mobile phone, as well 
					as complete a questionnaire on your thoughts about the application after the experiment.
					<br><br>
					<b>Time Duration</b>: The experiment will take approximately 15 minutes to complete.
					<br><br>
					<b>Risks & Benefits</b>: There are no known risks associated with this study. There are no expected benefits from this experiment.
					<br><br>
					<b>Payment</b>: There will be no reimbursement for your participation in this study.
					<br><br>
					<b>Participant's rights</b>: If you have read this form and have decided to participate in this project, 
					please understand your participation is voluntary and you have the right to withdraw your consent or 
					discontinue participation at any time without penalty or loss of benefits to which you are otherwise 
					entitled.  The alternative is not to participate.  You have the right to refuse to answer any questions. 
					With your additional permission, your photographs will be taken during the study.
					<br><br>
					<b>Other Information</b>: If you have any questions, concerns or complaints about this research, 
					its procedures, risks and benefits, contact CHOO SWEET CIN ROSANNE at 9154-6337 or 
					rosannechoo.2011@sis.smu.edu.sg. If you have any questions pertaining to your rights as a participant, 
					you may contact the Institutional Review Board Secretariat at 6828-1925 or irb@smu.edu.sg.

					
				</h4>
				<input id="remember" name="remember" type="checkbox"/>
				I have read and agree to the term and privacy policy
           		<br>
            	<br>
				<button type="button" class="btn btn-default" onclick="validate()">Next</button>
			</div> <!-- /row  -->
		
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