<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    <%--reset from user end --%>
    
    
    
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<%
//for prevention of back button after logout
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
session.setMaxInactiveInterval(10*60);
if(session.getAttribute("userId")==null)
{
	response.sendRedirect("login.html");
}
%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String s=session.getAttribute("userId").toString();
System.out.println(s);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
String sql="insert into contact values(\'"+s+"\','"+s+"')";
out.println(sql);
PreparedStatement ps=con.prepareStatement(sql);
int k=ps.executeUpdate();
if(k!=0)
{
	response.sendRedirect("logout.jsp");
}
%>
</html>