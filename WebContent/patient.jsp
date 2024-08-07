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
if(btnval.equalsIgnoreCase("search")) 
{ 
	String t1=request.getParameter("t1");
 try 
 { 
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hospital","hospital"); 
  Statement smt=conn.createStatement(); 
  ResultSet rs=smt.executeQuery("select * from patient where lower(pid)='"+t1.toLowerCase()+"'"); 
 %> 
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .center {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #c8a7fa;
            font-size: 16px;
            color: #fff;
        }

        .button-container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color: #3498db;
            color: #ffffff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #3ca1db;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="center">
            <h1>Patient Records</h1>
        </div>
        <table>
            <tr>
                <th>PID</th>
                <th>PNM</th>
                <th>PMB</th>
                <th>PAD</th>
                <th>PEM</th>
                <th>PPWD</th>
                <th>PUID</th>
            </tr>
            <% while (rs.next()) {%>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
            </tr>
            <%}%>
        </table>
        <div class="button-container">
            <input type="button" class="button" value="Print" onclick="window.print()">
            <input type="button" class="button" value="Back" onclick="openmenu()">
        </div>
    </div>
    <script>
        function openmenu() {
            window.open("patient.html", "_self");
        }
    </script>
<%}    
catch(Exception e) 
   { 
	JOptionPane.showMessageDialog(null,e.toString()); 
   } 
}//End of Particular Search
if(btnval.equalsIgnoreCase("All search")) 
{ 
 try 
 { 
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hospital","hospital"); 
  Statement smt=conn.createStatement(); 
  ResultSet rs=smt.executeQuery("select * from patient"); 
 %> 
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .center {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #c8a7fa;
            font-size: 16px;
            color: #fff;
        }

        .button-container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color: #3498db;
            color: #ffffff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #3ca1db;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="center">
            <h1>Patient Records</h1>
        </div>
        <table>
            <tr>
                <th>PID</th>
                <th>PNM</th>
                <th>PMB</th>
                <th>PAD</th>
                <th>PEM</th>
                <th>PPWD</th>
                <th>PUID</th>
            </tr>
            <% while (rs.next()) {%>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
            </tr>
            <%}%>
        </table>
        <div class="button-container">
            <input type="button" class="button" value="Print" onclick="window.print()">
            <input type="button" class="button" value="Back" onclick="openmenu()">
        </div>
    </div>
    <script>
        function openmenu() {
            window.open("patient.html", "_self");
        }
    </script> 
<%}    
catch(Exception e) 
   { 
	JOptionPane.showMessageDialog(null,e.toString());
   } 
}//End of Allsearch
 if(btnval.equalsIgnoreCase("save")) 
 { 
  String t1=request.getParameter("t1"); 
  String t2=request.getParameter("t2"); 
  String t3=request.getParameter("t3"); 
  String t4=request.getParameter("t4"); 
  String t5=request.getParameter("t5"); 
  String t6=request.getParameter("t6"); 
  String t7=request.getParameter("t7");
  try 
  { 
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hospital", "hospital"); 
   PreparedStatement psmt=conn.prepareStatement("insert into patient values(?,?,?,?,?,?,?)"); 
   psmt.setString(1,t1); 
   psmt.setString(2,t2); 
   psmt.setString(3,t3); 
   psmt.setString(4,t4); 
   psmt.setString(5,t5); 
   psmt.setString(6,t6); 
   psmt.setString(7,t7);
   psmt.executeQuery(); 
   out.println("<script>alert('Record Saved......')</script>"); 
  } 
  catch(Exception e) 
  { 
	  JOptionPane.showMessageDialog(null,e.toString());
  } 
 }//End of save 
 if(btnval.equalsIgnoreCase("delete")) 
 { 
  String t1=request.getParameter("t1"); 
  try 
  { 
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hospital", "hospital"); 
   PreparedStatement psmt=conn.prepareStatement("delete from patient where pid=?"); 
   psmt.setString(1,t1); 
   psmt.executeQuery(); 
   out.println("<script>alert('Record Deleted......')</script>"); 
  } 
  catch(Exception e) 
  { 
	  JOptionPane.showMessageDialog(null,e.toString()); 
  } 
 }//End of deleted
 if(btnval.equalsIgnoreCase("update")) 
 { 
  String t1=request.getParameter("t1"); 
  String t2=request.getParameter("t2"); 
  String t3=request.getParameter("t3"); 
  String t4=request.getParameter("t4"); 
  String t5=request.getParameter("t5"); 
  String t6=request.getParameter("t6");
  String t7=request.getParameter("t7");
  
  try 
  { 
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hospital", "hospital"); 
   PreparedStatement psmt=conn.prepareStatement("update patient set pnm=?,pmb=?,pad=?,pem=?,ppwd=?,puid=? where pid=?"); 
   psmt.setString(7,t1); 
   psmt.setString(1,t2); 
   psmt.setString(2,t3); 
   psmt.setString(3,t4); 
   psmt.setString(4,t5); 
   psmt.setString(5,t6);
   psmt.setString(6,t7);
   psmt.executeQuery(); 
   out.println("<script>alert('Record Updated......')</script>"); 
  } 
  catch(Exception e) 
  { 
	  JOptionPane.showMessageDialog(null,e.toString()); 
  } 
 }//End of update
%> 
</body> 
</html>
