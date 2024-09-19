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
	String a=request.getParameter("eid");
	String b=request.getParameter("name");
	String c=request.getParameter("pass");
	String d=request.getParameter("email");
	String e=request.getParameter("mob");
	String f=request.getParameter("gender");
	String g=request.getParameter("dob");
	String h=request.getParameter("mar");
	String i=request.getParameter("area");
	String j=request.getParameter("dis");
	String k=request.getParameter("sta");
	String l=request.getParameter("con");
	Connection con=database.getconnection();
	String str="insert into register(eid,name,password,emailid,mobile,gender,age,mstatus,address,city,state,country,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(str);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, c);
	ps.setString(4, d);
	ps.setString(5, e);
	ps.setString(6, f);
	ps.setString(7, g);
	ps.setString(8, h);
	ps.setString(9, i);
	ps.setString(10, j);
	ps.setString(11, k);
	ps.setString(12, l);
	ps.setString(13, "pending");
	int x=ps.executeUpdate();
	if(x>0)
	{
		%>
		<script type="text/javascript">
		alert('registered successfully');
		window.location="bank.jsp";
		</script>
		<%
	}else
	{
		%>
		<script type="text/javascript">
		alert('register failed');
		window.location="bank.jsp";
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