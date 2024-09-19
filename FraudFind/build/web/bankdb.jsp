<%@page import="java.sql.ResultSet"%>
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
	String a=request.getParameter("name");
	String b=request.getParameter("pass");
	System.out.println("name="+a);
	System.out.println("pass="+b);
	Connection con=database.getconnection();
	String sql="select * from register where name=? and password=? and status=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, a);
	ps.setString(2, b);
	ps.setString(3, "accepted");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		String aa=rs.getString("eid");
		session.setAttribute("id", aa);
		response.sendRedirect("employee.jsp");
	}
	else
	{
		%>
		<script type="text/javascript">
		alert("enter correct name and password");
		window.location="bank.jsp";
		</script>
		<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>