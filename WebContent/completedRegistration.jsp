<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resetStyle.css">

<%
//for prevention of back button after logout
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
session.setMaxInactiveInterval(10*60);
if(session.getAttribute("userId")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<head>
<meta charset="ISO-8859-1">
<title>completed registration</title>
</head>
<body>


<div class="center">
<h1>hello <%=session.getAttribute("name") %>you have completed the registration</h1>


<form action="resetForm.jsp" method="post">
<label for="userId"></label>
<input type="submit" value="contact admin for resetting">
</form><br><br>



<form action="logout.jsp" method="post">

<label for="userId"><b></b></label>
<input type="submit" value="**click here to logout"><br><br>
</form>


<form action="teacherTimeTable.jsp" method="post">
<label for="userId"><b></b></label>
<input type="submit" value="click here to view your time table"><br><br>
</form>
</div>
</body>
</html>