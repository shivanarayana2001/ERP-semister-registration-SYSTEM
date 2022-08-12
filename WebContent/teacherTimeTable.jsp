<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
<a href="logout.jsp" style="margin-left:35cm;color: wheat;"><button style="height:1cm ;width: 3cm;font-size: large;margin-top: -1cm; color:red;border:3px solid rgb(0, 0, 0);">logout</button></a>
<meta charset="ISO-8859-1">
<title>STUDENT TIME TABLE(REVIEW)</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
Statement s=con.createStatement();
String sql ="select * from teacher where teacher_id="+session.getAttribute("userId").toString();
System.out.println(sql);
ResultSet resultSet=s.executeQuery(sql);
resultSet.next();
String subject1=resultSet.getString("subject1");
String subject2=resultSet.getString("subject2");
String subject3=resultSet.getString("subject3");
int o1=Character.getNumericValue(subject1.charAt(6));
int o2=Character.getNumericValue(subject2.charAt(6));
int o3=Character.getNumericValue(subject3.charAt(6));
%>
<table id="table">

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
<%}int t=1;while(t<9){
	
	
if(t==o1){
%>
<td class="yes"><%=subject1 %></td>
<%}
	

else if(t==o2){
%>
<td class="yes"><%=subject2 %></td>
<%}
	
	

else if(t==o3){
%>
<td class="yes"><%=subject3 %></td>
<%}


else{%>
<td>--</td>
<%}t++;} %>
</tr>
<%week++;
}
%>
</table>



</body>
</html>