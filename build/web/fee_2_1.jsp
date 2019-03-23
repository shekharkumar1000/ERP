<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shekhar's Enrollment System</title>
        <link rel="stylesheet" href="css.css"/>
    </head>
 <body background="photo/r.bmp">
        
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
       String amunt=request.getParameter("amunt"); 
      String id=(String)session.getAttribute("id");
      String quer=" select name,nam,eid,fees,studentid,amount,courseid from studentMaster Inner join CoursesEnrolled on CoursesEnrolled.studentid=studentMaster.id Inner join CourseMaster on CoursesEnrolled.courseid=CourseMaster.id Inner join feepaid on feepaid.id=CoursesEnrolled.eid where feepaid.id="+id+";";
      ResultSet rs = st.executeQuery(quer);
   %>
   <%   int amun = Integer.parseInt(amunt);
        int count=0;
        while(rs.next())
       {
          int fees=rs.getInt("fees");
          int amount=rs.getInt("amount");
          if(fees < amount + amun)
           {
                 count ++;
           }
       }      
      if(count > 0){
          %>
               <link rel="stylesheet" href="css.css"/>
              <table Id="course-table" align="center">
               <div id="course-table">
                   <h2> Amount is in excess of the outstanding fees<a href="fee.jsp"><br>Pay again</a></h2>
               </div>
              </table>
              <% 
      }
       if(count == 0){
              if(id!=null)
              session.setAttribute("amunt",amunt);       
              response.sendRedirect("fee_3.jsp");
              }
           %>    
  <%     
  }
  catch(Exception e){out.println(e);}
%>
     </div>
  </body>
</html>
