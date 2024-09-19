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
	System.out.println("name="+a);
	String b=request.getParameter("pass");
	System.out.println("pass="+b);
	if(a.equals("admin")&&b.equals("admin"))
	{
		response.sendRedirect("adpage.jsp");
	}else
	{
		response.sendRedirect("admin.jsp");
	}
}
catch(Exception ex)
{
	ex.printStackTrace();
}
%>
</body>
</html>