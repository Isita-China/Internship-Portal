package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class upload_005fresume_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"sheet.css\">\n");
      out.write("        <script src=\"validation.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"header\">\n");
      out.write("\n");
      out.write("                <div class=\"header_left\">\n");
      out.write("                    <div class=\"header_text\">\n");
      out.write("                        <a href=\"index_(login).html\">Intern House</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"header_center\">\n");
      out.write("                    <ul>\n");
      out.write("                        <li class=\"option\"><a href=\"edit_profile-PD.jsp\">Personal Details</a></li>\n");
      out.write("                        <li class=\"edu_menu\">\n");
      out.write("                            <a href=\"edit_profile-ED(X).jsp\">Educational Details <span style='font-size:15px;'>&#9660</span></a>\n");
      out.write("                            <ul class=\"menu_content\">\n");
      out.write("                                <li><a href=\"edit_profile-ED(X).jsp\">Class X</a></li>\n");
      out.write("                                <li><a href=\"edit_profile-ED(XII).jsp\">Class XII</a></li>\n");
      out.write("                                <li><a href=\"edit_profile-ED(Diploma).jsp\">Diploma</a></li>\n");
      out.write("                                <li><a href=\"edit_profile-ED(GD).jsp\">Graduation</a></li>\n");
      out.write("                                <li><a href=\"edit_profile-ED(PGD).jsp\">Post-Graduation</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li><a href=\"edit_profile-ID.jsp\">Internship Details</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"header_right\">\n");
      out.write("                    <div class=\"box\">\n");
      out.write("                        <div class=\"logout\">\n");
      out.write("                            <a href=\"logout.jsp\">Logout</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        ");
    
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            String stu_mail=null;
            String nm=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                stu_mail=(String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                String sql="select std_name from Student where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql);
                
                if(rs.next())
                {
                    nm=rs.getString("std_name"); 
                }
                
                rs.close();
                stm.close();
                con.close();
            }            
            catch(SQLException e)
            {
                out.print("Throw e" + e);
            }
        
      out.write("    \n");
      out.write("            \n");
      out.write("            <div class=\"display\">\n");
      out.write("\n");
      out.write("                <div class=\"left_pane\">\n");
      out.write("                    <p class=\"msg\">");
      out.print(nm);
      out.write("</p>\n");
      out.write("                    <div class=\"menu\">\n");
      out.write("                        <ul>\n");
      out.write("                            <li><a href=\"home.jsp\">Home</a></li>\n");
      out.write("                            <li><a href=\"edit_profile-PD.jsp\">Edit Profile</a></li>\n");
      out.write("                            <li><a href=\"applied_internship.jsp\">Applied Internship</a></li>\n");
      out.write("                            <li><a href=\"apply_internship.jsp\">Apply Internship</a></li>\n");
      out.write("                            <li><a href=\"upload_resume.jsp\">Resume Upload</a></li>\n");
      out.write("                            <li><a href=\"change_email.jsp\">Change Email-id</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"right_pane\">\n");
      out.write("                    <form class=\"resume_detail_form\" name=\"resume_detail_form\" method=\"POST\" action=\"file_upload.jsp\">\n");
      out.write("\n");
      out.write("                        <div class=\"resume_detail\">\n");
      out.write("                            \n");
      out.write("                            <p class=\"text1\">Resume Upload</p>    \n");
      out.write("                            \n");
      out.write("                            <div class=\"resume\">\n");
      out.write("                                \n");
      out.write("                                <p>Click on the \"Choose File\" button to upload a file:</p>\n");
      out.write("                                \n");
      out.write("                                <div>Select File:\n");
      out.write("                                    <span style=\"margin-left: 2%;\">\n");
      out.write("                                        <input type=\"file\" name=\"filename\" size=\"50\" accept=\".doc,.docx,.pdf\">\n");
      out.write("                                    </span>\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                                <div style=\"margin-left: 12.5%;\">\n");
      out.write("                                    <input type=\"submit\" value=\"Upload File\">\n");
      out.write("                                </div>\n");
      out.write("                                    \n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </form> \n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footer\">\n");
      out.write("\n");
      out.write("                <div class=\"footer_left\">\n");
      out.write("                    <div class=\"footer_about_list\">\n");
      out.write("                        <ul class=\"about_list\">\n");
      out.write("                            <li class=\"top\">Intern House</li>\n");
      out.write("                            <li><a href=\"about_us_(login).html\">About us</a></li>\n");
      out.write("                            <li><a href=\"terms&condition_(login).html\">Terms & Conditions</a></li>\n");
      out.write("                            <li><a href=\"contact_us_(login).html\">Contact us</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"footer_center\">\n");
      out.write("                    <div class=\"footer_stream_list\">\n");
      out.write("                        <ul class=\"stream_list\">\n");
      out.write("                            <li class=\"top\">Internship by Stream</li>\n");
      out.write("                            <li><a href=\"\">Computer Science Internship</a></li>\n");
      out.write("                            <li><a href=\"\">Marketing Internship</a></li>\n");
      out.write("                            <li><a href=\"\">Finance Internship</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"footer_right\">\n");
      out.write("                    <div class=\"footer_text\">&copy; Copyright 2019 Intern House</div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
