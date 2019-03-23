<%-- 
    Document   : LoginForm_1
    Created on : Dec 15, 2018, 10:49:31 AM
    Author     : HP
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <body background="photo/r.bmp">
<!DOCTYPE html>
<%
  Connection conn = null;
  String url="jdbc:mysql://localhost:3306/";
  String dbName ="database2";
  String  driver="com.mysql.jdbc.Driver";
  String userName="root";
  String password="";
  Statement st;
  try{
      Class.forName(driver).newInstance();
      conn= DriverManager.getConnection(url+dbName,userName,password);
      st=conn.createStatement();
       String quer="SELECT * FROM studentMaster";
      ResultSet rs = st.executeQuery(quer);
      
   %> 
 <%--
CourseMaster(Nam,DURATION,TECHNOLOGY),studentMaster(name,passord,email,mobile,city),
CoursesEnrolled(studentid,courseid),feepaid
  --%>


<%
  String name=request.getParameter("name");
  String pwd=request.getParameter("password");
  if(name.equals("admin")&& pwd.equals("admin123")){
      session.setAttribute("username",name);
      response.sendRedirect("DisplayMessages_1.jsp"); 
  }
  else{
      %>
      <link rel="stylesheet" href="css.css"/>
      <table Id="course-table" align="center">
          <div id="course-table">
              <H2> Incorrect username and password<a href="home.jsp"><br>Try again</a></H2>
          </div>
      </table>
      <%
      while(rs.next())
       {
          
          String nam=rs.getString("name");
          String passord=rs.getString("passord");
          if(name.equals(nam)&& pwd.equals(passord))
             {
                session.setAttribute("username",nam);
                response.sendRedirect("DisplayMessages.jsp"); 
             }
       }
%>
 </body>
<%  
  }

%>

   <%    
  }
  catch(Exception e){out.println(e);}
%>

