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
      String quer=" select name,nam,eid,studentid,courseid from studentMaster Inner join CoursesEnrolled on CoursesEnrolled.studentid=studentMaster.id Inner join CourseMaster on CoursesEnrolled.courseid=CourseMaster.id;";
      ResultSet rs = st.executeQuery(quer);
      String selectedstudent=request.getParameter("selectedstudent");
      String selectedcourse=request.getParameter("selectedcourse");
      String selectedfees=request.getParameter("selectedfees");
      
   %> 

<%
    int count=0;
  while(rs.next())
       {
          String studentid=rs.getString("studentid");
          String courseid=rs.getString("courseid");
     
         if(studentid.equals(selectedstudent) && courseid.equals(selectedcourse))
           {
                 count ++;
            }
       
          }      
      if(count > 0){
          %>
               <link rel="stylesheet" href="css.css"/>
              <table Id="course-table" align="center">
               <div id="course-table">
                   <h2> This is already Enrolled<a href="enrol.jsp"><br>Try again</a></h2>
               </div>
              </table>
 </body>
              <% 
      }
       if(count == 0){
           
                   session.setAttribute("selectedstudent",selectedstudent);
                   session.setAttribute("selectedcourse",selectedcourse);
                   session.setAttribute("selectedfees",selectedfees);
                   response.sendRedirect("enrol_1.jsp");
              }

  }
  catch(Exception e){out.println(e);}
%>
