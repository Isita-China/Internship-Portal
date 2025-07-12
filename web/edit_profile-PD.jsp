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
            String stu_mail = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                stu_mail=(String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                String sql="select * from Student_PD where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql);   
                String m="";
                String f="";
                String cm="";
                String cf="";
                
                if(rs.next())
                {
                    if(rs.getString("std_gender").equals(""))
                    {
                        m="Male";
                        f="Female";
                    }
                    else if(rs.getString("std_gender").equals("Male"))
                    {
                        m="Male";
                        f="Female";
                        cm="checked";
                    }
                    else
                    {
                        m="Male";
                        f="Female";
                        cf="checked";
                    }
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
                    <form class="personal_detail_form" name="personal_detail_form" onsubmit="return personal_detail_validation()" method="POST" action="personal_detail.jsp">
                        
                        <div class="personal_detail">
                            <p class="text1">Personal Details</p>
                                         
                            <div class="pd_left">
                                <div class="pd_form_name">
                                    <p class="text">Name :</p>
                                    <input class="name" type="text" name="name" value="<%=rs.getString("std_name")%>">
                                </div>
                                
                                <div class="pd_form_email">
                                    <p class="text">Email :</p>
                                    <input class="email" type="text" name="email" value="<%=rs.getString("std_email")%>" disabled>
                                </div>
                                
                                <div class="pd_form_address">
                                    <p class="text">Address :</p>
                                    <textarea class="address" type="text" name="address"><%=rs.getString("std_address")%></textarea>
                                </div>
                                
                                <div class="pd_form_state">
                                    <p class="text">State :</p>
                                    <input class="state" type="text" name="state" value="<%=rs.getString("std_state")%>">
                                </div>
                                
                                <div class="pd_form_city">
                                    <p class="text">City :</p>
                                    <input class="city" type="text" name="city" value="<%=rs.getString("std_city")%>">
                                </div>
                                
                            </div>
                            
                            <div class="pd_right">
                                <div class="pd_form_mob">
                                    <p class="text">Mobile Number :</p>
                                    <input class="mob_no" type="text" name="mob_no" value="<%=rs.getString("std_mob_no")%>">
                                </div>
                                
                                <div class="pd_form_dob">
                                    <p class="text">Date Of Birth :</p>
                                    <input class="dob" type="date" name="dob" value="<%=rs.getString("std_dob")%>">
                                </div>
                                
                                <div class="pd_form_gender">
                                    <p class="text">Gender :</p>
                                    
                                    <ul class="gender_list">
                                        <li>        
                                            <p class="text2">Male</p>
                                            <input class="gender_male" type="radio" name="gender" value="<%=m%>" <%=cm%>>
                                        </li>
                                        <li class="female">
                                            <p class="text2">Female</p>
                                            <input class="gender_female" type="radio" name="gender" value="<%=f%>" <%=cf%>>
                                        </li>
                                    </ul>
                                </div>
                                
                                <div class="pd_form_district">
                                    <p class="text">District :</p>
                                    <input class="district" type="text" name="district" value="<%=rs.getString("std_district")%>">
                                </div>

                                <div class="pd_form_pincode">
                                    <p class="text">Pincode :</p>
                                    <input class="pincode" type="text" name="pincode" value="<%=rs.getString("std_pincode")%>">
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="save_next">
                            <input class="save_next_button" type="submit" name="save_next_button" value="Save & Next">
                        </div>
                        
                    </form> 
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
