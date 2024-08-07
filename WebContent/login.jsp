<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>  
<body>
<% 
 String btnval=request.getParameter("b1");
 if(btnval.equalsIgnoreCase("login"))   //Login page 
 {  
  String t1=request.getParameter("id");
  String t2=request.getParameter("pwd");
  try  
  {  
    Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hospital","hospital");  
    Statement smt=conn.createStatement();  
    ResultSet rs=smt.executeQuery("select * from login"); 
    int t=0;
    while(rs.next())  
   {  
       if((rs.getString(1).equals(t1))&&(rs.getString(2).equals(t2)))
       {
    	   out.println("<script>window.open('menu.html','_self')</script>");
    	   t=1;
    	   break;
       }
   }    
   if(t==0)
	  out.println("<script>alert('Not Welcome')</script>");
   //response.sendRedirect("menu.html");
               
 }     
catch(Exception e)  
   {  
    out.println(e.toString());
   }  
}//Login page

%>
</body>
</html>