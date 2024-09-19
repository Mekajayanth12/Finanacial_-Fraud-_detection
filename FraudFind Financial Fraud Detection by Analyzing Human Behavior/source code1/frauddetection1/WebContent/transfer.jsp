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
								<li role="presentation"><a href="employee.jsp" >Clients</a></li>	
							</ul>
						</div>
					</div>	
			</div>	
		</nav>		
	</header>	
	<%
	 String aa=(String)session.getAttribute("id");
	 System.out.println("id:"+aa);
	 String a=null,b=null,c=null,d=null,e=null,f=null,g=null,h=null;
	 String cid=request.getParameter("cid");
	 Connection con=database.getconnection();
     String sql="select * from clients where id=?";
     PreparedStatement ps=con.prepareStatement(sql);
     ps.setString(1, cid);
     ResultSet rs=ps.executeQuery();
     if(rs.next())
     {
    	 a=rs.getString("account");
    	 b=rs.getString("company");
    	 c=rs.getString("bank");
    	 d=rs.getString("address");
    	 e=rs.getString("city");
    	 f=rs.getString("state");
    	 g=rs.getString("country");
     }
	 %> 
	<section id="contact-page">
        <div class="container">
            <div class="center">        
                <h2>Money Transaction</h2>
            </div> 
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="transferdb.jsp">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group">
                            <label>Account No</label>
                            <input type="number" name="acc" value="<%=a %>" class="form-control" required="required">
                        </div> 
                        <div class="form-group">
                            <label>Name of Account </label>
                            <input type="text" name="name" value="<%=b %>" class="form-control" required="required">
                        </div> 
                        <div class="form-group">
                            <label>Amount </label>
                            <input type="number" name="amt"  class="form-control" required="required">
                        </div> 
                                           
                        <div class="form-group">
                            <label>Bank</label>
                            <input type="text" name="bank" value="<%=c %>" class="form-control" required="required">
                        </div> 
                                                                   
                      
                    </div>
                    <div class="col-sm-5">                       
                        
                        <div class="form-group">
                            <label>Address</label>
                            <input type="text" name="area" value="<%=d %>" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" name="dis" value="<%=e %>" class="form-control" required="required">
                        </div> 
                        <div class="form-group">
                            <label>State</label>
                            <input type="text" name="sta" value="<%=f %>" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>Country</label>
                            <input type="text" name="con" value="<%=g %>" class="form-control" required="required">
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