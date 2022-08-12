<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.*,java.sql.*" %>
<html>
<a href="logout.jsp" style="margin-left:35cm;color: wheat;"><button style="height:1cm ;width: 3cm;font-size: large;margin-top: -1cm; color:red;border:3px solid rgb(0, 0, 0);">logout</button></a>
<head>

 <link rel="stylesheet" href="styleNorm.css">
<%
//for prevention of back button after logout
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
session.setMaxInactiveInterval(10*60);
if(session.getAttribute("userId")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<meta charset="ISO-8859-1">
<title>teacherHome</title>
</head>
<body>


<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
Statement s=con.createStatement();
Statement ss=con.createStatement();
ResultSet r1s=ss.executeQuery("SELECT * from teacher where teacher_id="+session.getAttribute("userId"));
while(r1s.next())
{
	if(r1s.getString("subject1")!=null)
	{
		response.sendRedirect("completedRegistration.jsp");
	}
}
ResultSet rs=s.executeQuery("select * from courses");

%>


<form action="teacherhome2.jsp" method="post">

<div class="center">
<h2>hello <%=session.getAttribute("name") %> please select the course that you want to teach</h2>
<hr>
<br><br>
<%if(!(session.getAttribute("error")==null))
{ %>
	<h6 style="color:red; text-align:center">your subjects are sequential please select in proper way </h6>
<%}
%>
<label for="1"><b class="b">subject1</b></label>
<select name="1" id="1" class="box" required>
<option value="">Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("CourseName")%>><%=rs.getString("CourseName")%></option>
<%} rs=s.executeQuery("select * from courses");%>
</select>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;



<label for="2"><b class="b">subject2</b></label>
<select name="2" id="2" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("CourseName")%>><%=rs.getString("CourseName")%></option>
<%} rs=s.executeQuery("select * from courses");%>
</select>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;



<label for="3"><b class="b">subject3</b></label>
<select name="3" id="3" class="box" required>
<option value="" selected disabled hidden>Select an Option</option>
<%while(rs.next()){ %>
<option value=<%=rs.getString("CourseName").toString()%>><%=rs.getString("CourseName")%></option>
<%} %>
</select>

<br><br><br><br><br><br><br><br><br><br>
<div>
<input type="submit" value="SUBMIT">
</div>
</div>
</form>
</body>
</html>