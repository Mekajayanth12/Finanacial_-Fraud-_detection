<!DOCTYPE html>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.opensymphony.xwork2.Result"%>
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
	

table {
margin-top: 100px;
margin-bottom: 100px;
margin-left:500px;
	width: 600px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}
th,
td {
font-size: 32px;
	text-align: center;
	padding: 25px;
	background-color: rgba(243, 245, 251, 0.88);
	color: #c10676;
}
th {
	text-align: center;
}

thead {
	th {
		background-color: #55608f;
	}
}

tbody {
	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	}
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
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
								<li role="presentation"><a href="NewFile3.jsp">Back</a></li>
							</ul>
						</div>
					</div>	
			</div>	
		</nav>		
	</header>	

	<section id="contact-page">
        <div class="container">
        <img alt="" src="images\ffd.png" style="width: 300px; height: 300px; position: absolute; background-size: 100%100%;">
                <table>
            <%
            try
            {
            	/* classification code  */
            	Connection con=database.getconnection();
            	String sql5="delete from cstr";
                PreparedStatement ps5=con.prepareStatement(sql5);
                ps5.execute();
                
            	List<String> content=new ArrayList<String>();
            	String eid=null,ano=null,aname=null,bname=null,aaddr=null,acity=null,astate=null,acountry=null,tdate=null;
                String tid=request.getParameter("id");
                System.out.println("tid="+tid);
                
                String sql="select * from tlog where id=?";
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, tid);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                	eid=rs.getString("eid");
                	System.out.println("eid="+eid);
                	ano=rs.getString("account");
                	aname=rs.getString("company");
                	bname=rs.getString("bank");
                	aaddr=rs.getString("address");
                	acity=rs.getString("city");
                	astate=rs.getString("country");
                	tdate=rs.getString("date");
                }
                /*geting amount receiver email id  */
                String remail=null;
                String sql1="select emailid from bank where accno=?";
                PreparedStatement ps1=con.prepareStatement(sql1);
                ps1.setString(1, ano);
                ResultSet rs1=ps1.executeQuery();
                if(rs1.next())
                {
                	remail=rs1.getString("emailid");
                	System.out.println("remail:"+remail);
                }
                /* getting employee email id */
                String ei=null;
                String sql3="select emailid from register where eid=?";
                PreparedStatement ps3=con.prepareStatement(sql3);
                ps3.setString(1, eid);
                ResultSet rs3=ps3.executeQuery();
                if(rs3.next())
                {
                	ei=rs3.getString("emailid");
                	System.out.println("semail:"+ei);
                }
                /* getting chat amoung sender and receiver */
                String sql2="select content from chat where sender=? and receiver=?";
                PreparedStatement ps2=con.prepareStatement(sql2);
                ps2.setString(1, ei);
                ps2.setString(2, remail);
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                {
                	content.add(rs2.getString("content"));
                }
                String fon=null;
                if(content.isEmpty())
                {
                	System.out.println("no chat found");
                	String sql9="select * from friend where name=? and frind=?";
                	PreparedStatement ps9=con.prepareStatement(sql9);
                	ps9.setString(1, ei);
                	ps9.setString(2, remail);
                	ResultSet rs9=ps9.executeQuery();
                	if(rs9.next())
                	{
                		fon="friend";
                	}
                	else
                	{
                		fon="not friend";
                	}
                }
                else
                {
                	for(int i=0; i<content.size(); i++)
                	{
                		/* spliting chat data for data analysis */
                		String str=content.get(i);
                		Pattern pattern = Pattern.compile("[^a-z A-Z]");
                	    Matcher matcher = pattern.matcher(str);
                	    String number = matcher.replaceAll("");
                	    String[] s=number.split(" ");
                	    
                	    String sql4="insert into cstr(str) values(?)";
                        PreparedStatement ps4=con.prepareStatement(sql4);
                        ps4.setString(1,number);
                        ps4.execute();
                	}
                }
                int c1=0,c2=0;
                String sql6="select * from cstr";
                PreparedStatement ps6=con.prepareStatement(sql6);
                ResultSet rs6=ps6.executeQuery();
                while(rs6.next())
                {
                	String s=rs6.getString("str");
                	String[] sp=s.split("\\s");
                	for(int i=0; i<sp.length; i++)
                	{
                		 String a1=sp[i];
                		 if(a1.isEmpty()){
                		
                		 }
                		 else{
                			 System.out.println("array value:"+sp[i]);
                			 String sql7="select criminal from social where criminal=?";
                             PreparedStatement ps7=con.prepareStatement(sql7);
                             ps7.setString(1, sp[i]);
                             ResultSet rs7=ps7.executeQuery();
                             while(rs7.next())
                             {
                            	 c1=c1+1;
                             }
                             String sql8="select medical from social where medical=?";
                             PreparedStatement ps8=con.prepareStatement(sql8);
                             ps8.setString(1, sp[i]);
                             ResultSet rs8=ps8.executeQuery();
                             while(rs8.next())
                             {
                            	 c2=c2+1;
                             }
                		 }
                	}                	
                }
                System.out.println("c1:"+c1);
                System.out.println("c2:"+c2);
                %>
                <thead>
            <tr><th>Fraud Category</th></tr>
            </thead>
                <tbody>
            <tr>
            
            
            
                <%
                if(c1==0 && c2==0)
                {
                	if(fon.equals("not friend"))
                    {
                		%>
                		<td>Rationalize</td>
                		<%
                    	System.out.println("rationalize");
                    }
                	else if(fon.equals("friend"))
                	{
                		%>
                		<td>Opportunity</td>
                		<%
                		System.out.println("opportunity");
                	}
                	
                }                
                else
                { 
                	%>
                	<td>Pressure</td>
                	<%
                	System.out.println("pressure");
                	
                	
                }
            }
            catch(Exception e)
            {
            	e.printStackTrace();
            }
            
            %>
            </tr>
            </tbody>
            </table>
            </div> 
            
            
            
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