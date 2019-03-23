
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
                <a href="viewallstudent.jsp">Enrol</a>
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
      String nam=request.getParameter("nam");
      String id=request.getParameter("id");
      String duration=request.getParameter("duration");
      String technology=request.getParameter("technology");
       String qq="Update CourseMaster set id="+id+" where id="+id+" ;";
        int resu = st.executeUpdate(qq);
        String r="Update CourseMaster set nam='"+nam+"' where id="+id+" ;";
        int rer = st.executeUpdate(r);
        String up="Update CourseMaster set duration='"+duration+"' where id="+id+" ;";
         int rr = st.executeUpdate(r);
        String uup="Update CourseMaster set technology='"+technology+"' where id="+id+" ;";
        int ry = st.executeUpdate(uup);
       String quer="SELECT * FROM CourseMaster";
      ResultSet rs = st.executeQuery(quer);
      
   %>   
   <%--
CourseMaster(Name,DURATION,TECHNOLOGY),studentMaster(name,passord,email,mobile,city),
CoursesEnrolled(studentid,courseid),feepaid
  --%>
       <form method="post" action="deletecourse_1.jsp">
      <table Id="course-table" align="center">
      <tr><td>SELECT THE COURSE TO DELETE</td><td><select name="selectedEmployee">
<% while(rs.next()){ %><option value=<%=rs.getInt("id")%>><%=rs.getString("name")%><%}%></option></form></select><br> </td>
           <tr><td>SELECT THE COURSE TO DELETE</td><td><select name="selectedEmployee">
<% while(rs.next()){ %><option value=<%=rs.getInt("id")%>><%=rs.getString("nam")%><%}%></option></form></select><br> </td>
                <tr><td>SELECT THE COURSE TO DELETE</td><td><select name="selectedEmployee">
<% while(rs.next()){ %><option value=<%=rs.getInt("id")%>><%=rs.getString("name")%><%}%></option></form></select><br> </td>
                     <tr><td>SELECT THE COURSE TO DELETE</td><td><select name="selectedEmployee">
<% while(rs.next()){ %><option value=<%=rs.getInt("id")%>><%=rs.getString("name")%><%}%></option></form></select><br> </td>
      </table>
</form>
  <%    
  }
  catch(Exception e){out.println(e);}
%>

    </body>
</html>