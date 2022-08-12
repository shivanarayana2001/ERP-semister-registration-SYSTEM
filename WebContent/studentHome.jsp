<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<a href="logout.jsp" style="margin-left:35cm;color: wheat;"><button style="height:1cm ;width: 3cm;font-size: large;margin-top: -1cm; color:red;border:3px solid rgb(0, 0, 0);">logout</button></a>
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
<link rel="stylesheet" href="styleNorm.css">
<meta charset="ISO-8859-1">
<title>StudentHome</title>
</head>
<%@ page import="java.util.*,java.sql.*" %>
<meta charset="ISO-8859-1">
<title>teacherHome</title>
</head>
<body>


<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
Statement s=con.createStatement();
%>

<%
ResultSet rs=s.executeQuery("select name from teacher where subject1=\'course1\' or subject2=\'course1\' or subject3=\'course1\'");
%>


</body>

<form action="studenthome2.jsp" method="post">
<div class="center">
<h2>hello <%=session.getAttribute("name") %> <%=session.getAttribute("userId") %>please select the faculty for the courses</h2>
<hr>
<label for="c1"><b>course1</b></label>
<select name="c1" id="c1" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course1"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>



<%
rs=s.executeQuery("select name from teacher where subject1=\'course2\' or subject2=\'course2\' or subject3=\'course2\'");
%>
<label for="c2"><b>course2</b></label>
<select name="c2" id="c2" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course2"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>




<%
rs=s.executeQuery("select name from teacher where subject1=\'course3\' or subject2=\'course3\' or subject3=\'course3\'");
%>
<label for="c3"><b>course3</b></label>
<select name="c3" id="c3" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course3"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>



<%
rs=s.executeQuery("select name from teacher where subject1=\'course4\' or subject2=\'course4\' or subject3=\'course4\'");
%>
<label for="c4"><b>course4</b></label>
<select name="c4" id="c4" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course4"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>



<%
rs=s.executeQuery("select name from teacher where subject1=\'course5\' or subject2=\'course5\' or subject3=\'course5\'");
%>
<label for="c5"><b>course5</b></label>
<option value="" selected disabled hidden>Select an Option</option>
<select name="c5" id="c5" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course5"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>




<%
rs=s.executeQuery("select name from teacher where subject1=\'course6\' or subject2=\'course6\' or subject3=\'course6\'");
%>
<label for="c6"><b>course6</b></label>
<select name="c6" id="c6" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course6"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>




<%
rs=s.executeQuery("select name from teacher where subject1=\'course7\' or subject2=\'course7\' or subject3=\'course7\'");
%>
<label for="c7"><b>course7</b></label>
<select name="c7" id="c7" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course7"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>




<%
rs=s.executeQuery("select name from teacher where subject1=\'course8\' or subject2=\'course8\' or subject3=\'course8\'");
%>
<label for="c8"><b>course8</b></label>
<select name="c8" id="c8" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("name")+"course8"%>><%=rs.getString("name")%></option>
<%}%></select><br><br>
</div>
<input type="submit" class="studenthome2" value="submit">
<a href="timetable.jsp">click here to view your registered timetable</a>
</form>
</html>