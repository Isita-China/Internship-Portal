<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="sheet.css">
        <script src="validation.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="header">

                <div class="header_left">
                    <div class="header_text">
                        <a href="index_(login)_emp.html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">

                </div>

                <div class="header_right">
                    <div class="box">
                        <div class="logout">
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="display">

                <div class="left_pane">
                    <div class="menu">
                        <ul>
                            <li><a href="home_emp.jsp">Home</a></li>
                            <li><a href="employer_profile.jsp">Edit Profile</a></li>
                            <li><a href="post_internship.jsp">Post New Internship</a></li>
                            <li><a href="list_internship.jsp">List Posted Internship</a></li>
                            <li><a href="view_applicants_emp.jsp">View Applicants</a></li>
                            <li><a href="selected_applicants_emp.jsp">Selected Applicant</a></li>
                        </ul>
                    </div>
                </div>
        
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            String emp_mail = null;
            String in_id[]=null;
            in_id= request.getParameterValues("inter");
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                emp_mail = (String)session.getAttribute("emp_mail");
                stm = con.createStatement();
                String sql = "select * from internship where internship_code ='" +in_id[0]+ "'";
                rs = stm.executeQuery(sql);
                while (rs.next())
                {
                    session.setAttribute("get_in_id",in_id[0]);
        %>        
                
                <div class="right_pane">
                    <div class="list_applicants_detail">
                        <p class="text"><%=rs.getString("internship_profile")%></p>
        
        <%      
                }
                String sql1 = "select * from applicant where internship_code ='" +in_id[0]+ "'";
                rs = stm.executeQuery(sql1);
        %>                
                                        
                        <table class="list_applicants_table" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <th>Applicants Email</th>
                                <th>Applicants Name</th>
                                <th>Applicants Mobile No.</th>
                                <th>Personal Details</th>
                                <th>Educational Details</th>
                                <th>Internship Details</th>
                                <th>Resume</th>
                                <th width="15%">If you want to select the applicant then click on select</th>
                            </tr>
                            
        <%
               while (rs.next())
                { 
        %>
                            
                            <tr>
                                <td><%=rs.getString("std_email")%></td>
                                <td><%=rs.getString("std_name")%></td>
                                <td><%=rs.getString("std_mob_no")%></td>
                                <td><a href="view_applicants_PD.jsp?st_id=<%=rs.getString("std_user_email_id")%>">View</a></td>
                                <td><a href="view_applicants_ED_X.jsp?st_id=<%=rs.getString("std_user_email_id")%>">View</a></td>
                                <td><a href="view_applicants_ID.jsp?st_id=<%=rs.getString("std_user_email_id")%>">View</a></td>
                                <td><a style="color:blue;" href="resume/<%=rs.getString("Modified_Resume_name")%>?st_id=<%=rs.getString("std_user_email_id")%>"><%=rs.getString("Resume_name")%></a></td>
                                
                        <%
                            if(rs.getString("status").equals("selected"))
                            {
                        %>
                                
                                <td style="color:red;font-weight: bold;"><%=rs.getString("status")%></td>
                                
                        <%
                            }
                            else
                            {
                        %>
                
                                <td><a href="selection_process.jsp?st_id=<%=rs.getString("std_user_email_id")%>&icode=<%=in_id[0]%>" onclick="return confirm('Are you sure you want to select this applicant?');">Select</a></td>
                                
                        <%
                            }
                        %>
                                
                                
                            </tr>
                            
        <%                        
                }
                
                rs.close();
                stm.close();
                con.close();
            }            
            catch(SQLException e)
            {
                out.print("Throw e" + e);
            }
        %>  
        
                        </table>
                    </div>
                </div>
                
            </div>

            <div class="footer">

                <div class="footer_left">
                    <div class="footer_about_list">
                        <ul class="about_list">
                            <li class="top">Intern House</li>
                            <li><a href="about_us_(login)_emp.html">About us</a></li>
                            <li><a href="terms&condition_(login).html">Terms & Conditions</a></li>
                            <li><a href="contact_us_(login)_emp.html">Contact us</a></li>
                        </ul>
                    </div>
                </div>

                <div class="footer_center">
                    <div class="footer_stream_list">
                        <ul class="stream_list">
                            <li class="top">Internship by Stream</li>
                            <li><a href="">Computer Science Internship</a></li>
                            <li><a href="">Marketing Internship</a></li>
                            <li><a href="">Finance Internship</a></li>
                        </ul>
                    </div>
                </div>

                <div class="footer_right">
                    <div class="footer_text">&copy; Copyright 2022 Intern House</div>
                </div>

            </div>

        </div>
    </body>
</html>
