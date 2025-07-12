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
                        <a href="index_(login).html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">
                    <ul>
                        <li class="option"><a href="edit_profile-PD.jsp">Personal Details</a></li>
                        <li class="edu_menu">
                            <a href="edit_profile-ED(X).jsp">Educational Details <span style='font-size:15px;'>&#9660</span></a>
                            <ul class="menu_content">
                                <li><a href="edit_profile-ED(X).jsp">Class X</a></li>
                                <li><a href="edit_profile-ED(XII).jsp">Class XII</a></li>
                                <li><a href="edit_profile-ED(Diploma).jsp">Diploma</a></li>
                                <li><a href="edit_profile-ED(GD).jsp">Graduation</a></li>
                                <li><a href="edit_profile-ED(PGD).jsp">Post-Graduation</a></li>
                            </ul>
                        </li>
                        <li><a href="edit_profile-ID.jsp">Internship Details</a></li>
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
                
                String sql1="select std_email,Resume_name,Modified_Resume_name from student_resume where std_email ='"+stu_mail+"'";
                rs=stm.executeQuery(sql1);
                
                String em="";
                String rnm="";
                String mod="";
                while(rs.next())
                {
                    em=rs.getString("std_email");
                    rnm=rs.getString("Resume_name");
                    mod=rs.getString("Modified_Resume_name");
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
                    <form class="resume_detail_form" enctype="multipart/form-data" name="resume_detail_form" method="POST" action="file_upload.jsp">

                        <div class="resume_detail">
                            
                            <p class="text1">Resume Upload</p>    
                            
        <%
            if(stu_mail.equals(em))
            {
        %>                
        
                            <div class="resume">
                                <div>Attach Resume:
                                    <span style="margin-left: 2%;">
                                        <a href="resume/<%=mod%>"><%=rnm%></a>
                                    </span>
                                    <span style="margin-left: 10%;">
                                        <a href="delete_resume.jsp" onclick="return confirm('Are you sure you want to delete this resume?');">Delete</a>
                                    </span>
                                </div>
                                
                                <p>Click on the "Choose File" button to update a file:</p>
                                
                                <div>Select File:
                                    <span style="margin-left: 2%;">
                                        <input type="file" name="filename" size="50" accept=".doc,.docx,.pdf" required>
                                    </span>
                                </div>
                                
                                <div style="margin-left: 12.5%;">
                                    <input type="submit" value="Update File">
                                </div>
           
                            </div>
        <%
            }
            else
            {
        %>                  
                            <div class="resume">
                                
                                <p>Click on the "Choose File" button to upload a file:</p>
                                
                                <div>Select File:
                                    <span style="margin-left: 2%;">
                                        <input type="file" name="filename" size="50" accept=".doc,.docx,.pdf" required>
                                    </span>
                                </div>
                                
                                <div style="margin-left: 12.5%;">
                                    <input type="submit" value="Upload File">
                                </div>
           
                            </div>
                            
        <%
            }
        %>
        
                        </div>

                    </form> 
                </div>

            </div>
        
        <%
                rs.close();
                stm.close();
                con.close();
            }            
            catch(SQLException e)
            {
                out.print("Throw e" + e);
            }
        %>
        
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
