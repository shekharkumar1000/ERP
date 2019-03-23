
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shekhar's Enrollment System</title>
        <link rel="stylesheet" href="css.css"/>
    </head>
 <body background="photo/r.bmp">
        <%
             session.removeAttribute("username");
            %>
        <div id="course-table">
        <ul>
          <li style="float:right"><img src="photo/logo_1.png"></li>
              <li  class="active"><a href="home.jsp">Login</a></li>
        </ul>
        </div>
    <center><h1>You are not logged in. Please Login again</h1></center>
    </body>
</html>
