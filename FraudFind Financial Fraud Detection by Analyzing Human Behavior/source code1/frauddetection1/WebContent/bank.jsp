<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Company-HTML Bootstrap theme</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />
	<style type="text/css">
	input[type="submit"] {
	background-color: #200b92;
	color: white;
}
	</style>	   
  </head>
  <body>
	<header>		
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="index.html"><h1><span>FraudFind: Financial Fraud Detection by Analyzing Human Behavior</span></h1></a>
						</div>
					</div>				
										
				</div>
				<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
							<li role="presentation"><a href="bank.jsp" class="active">Employee</a></li>
							<li role="presentation"><a href="admin.jsp" >Admin</a></li>
							<li role="presentation"><a href="index.html" >Home</a></li>								
							</ul>
						</div>
					</div>	
			</div>	
		</nav>		
	</header>
	

	<section id="contact-page">
        <div class="container">
            <div class="center">        
                <h2>Employee Login Page</h2>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="get" action="bankdb.jsp">
                    <div class="col-sm-5 col-sm-offset-1">
                    <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="pass" class="form-control" required="required">
                        </div>
                       <div class="form-group">
                            <input type="submit" name="submit" value="login" class="form-control">
                        </div> 
                        <div class="form-group">
                        <div style="width: 100%; height: 40px; background-color: blue; text-align: center; border-radius: 5px;">
                        <a href="register.jsp" style="font-size: 18px; font-family: cursive; font-style: italic; margin-top: 5px;">Register</a>
                        </div>
                            
                        </div>   
                                                                                           
                    </div>
                    <div class="col-sm-5">                                             
                        
                    </div>
                </form> 
                <img alt="" src="images/loginstyle1.png" style="width: 500px; margin-left: 50px; ">
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
	
	<footer>
		<div class="footer">
			<div class="container">
				<div class="social-icon">
					<div class="col-md-4">
						<ul class="social-network">
						
						</ul>	
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-4">
					
                   
				</div>						
			</div>
			<div class="pull-right">
				
			</div>
		</div>
	</footer>	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>  
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>
	
  </body>
</html>