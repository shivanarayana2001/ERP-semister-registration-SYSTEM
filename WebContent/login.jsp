<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="style.css">
</head>
<head>
<%@ page import="java.util.*,java.sql.*" %>
<body>

<div class="center">
<h1>login form for Course registration</h1>
<form action="login" method="post">



<hr>
<div class="radio">
<input type="radio" id="teacher" name="role" value="teacher" required>
<label for="teacher">Teacher</label>
<input type="radio" id="student" name="role" value="student" required>
<label for="student"> student</label>
<input type="radio" id="admin" name="role" value="admin" required>
<label for="admin">admin</label>
</div>

<label for="userId"><b>userId</b></label>
 <div class="txt_field">
<input type="text" placeholder="Enter userId" name="userId" required>
</div>

<label for="password"><b>Password</b></label>
 <div class="txt_field">
<input type="password" placeholder="Enter Password" name="password" required>
<input type="submit" value="login">

</div>
</form>

</div>

</body>
</html>