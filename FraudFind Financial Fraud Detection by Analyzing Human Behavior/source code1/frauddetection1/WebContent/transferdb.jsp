<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.database"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{	
	Date dNow = new Date( );
    SimpleDateFormat ft1 = new SimpleDateFormat("yyyy-MM-dd");
    System.out.println("Current Date: " + ft1.format(dNow));
    String aa=(String)session.getAttribute("id");
	 System.out.println("id:"+aa);
	String b=request.getParameter("acc");
	String k=request.getParameter("name");
	String c=request.getParameter("amt");
	String d=request.getParameter("bank");
	String e=request.getParameter("area");
	String f=request.getParameter("dis");
	String g=request.getParameter("sta");
	String h=request.getParameter("con");
	Connection con=database.getconnection();
	String str="insert into tlog(eid,account,company,amount,bank,address,city,state,country,date) values(?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(str);
	ps.setString(1, aa);
	ps.setString(2, b);
	ps.setString(3, k);
	ps.setString(4, c);
	ps.setString(5, d);
	ps.setString(6, e);
	ps.setString(7, f);
	ps.setString(8, g);
	ps.setString(9, h);
	ps.setString(10, ft1.format(dNow).toString());
	int x=ps.executeUpdate();
	if(x>0)
	{
		%>
		<script type="text/javascript">
		alert('tranfered successfully');
		window.location="employee.jsp";
		</script>
		<%
	}else
	{
		%>
		<script type="text/javascript">
		alert('tranfer failed');
		window.location="employee.jsp";
		</script>
		<%
	}
	con.close();
}
catch(Exception es)
{
	es.printStackTrace();
}
%>
</body>
</html>