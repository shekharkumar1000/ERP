package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

public final class fee_005f1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Shekhar's Enrollment System</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css.css\"/>\n");
      out.write("    </head>\n");
      out.write("   <body background=\"photo/r.bmp\">\n");
      out.write("        <div id=\"course-table\">\n");
      out.write("        <ul>\n");
      out.write("            <li class=\"active\"><a href=\"admin.jsp\">Home</a></li>\n");
      out.write("            <li class=\"dropdown\"><a href=\"#\">Course</a>\n");
      out.write("                <div class=\"dropdown-content\">\n");
      out.write("                <a href=\"viewallcourse.jsp\">ViewCourse</a>\n");
      out.write("                <a href=\"addcourse.jsp\">Add New Course</a>\n");
      out.write("                <a href=\"modifycourse.jsp\">Modify Course</a>\n");
      out.write("                <a href=\"deletecourse.jsp\">Delete Course</a>\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("            <li  class=\"dropdown\"><a href=\"#\">Students</a>\n");
      out.write("                <div class=\"dropdown-content\">\n");
      out.write("                <a href=\"viewallstudent.jsp\">View students</a>\n");
      out.write("                <a href=\"addstudent.jsp\">Add New student</a>\n");
      out.write("                <a href=\"modifystudent.jsp\">Modify student</a>\n");
      out.write("                <a href=\"deletestudent.jsp\">Delete student</a>\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("            <li  class=\"dropdown\"><a href=\"#\">Enrol</a>\n");
      out.write("                <div class=\"dropdown-content\">\n");
      out.write("                <a href=\"enrol.jsp\">Enrol</a>\n");
      out.write("                <a href=\"removestudent.jsp\">Remove</a>\n");
      out.write("                </div>\n");
      out.write("            </li>\n");
      out.write("            <li><a href=\"fee.jsp\">Fees</a></li>\n");
      out.write("            <li style=\"float:right\"><img src=\"photo/logo_1.png\"></a></li>\n");
      out.write("              <li style=\"float:right\"><a href=\"logout.jsp\">Logout</a></li>\n");
      out.write("        </ul>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"course-table\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

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
      
     
   
      out.write("  \n");
      out.write("  ");
      out.write("\n");
      out.write("   <form method=\"post\" action=\"fee_2.jsp\">\n");
      out.write("      <table Id=\"course-table\" align=\"center\">\n");
      out.write("          <tr>\n");
      out.write("                <td>STUDENT NAME</td>\n");
      out.write("                <td>COURSE NAME</td>\n");
      out.write("                <td>TOTAL FEE</td>\n");
      out.write("                <td>FEE PAID</td>\n");
      out.write("                <td>FEES REMAINING</td>\n");
      out.write("                <td>Select</td>\n");
      out.write("            </tr>\n");
      out.write("          ");

 while(rs.next()){   
 
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(rs.getString("name"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("nam"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getInt("fees"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getInt("amount"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getInt("fees")-rs.getInt("amount"));
      out.write("</td>\n");
      out.write("                <td><input type=\"radio\" name=\"selectedEmployee\" value=\"");
      out.print(rs.getInt("eid"));
      out.write("\"</td>\n");
      out.write("                \n");
      out.write("            </tr>\n");
      out.write("            ");
  }  
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                 <td colspan=\"7\" align=\"center\" ><input type=\"submit\" value=\"PAY FEES\"></td>\n");
      out.write("                 \n");
      out.write("            </tr>\n");
      out.write("            </table>\n");
      out.write("             <br><br>\n");
      out.write("  </form>\n");
      out.write("           \n");
      out.write("  ");
    
  }
  catch(Exception e){out.println(e);}

      out.write("\n");
      out.write("     </div>\n");
      out.write("  </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
