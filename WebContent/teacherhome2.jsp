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

<%@ page import="java.util.*,java.sql.*" %>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="table.css" />
    <script src="pdf.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<meta charset="ISO-8859-1">
<title>teacherHome</title>
</head>
<body>
<div id="invoice">
<%
String subject1=request.getParameter("1");
String subject2=request.getParameter("2");
String subject3=request.getParameter("3");
int o1=Character.getNumericValue(subject1.charAt(6));
int o2=Character.getNumericValue(subject2.charAt(6));
int o3=Character.getNumericValue(subject3.charAt(6));
%>
<%try{
	if(o1==o2 || o2==o3 || o3==o1 || !(o1<o2-1 && o2<o3-1))
	{
		session.setAttribute("error", true);
		response.sendRedirect("teacherHome.jsp");
	}else{
	
	
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
PreparedStatement ps=con.prepareStatement("UPDATE teacher set subject1=\'"+subject1+"\',subject2=\'"+subject2+"\',subject3=\'"+subject3+"\' WHERE Teacher_id="+session.getAttribute("userId"));
System.out.print("UPDATE teacher set subject1=\'"+subject1+"\',subject2=\'"+subject2+"\',subject3=\'"+subject3+"\' WHERE Teacher_id="+session.getAttribute("userId"));
ps.executeUpdate();
Statement s=con.createStatement();
System.out.println("ID Is : "+session.getAttribute("userId"));
ResultSet rs=s.executeQuery("SELECT * FROM teacher WHERE Teacher_id=\'"+session.getAttribute("userId")+"\'");
String ss=rs.toString();}
}catch(Exception e){}
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
</div>
</body>
<div>
 <div class="col-md-12 text-right mb-3">
                <button class="btn btn-primary" id="download"> download pdf</button>
            </div>
 </div>
</html>