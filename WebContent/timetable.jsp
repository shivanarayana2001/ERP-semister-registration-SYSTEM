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
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<%@ page import="java.util.*,java.sql.*" %>
<head>
<meta charset="ISO-8859-1">
<title>STUDENT TIME TABLE(REVIEW)</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
Statement s=con.createStatement();
String sql ="select * from student where Student_ID="+session.getAttribute("userId").toString();
System.out.println(sql);
ResultSet resultSet=s.executeQuery(sql);
%>
<table>

<tr>
  <th>DAY\TIME</th>
  <th>8:00-8:50</th>
  <th>8:50-9:40</th>
  <th>10:00-10:50</th>
  <th>10:50-11:40</th>
  <th>11:40-12:30</th>
  <th>01:15-2:05</th>
  <th>2:05-2:55</th>
  <th>2:55-3:45</th>
</tr>
<%
int week=0;
while(week<5) {%>
<tr>
<%if(week==0)
{%>
	<td>MON</td>
<%}
%>
<%if(week==1)
{%>
	<td>TUE</td>
<%}
%>
<%if(week==2)
{%>
	<td>WED</td>
<%}
%>
<%if(week==3)
{%>
	<td>THU(LABS)</td>
<%}
%><%if(week==4)
{%>
	<td>FRI(LABS)</td>
<%}
%><%while(resultSet.next()) {%>
  
<td><%=resultSet.getString("sub1fac")+" room.no "+resultSet.getString("sub1fac").charAt(7)+" course1"%></td>
<td><%=resultSet.getString("sub2fac")+" room.no "+resultSet.getString("sub2fac").charAt(7)+" course2"%></td>
<td><%=resultSet.getString("sub3fac")+" room.no "+resultSet.getString("sub3fac").charAt(7)+" course3"%></td>
<td><%=resultSet.getString("sub4fac")+" room.no "+resultSet.getString("sub4fac").charAt(7)+" course4"%></td>
<td><%=resultSet.getString("sub5fac")+" room.no "+resultSet.getString("sub5fac").charAt(7)+" course5"%></td>
<td><%=resultSet.getString("sub6fac")+" room.no "+resultSet.getString("sub6fac").charAt(7)+" course6"%></td>
<td><%=resultSet.getString("sub7fac")+" room.no "+resultSet.getString("sub7fac").charAt(7)+" course7"%></td>
<td><%=resultSet.getString("sub8fac")+" room.no "+resultSet.getString("sub8fac").charAt(7)+" course8"%></td>
</tr>
<%} resultSet=s.executeQuery(sql);%>
<%week++;
}
%>



</body>
</html>