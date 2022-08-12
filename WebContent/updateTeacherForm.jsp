<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="styleNorm.css">
<a href="logout.jsp" style="margin-left:35cm;color: wheat;"><button style="height:1cm ;width: 3cm;font-size: large;margin-top: -1cm; color:red;border:3px solid rgb(0, 0, 0);">logout</button></a>
<head>
<%@ page import="java.util.*,java.sql.*" %>
<meta charset="ISO-8859-1">
<title>issues</title>
</head>
<body>


<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
Statement s=con.createStatement();
%>

<%
ResultSet rs=s.executeQuery("select * from teacher");
%>
</head>
<title>Admin Page</title>
   
<% //for prevention of back button after logout
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("userId")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<div class="center">
<form action="reset.jsp">
<label for="1"><b class="b">reset teacher with id:</b></label>
<select name="issue" id="issue" class="box" required>
<option value="">Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("Teacher_id")%>><%=rs.getString("Teacher_id")%></option>
<%} rs=s.executeQuery("select * from teacher");%>
</select>
<input type="submit" value="reset teacher">
</form>
</div>
</html>