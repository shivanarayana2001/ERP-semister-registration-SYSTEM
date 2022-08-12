<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="table.css" />
    <script src="pdf.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<meta charset="ISO-8859-1">
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
String c1=(request.getParameter("c1"));
String c2=(request.getParameter("c2"));
String c3=(request.getParameter("c3"));
String c4=(request.getParameter("c4"));
String c5=(request.getParameter("c5"));
String c6=(request.getParameter("c6"));
String c7=(request.getParameter("c7"));
String c8=(request.getParameter("c8"));
String sub1fac=(c1.substring(0,8));
String sub2fac=(c2.substring(0,8));
String sub3fac=(c3.substring(0,8));
String sub4fac=(c4.substring(0,8));
String sub5fac=(c5.substring(0,8));
String sub6fac=(c6.substring(0,8));
String sub7fac=(c7.substring(0,8));
String sub8fac=(c8.substring(0,8));
%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
Statement s=con.createStatement();
String sql="UPDATE student SET sub1fac=\'"+sub1fac+"\',"
									+ "sub2fac=\'"+sub2fac+"\',"
									+ "sub3fac=\'"+sub3fac+"\',"
									+ "sub4fac=\'"+sub4fac+"\',"
									+ "sub5fac=\'"+sub5fac+"\',"
									+ "sub6fac=\'"+sub6fac+"\',"			
									+ "sub7fac=\'"+sub7fac+"\',"
									+ "sub8fac=\'"+sub8fac+"\' "
									+ "WHERE Student_ID="+session.getAttribute("userId")
						;
System.out.println(sql);
int ff=s.executeUpdate(sql);
%>
<div id="invoice">
<h1 style="text-align:center">hey <%=session.getAttribute("name") %> please find below time table of yours</h1>
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
%>
  <td><%=c1+"\n"+ "Room:"+c1.charAt(7)%></td>
  <td><%=c2+"\n"+ "Room:"+c2.charAt(7)%></td>
  <td><%=c3+"\n"+ "Room:"+c3.charAt(7)%></td>
  <td><%=c4+"\n"+ "Room:"+c4.charAt(7)%></td>
  <td><%=c5+"\n"+ "Room:"+c5.charAt(7)%></td>
  <td><%=c6+"\n"+ "Room:"+c6.charAt(7)%></td>
  <td><%=c7+"\n"+ "Room:"+c7.charAt(7)%></td>
  <td><%=c8+"\n"+ "Room:"+c8.charAt(7)%></td>
</tr>
<%week++;
}
%>
</table>
 
</div>
</body>
<div class="col-md-12 text-right mb-3">
                <button class="btn btn-primary" id="download"> download pdf</button>
  </div>
</html>