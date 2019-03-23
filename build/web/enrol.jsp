
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
  String driver="com.mysql.jdbc.Driver";
  String userName="root";
  String password="";
  Statement st;
  Statement sut;
  Statement sit;
  try{
      Class.forName(driver).newInstance();
      conn= DriverManager.getConnection(url+dbName,userName,password);
      st=conn.createStatement();
      sut=conn.createStatement();
      sit=conn.createStatement();
     String quer="SELECT * from CourseMaster;";
      ResultSet rs = st.executeQuery(quer);
       String uer="SELECT * from studentMaster;";
      ResultSet rsu = sut.executeQuery(uer);
        String er="SELECT * from CourseMaster;";
      ResultSet rst = sit.executeQuery(er);
   %>   

       <form method="post" action="enrol_2.jsp">
     <table Id="course-table" align="center">
          <tr><td>Select The Student To Enroll</td>
              <td><select name="selectedstudent">
                 <% while(rsu.next()){  %>
                 <option value="<%=rsu.getInt("id")%>">
                     <%=rsu.getString("name")%>
                     <%}%>
                 </option>
                </select>
              </td>
          </tr>
          <tr><td>Select The Course To Optain</td>
              <td><select name="selectedcourse">
               <% while(rs.next()){  %>
                 <option value="<%=rs.getInt("id")%>">
                     <%=rs.getString("nam")%>
                     <%}%>
                 </option>
                </select>
              </td>
          </tr>
          <tr><td>Select a Fee</td>
              <td><select name="selectedfees">
                <% while(rst.next()){  %>
                 <option value="<%=rst.getInt("id")%>">
                     <%=rst.getInt("fees")%>
                         <%}%>
                 </option>
                </select>
              </td>
          </tr>
           <tr>
                <td colspan="2" align="center" ><input type="Submit" value="ENROL"></td>
           </tr>
      </table>
</form>
  <%    
  }
  catch(Exception e){out.println(e);}
%>

    </body>
</html>