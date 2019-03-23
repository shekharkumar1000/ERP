<%-- 
    Document   : LoginForm
    Created on : Dec 15, 2018, 10:49:01 AM
    Author     : HP
--%><title>Shekhar's Enrollment System</title>
 <body background="photo/r.bmp">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css.css"/>
 <div id="course-table">
<% 
   String user =(String)session.getAttribute("username");
   if(user==null){
%>
<form method="post" action="LoginForm_1.jsp">
    <div id="course-table">
        <ul>
            <li class="active"><a href="home.jsp">Home</a></li>
               <li style="float:right"><img src="photo/logo_1.png"></li>
        </ul>
        </div>
         <table Id="course-table" align="center">
             <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password"></td>
            </tr>
             <tr>
                 <td colspan="2" align="center" ><input type="submit" value="LOGIN"></td>
                 <td></td>
            </tr>
        </table>
    
</form>

<%
  }
else{
  response.sendRedirect("DisplayMessages.jsp");
}
%>
 </div>
 </body>