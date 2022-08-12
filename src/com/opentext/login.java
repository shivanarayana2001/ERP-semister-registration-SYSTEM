package com.opentext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class login extends HttpServlet{

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
	try {
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/opentext","root","Mantravadi@1234");
		PrintWriter out=response.getWriter();
		
		if(role.equals("admin"))
		{
			Statement s=con.createStatement();
			String ss="select * from admin";
			ResultSet rs= s.executeQuery(ss);
			boolean gotit=false;
			while(rs.next())
				{
					if(userId.equals(rs.getString("id")) && password.equals(rs.getString("password")))
					{
						HttpSession session=request.getSession();
						session.setAttribute("userId",userId);
						session.setAttribute("name", rs.getString("name"));
						response.sendRedirect("adminHome.jsp");
						gotit=true;
						break;
					}
			
				}
				//invalid user name or password
				if(!gotit)
				{
					response.sendRedirect("login.jsp");
				}
		}
		
		
		else if(role.equals("teacher"))
		{
			Statement s=con.createStatement();
			String ss="select * from teacher";
			ResultSet rs= s.executeQuery(ss);
			boolean gotit=false;
			while(rs.next())
				{
					if(userId.equals(rs.getString("teacher_id")) && password.equals(rs.getString("password")))
					{
						HttpSession session=request.getSession();
						session.setAttribute("userId",userId);
						session.setAttribute("name", rs.getString("name"));
						session.setAttribute("password",password);
						response.sendRedirect("teacherHome.jsp");
						gotit=true;
						break;
					}
			
				}
				//invalid user name or password
				if(!gotit)
				{
					response.sendRedirect("login.jsp");
				}
		}
		
		else if(role.equals("student")){
			Statement s=con.createStatement();
			String ss="select * from student";
			ResultSet rs= s.executeQuery(ss);
			boolean gotit=false;
			System.out.println("hii java");
			while(rs.next())
				{
					if(userId.equals(rs.getString("Student_ID")) && password.equals(rs.getString("password")))
					{
						HttpSession session=request.getSession();
						session.setAttribute("userId",userId);
						session.setAttribute("name", rs.getString("name"));
						response.sendRedirect("studentHome.jsp");
						gotit=true;
						break;
					}
			
				}
				//invalid user name or password
				if(!gotit)
				{
					response.sendRedirect("login.jsp");
				}
		}
			System.out.println("hello java");
		
		}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
	
}

