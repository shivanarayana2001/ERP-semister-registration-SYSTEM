<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
body
{

align-items: center;

}
</style>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<%
//for prevention of back button after logout
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
session.setMaxInactiveInterval(10*60);
if(session.getAttribute("userId")==null)
{
	response.sendRedirect("login.html");
}
%>

<a href="logout.jsp" style="margin-left:35cm;color: wheat;"><button style="height:1cm ;width: 3cm;font-size: large;margin-top: -1cm; color:red;border:3px solid rgb(0, 0, 0);">logout</button></a>
<body >
<div class="center">
<form action="addStudent.jsp">
<label for="userId"><b>userId</b></label>
 <div class="txt_field">
<input type="text" placeholder="Enter userId" name="userId" required>
</div>
<label for="name"><b>name</b></label>
 <div class="txt_field">
<input type="text" placeholder="Enter name" name="name" required>
 <input type="submit" value="ADD STUDENT">
 </div>
 </form>
</div>

</body>

</body>


</html>