<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="styleNorm.css">
<a href="logout.jsp" style="margin-left:35cm;color: wheat;"><button style="height:1cm ;width: 3cm;font-size: large;margin-top: -1cm; color:red;border:3px solid rgb(0, 0, 0);">logout</button></a>
<head>
<meta charset="ISO-8859-1">
</head>
<title>Admin Page</title>
   
<% //for prevention of back button after logout
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("userId")==null)
{
	response.sendRedirect("login.html");
}
%>
<div class="center">
<h1>hello <%=session.getAttribute("name") %></h1><br>
<form action="addStudentForm.jsp" method="post">
<input type="submit" value="ADD NEW STUDENT">
</form>
<br><br><br><br>
<form action="updateTeacherForm.jsp" method="post">
<input type="submit" value="RESET TEACHER">
</form>
<br><br><br><br>
<form action="issues.jsp" method="post">
<input type="submit" value="CHECK reset requests">
</form>
</div>
</html>