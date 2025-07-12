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
            
            String nm="";
            String stat="";
            String st="";
            String clg="";
            int syr=0;
            int eyr=0;
            String ps="";
            float mk=00.00f;
            String edty="";
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
                
                String sql = "select * from Student_ED_Diploma where std_email ='" + stu_mail + "'";
                rs = stm.executeQuery(sql);

                while (rs.next())
                {
                    stat=rs.getString("std_diploma_status");
                    st=rs.getString("std_stream");
                    clg=rs.getString("std_college");
                    syr=rs.getInt("std_start_year");
                    eyr=rs.getInt("std_end_year");
                    ps=rs.getString("std_performance_scale");
                    mk=rs.getFloat("std_marks");
                    edty=rs.getString("std_education_type");
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
                        <p class="text2">Educational Details</p>
                        <p class="text3">Diploma</p>
                        
                        <div class="ed">
                            <div class="ed_stu_status">
                                <p class="text">Diploma Status :</p>
                                <p class="text1"><%=stat%></p>
                            </div>
                            
                            <div class="ed_stu_stream">
                                <p class="text">Stream :</p>
                                <p class="text1"><%=st%></p>
                            </div>
                            
                            <div class="ed_stu_college">
                                <p class="text">College/University :</p>
                                <p class="text1"><%=clg%></p>
                            </div>
                            
                            <div class="ed_stu_year">
                                <p class="text">Start Year :</p>
                                <p class="text1"><%=syr%></p>
                                <p class="text">End Year :</p>
                                <p class="text1"><%=eyr%></p>
                            </div>
                            
                            <div class="ed_stu_marks">
                                <p class="text">Marks :</p>
                                <p class="text1"><%=ps%> <%=mk%></p>
                            </div>
                            
                            <div class="ed_stu_education_type">
                                <p class="text">Education type :</p>
                                <p class="text1"><%=edty%></p>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="next">
                        <input class="next_button" type="button" name="next_button" value="Next" onclick="location.href='view_profile-ED(GD).jsp'">
                        <input class="back_button" type="button" name="back_button" value="Back" onclick="location.href='view_profile-ED(XII).jsp'">
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
