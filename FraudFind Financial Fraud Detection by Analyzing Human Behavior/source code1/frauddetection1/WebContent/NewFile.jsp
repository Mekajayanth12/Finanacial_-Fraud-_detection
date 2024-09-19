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
	textarea {
	font-family: cursive;
	font-style: oblique;
	color: #555;
	border-radius: 5px;
	font-size: 22px;
  padding: 7px 12px;
  border-color:#200b92;
  box-shadow: none;
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
								<li role="presentation"><a href="index.html">Logout</a></li>		
								<li role="presentation"><a href="transfer.jsp" >Transaction</a></li>								
								<li role="presentation"><a href="adpage.jsp" class="active">Vendors</a></li>	
							</ul>
						</div>
					</div>	
			</div>	
		</nav>		
	</header>
	<%
	int a;
	Connection con=database.getconnection();
	String sql="select id from aregister order by id desc limit 1";
	PreparedStatement ps=con.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		a=rs.getInt("id")+1;
	}
	else
	{
		a=1;
	}
	%>

	<section id="contact-page">
        <div class="container">
            <div class="center">        
                <h2>Employee Registration</h2>
            </div> 
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="adpdb.jsp">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group">
                            <label>Employee ID</label>
                            <input type="number" name="eid" value="<%=a %>" readonly="readonly" class="form-control" >
                        </div> 
                        <div class="form-group">
                            <label>Name </label>
                            <input type="text" name="name" class="form-control" required="required">
                        </div> 
                        <div class="form-group">
                            <label>Gender</label><br>
                            <input type="radio" name="gender" value="male" style="width: 25px; height: 25px; margin-left: 100px;">
                            <span style="color:blue; font-size: 18px; font-style: oblique; font-weight: 800;">Male</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            <input type="radio" name="gender" value="Female" style="width: 25px; height: 25px;">
                            <span style="color:blue; font-size: 18px; font-style: oblique; font-weight: 800;">Female</span>
                        </div> 
                        <div class="form-group">
                            <label>DOB</label>
                            <input type="date" name="dob" class="form-control" required="required">
                        </div> 
                        
                          <div class="form-group">
                            <label>Phone</label>
                            <input type="number" name="phone" class="form-control" required="required">
                        </div>                                          
                      
                    </div>
                    <div class="col-sm-5">                       
                        <div class="form-group">
                            <label>Marital Status</label>
                            <input type="text" name="mar" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>Area</label>
                            <input type="text" name="area" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>District</label>
                            <input type="text" name="dis" class="form-control" required="required">
                        </div> 
                        <div class="form-group">
                            <label>State</label>
                            <input type="text" name="sta" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>Country</label>
                            <input type="text" name="con" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <button type="submit" name="submit" class="btn btn-primary btn-lg" required="required" style="margin-left: 50px;">Submit</button>
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            <button type="reset" name="reset" class="btn btn-primary btn-lg" required="required">Cancel</button>
                        </div>    
                        
                    </div>
                </form>
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