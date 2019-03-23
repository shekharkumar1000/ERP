
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
      <form method="post" action="addstudent_1.jsp"> 
          <table Id="course-table" align="center">
          <tr><td>Name</td><td><input type="text" name="name"></td></tr>
           <tr><td>Password</td><td><input type="text" name="passord"></td></tr>
            <tr><td>Email</td><td><input type="text" name="email"></td></tr>
          <tr><td>Mobile</td><td><input type="text" name="mobile"></td></tr>
            <tr><td>City</td><td><input type="text" name="city"></td></tr>
            <tr><TD>Submit The Details</TD><td><input type="Submit" value="ADD STUDENT"></td></tr>
         </form>   
    </body>
</html>
 <%--
   
   create table students (ID integer auto_increment,Name varchar(20) not null,passord varchar(20) not null,email varchar(20) not null
,mobile varchar(20) not null,city varchar(20) not null,primary key(id));

insert into students(name,passord,email,mobile,city) values ('jack','jack123','jack@gmail.com','123456','london');
insert into students(name,passord,email,mobile,city) values ('bob','bob123','bob@gmail.com','123457','paris');
insert into students(name,passord,email,mobile,city) values ('satya','satya123','satya@gmail.com','123489','new york');
select * from students;
   --%>


