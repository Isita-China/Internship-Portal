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
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                stu_mail=(String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                String sql = "select * from Student_PD where std_email ='" + stu_mail + "'";
                rs = stm.executeQuery(sql);

                while (rs.next())
                {
        %>    
            
            <div class="display">
                
                <div class="left_pane">
                    <p class="msg"><%=rs.getString("std_name")%></p>
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
                        <p class="text2">Personal Details</p>
                        
                        <div class="pd_left">
                            <div class="pd_stu_name">
                                <p class="text">Name :</p>
                                <p class="text1"><%=rs.getString("std_name")%></p>
                            </div>
                            
                            <div class="pd_stu_email">
                                <p class="text">Email :</p>
                                <p class="text1"><%=rs.getString("std_email")%></p>
                            </div>
                            
                            <div class="pd_stu_address">
                                <p class="text">Address :</p>
                                <p class="text1"><%=rs.getString("std_address")%></p>
                            </div>
                            
                            <div class="pd_stu_state">
                                <p class="text">State :</p>
                                <p class="text1"><%=rs.getString("std_state")%></p>
                            </div>
                            
                            <div class="pd_stu_city">
                                <p class="text">City :</p>
                                <p class="text1"><%=rs.getString("std_city")%></p>
                            </div>
                        </div>
                        
                        <div class="pd_right">
                            <div class="pd_stu_mob">
                                <p class="text">Mobile Number :</p>
                                <p class="text1"><%=rs.getString("std_mob_no")%></p>
                            </div>
                            
                            <div class="pd_stu_dob">
                                <p class="text">Date Of Birth :</p>
                                <p class="text1"><%=rs.getString("std_dob")%></p>
                            </div>
                            
                            <div class="pd_stu_gender">
                                <p class="text">Gender :</p>
                                <p class="text1"><%=rs.getString("std_gender")%></p>
                            </div>
                            
                            <div class="pd_stu_district">
                                <p class="text">District :</p>
                                <p class="text1"><%=rs.getString("std_district")%></p>
                            </div>
                            
                            <div class="pd_stu_pincode">
                                <p class="text">Pincode :</p>
                                <p class="text1"><%=rs.getString("std_pincode")%></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="next">
                        <input class="next_button" type="submit" name="next_button" value="Next" onclick="location.href='view_profile-ED(X).jsp'">
                    </div>
                </div>
        
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
