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
	String id=request.getParameter("id");
	System.out.println("id="+id);
	Connection con=database.getconnection();
	String sql="update register set status=? where id=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, "accepted");
	ps.setString(2, id);
	ps.execute();
	response.sendRedirect("adpage.jsp");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>