<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shekhar's Enrollment System</title>
        <link rel="stylesheet" href="css.css"/>
    </head>
   <body background="photo/r.bmp">
        <div id="course-table">
        <ul>
            <li class="active"><a href="admin.jsp">Home</a></li>
            <li class="dropdown"><a href="#">Course</a>
                <div class="dropdown-content">
                <a href="viewallcourse.jsp">ViewCourse</a>
                <a href="addcourse.jsp">Add New Course</a>
                <a href="modifycourse.jsp">Modify Course</a>
                <a href="deletecourse.jsp">Delete Course</a>
                </div>
            </li>
            <li  class="dropdown"><a href="#">Students</a>
                <div class="dropdown-content">
                <a href="viewallstudent.jsp">View students</a>
                <a href="addstudent.jsp">Add New student</a>
                <a href="modifystudent.jsp">Modify student</a>
                <a href="deletestudent.jsp">Delete student</a>
                </div>
            </li>
            <li  class="dropdown"><a href="#">Enrol</a>
                <div class="dropdown-content">
                <a href="enrol.jsp">Enrol</a>
                <a href="removestudent.jsp">Remove</a>
                </div>
            </li>
            <li><a href="fee.jsp">Fees</a></li>
            <li style="float:right"><img src="photo/logo_1.png"></a></li>
              <li style="float:right"><a href="logout.jsp">Logout</a></li>
        </ul>
        </div>
        <div id="course-table">
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
      String ir=request.getParameter("selectedEmployee");
       String quer=" select name,nam,eid,fees,studentid,amount,courseid from studentMaster Inner join CoursesEnrolled on CoursesEnrolled.studentid=studentMaster.id Inner join CourseMaster on CoursesEnrolled.courseid=CourseMaster.id Inner join feepaid on feepaid.id=CoursesEnrolled.eid where CoursesEnrolled.studentid="+ir+";";
      ResultSet rs = st.executeQuery(quer);
      
     
   %>  
  <%--
 CourseMaster(Nam,DURATION,TECHNOLOGY)
studentMaster(name,passord,email,mobile,city),
CoursesEnrolled(studentid,courseid,fees)
feepaid(studentid,amount)
  --%>
   <form method="post" action="fee_2.jsp">
      <table Id="course-table" align="center">
          <tr>
                <td>STUDENT NAME</td>
                <td>COURSE NAME</td>
                <td>TOTAL FEE</td>
                <td>FEE PAID</td>
                <td>FEES REMAINING</td>
                <td>Select</td>
            </tr>
          <%
 while(rs.next()){   
 %>
            <tr>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("nam")%></td>
                <td><%=rs.getInt("fees")%></td>
                <td><%=rs.getInt("amount")%></td>
                <td><%=rs.getInt("fees")-rs.getInt("amount")%></td>
                <td><input type="radio" name="selectedEmployee" value="<%=rs.getInt("eid")%>"</td>
                
            </tr>
            <%  }  %>
            <tr>
                 <td colspan="7" align="center" ><input type="submit" value="PAY FEES"></td>
                 
            </tr>
            </table>
             <br><br>
  </form>
           
  <%    
  }
  catch(Exception e){out.println(e);}
%>
     </div>
  </body>
</html>