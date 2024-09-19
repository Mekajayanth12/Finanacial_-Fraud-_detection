<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.database"%>
<%@page import="java.sql.Connection"%>
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
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<style type="text/css">
	
.comparison-table {
  display: block;
  width: 100%;
  padding: 10px;
  border-collapse: separate;
}
.comparison-table thead tr {
  color: #34b7f0;
  font-weight: bold;
  font-size: 16px;
  font-size: 1.6rem;
}
.comparison-table thead tr td {
  padding-bottom: 10px;
}
.comparison-table thead tr td {
  border: none !important;
}
@media (max-width: 100%) {
  .comparison-table thead tr {
    font-size: 18px;
    font-size: 1.4rem;
    font-weight: normal;
  }
}
.comparison-table tr {
  width: 100%;
}
.comparison-table tr td {
  border-right: 2px solid #34b7f0;
}
.comparison-table tr:first-child td {
  border-top: 2px solid #34b7f0;
}
.comparison-table tr:first-child td:first-child {
  -moz-border-radius-topleft: 5px;
  -webkit-border-top-left-radius: 5px;
  border-top-left-radius: 5px;
}
.comparison-table tr:first-child td:last-child {
  -moz-border-radius-topright: 5px;
  -webkit-border-top-right-radius: 5px;
  border-top-right-radius: 5px;
}
.comparison-table tr:last-child td {
  border-bottom: 2px solid #34b7f0;
}
.comparison-table tr:last-child td:first-child {
  -moz-border-radius-bottomleft: 5px;
  -webkit-border-bottom-left-radius: 5px;
  border-bottom-left-radius: 5px;
}
.comparison-table tr:last-child td:last-child {
  -moz-border-radius-bottomright: 5px;
  -webkit-border-bottom-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
.comparison-table tr td {
  width: 25%;
  padding: 10px;
  color: black;
  font-weight: bold;
  border-left: 2px solid #34b7f0;
}
.comparison-table tr:nth-child(even) {
  background: #ccf1fb;
}
@media (max-width: 100%) {
  .comparison-table td, .comparison-table tr td, .comparison-table tr td.marker, .comparison-table tr td:first-child, .comparison-table tr td:first-child + td {
    position: relative;
    display: block;
    width: 100%;
    border-top: none;
    border-bottom: none;
    border-left: 2px solid #34b7f0;
  }
  .comparison-table tr:last-child td:last-child {
    -moz-border-radius-bottomleft: 5px;
    -webkit-border-bottom-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border-bottom: 2px solid #34b7f0;
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
							<a href="index.html"><h1><span>FraudFind: Financial Fraud Detection by Analyzing Human Behaviour</span></h1></a>
						</div>
					</div>		
										
				</div>
				<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">	
								<li role="presentation"><a href="index.html">Logout</a></li>		
								<li role="presentation"><a href="analysis.jsp" >Chart</a></li>
								<li role="presentation"><a href="NewFile1.jsp" class="active">Analysis</a></li>
								<li role="presentation"><a href="transaction.jsp" >Transaction</a></li>
								<li role="presentation"><a href="clients.jsp" >Clients</a></li>								
								<li role="presentation"><a href="adpage.jsp" >E-Register</a></li>
							</ul>
						</div>
					</div>	
			</div>	
		</nav>		
	</header>	

	<section id="contact-page">
        <div class="container">
            <div class="center">        
                
<form id="main-contact-form" class="contact-form" name="contact-form" method="get" action="NewFile2.jsp">
                    <div class="col-sm-5 col-sm-offset-1">
                    <div class="form-group">
                            <select name="name" class="form-control" >
                            <option value="account">Account Number</option>
                            <option value="company">Company Name</option>
                            <option value="bank">Bank Name</option>
                            <option value="address">Address</option>
                            <option value="city">City</option>
                            <option value="state">State</option>                            
                            <option value="country">Country</option>
                            </select>
                        </div>                                                            
                    </div>
                    <div class="col-sm-5">                                      
                        <div class="form-group">
                            <button type="submit" style="background-color: black; ">Search</button>
                        </div>

                    </div>
                </form> 
            </div> 
           
                <div class="status alert alert-success" style="display: none"></div>
               
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