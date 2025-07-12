<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="sheet.css">
    </head>
    <body>
        <div class="container">
            <div class="header">

                <div class="header_left">
                    <div class="header_text">
                        <a href="index_(login).html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">
                    <ul>
                        <li class="option"><a href="view_profile-PD.jsp">Personal Details</a></li>
                        <li class="edu_menu">
                            <a href="view_profile-ED(X).jsp">Educational Details <span style='font-size:15px;'>&#9660</span></a>
                            <ul class="menu_content">
                                <li><a href="view_profile-ED(X).jsp">Class X</a></li>
                                <li><a href="view_profile-ED(XII).jsp">Class XII</a></li>
                                <li><a href="view_profile-ED(Diploma).jsp">Diploma</a></li>
                                <li><a href="view_profile-ED(GD).jsp">Graduation</a></li>
                                <li><a href="view_profile-ED(PGD).jsp">Post-Graduation</a></li>
                            </ul>
                        </li>
                        <li><a href="view_profile-ID.jsp">Internship Details</a></li>
                    </ul>
                </div>

                <div class="header_right">
                    <div class="box">
                        <div class="logout">
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </div>
                </div>

            </div>

        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            String stu_mail = null;
            String nm=null;
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                stu_mail=(String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                String sql1="select std_name from Student where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql1);
                
                if(rs.next())
                {
                    nm=rs.getString("std_name"); 
                }
        %>        
        
            <div class="display">
                
                <div class="left_pane">
                    <p class="msg"><%=nm%></p>
                    <div class="menu">
			<ul>
                            <li><a href="home.jsp">Home</a></li>
                            <li><a href="edit_profile-PD.jsp">Edit Profile</a></li>
                            <li><a href="applied_internship.jsp">Applied Internship</a></li>
                            <li><a href="apply_internship.jsp">Apply Internship</a></li>
                            <li><a href="upload_resume.jsp">Resume Upload</a></li>
                            <li><a href="change_email.jsp">Change Email-id</a></li>
                        </ul>
                    </div>
                </div>
                             
                <div class="right_pane">
                    <div class="view_profile_detail_stu">
                        <p class="text2">Internship Details</p>
                        
                        <table class="view_internship_table" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <th>Profile</th>
                                <th>Organization</th>
                                <th>Location</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr> 
                            
        <%
                String sql = "select * from Student_ID where std_email ='" + stu_mail + "'";
                rs = stm.executeQuery(sql);

                while (rs.next())
                {
        %>       
        
                            <tr>
                                <td><%=rs.getString("std_profile")%></td>
                                <td><%=rs.getString("std_organization")%></td>
                                <td><%=rs.getString("std_location")%></td>
                                <td><%=rs.getString("std_start_date")%></td>
                                <td><%=rs.getString("std_end_date")%></td>
                                <td><a href="edit_internship_stu.jsp?in=<%=rs.getString("sl_no")%>" onclick="return confirm('Are you sure you want to edit this internship?');">Edit</a></td>
                                <td><a href="delete_internship_stu.jsp?in=<%=rs.getString("sl_no")%>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
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
                    
                    <div class="next">
                        <input class="next_button" type="button" name="next_button" value="Next" onclick="location.href='home.jsp'">
                        <input class="back_button" type="button" name="back_button" value="Back" onclick="location.href='view_profile-ED(PGD).jsp'">
                    </div>
                </div>
        
        
        
            </div>

            <div class="footer">

                <div class="footer_left">
                    <div class="footer_about_list">
                        <ul class="about_list">
                            <li class="top">Intern House</li>
                            <li><a href="about_us_(login).html">About us</a></li>
                            <li><a href="terms&condition_(login).html">Terms & Conditions</a></li>
                            <li><a href="contact_us_(login).html">Contact us</a></li>
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
