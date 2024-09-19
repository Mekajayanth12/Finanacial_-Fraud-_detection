<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="analysis.graph"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
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
								<li role="presentation"><a href="analysis.jsp" class="active">Chart</a></li>
								<li role="presentation"><a href="NewFile3.jsp" >Analysis</a></li>
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
                <h2>Money Transaction Details</h2>
            </div> 
           
                <div class="status alert alert-success" style="display: none"></div>
            

<%
List<graph> list=new ArrayList<graph>();
int count;
String s="";
try
{
	Connection conn=database.getconnection();
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("select account,count(account) as c from tlog  group by account,bank");
		while(rs.next())
				{
	    //System.out.println( output.getCommandResult() );
	    //Iterable<DBObject> list1= output.results();
	   
	    	String date =rs.getString("account");
	        count = rs.getInt("c");
	        graph gp=new graph();
	        gp.setDate(date);	       
	        gp.setCount(count);
	        list.add(gp);
				}
	    for(Integer i =0;i<list.size(); i++)
	    {
	    	graph a = list.get(i);
	    	s=s+"{label: \""+a.getDate()+"\",y:"+a.getCount()+"},";
	    } 

}
catch(Exception e)
{
	e.printStackTrace();
}
   %>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">

window.onload = function () 
{
	var chart = new CanvasJS.Chart("chartContainer", {
	theme: "theme2",//theme1
	title:{text: "" },
	animationEnabled: false,   // change to true
	data: [              
	{
	// Change type to "bar", "area", "spline", "pie",etc.
	type: "column",
	dataPoints: [
	            <%=s%>
	]
	}
	]
	});
	chart.render();
}
</script>  
<div id="chartContainer" style="height: 500px; width: 100%; position: related;"></div>   
		
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