
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
      
   String selectedstudent=(String)session.getAttribute("selectedstudent");
        String selectedcourse=(String)session.getAttribute("selectedcourse");
         String selectedfees=(String)session.getAttribute("selectedfees");
      String query="insert into CoursesEnrolled(studentid,courseid,feeid)values("+selectedstudent+","+selectedcourse+","+selectedfees+")";
      int result=st.executeUpdate(query);
       String uery="insert into feepaid(studentsid,amount)values("+selectedstudent+",0)";
      int resut=st.executeUpdate(uery);
%> 
   <center><h1>STUDENT ENROLLED FOR THE COURSE SUCCESSFULLY</h1></center><BR><BR>

<%
 
}
catch(Exception e){out.println(e);}
%> 
            
</form>  

    </body>
</html>



