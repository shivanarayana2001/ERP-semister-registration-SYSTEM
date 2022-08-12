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
	response.sendRedirect("login.html");
}
%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
String id=request.getParameter("issue");
System.out.println(id);
String sql="update teacher set Teacher_id='"+id+"\',subject1="+null+""+",subject2="+null+",subject3="+null+" where Teacher_id=\'"+id+"\'";
System.out.println(sql);
Statement s=con.createStatement();
int k=s.executeUpdate(sql);
if(k!=0){
	
	
response.sendRedirect("adminHome.jsp");
String sql1="delete from contact where id=\'"+id+"\'";
System.out.println(sql1);
Statement ss=con.createStatement();
int kk=ss.executeUpdate(sql1);



int f=s.executeUpdate(sql);
}
else
{
	out.println("unable to insert");
}


%>
body>
</html>