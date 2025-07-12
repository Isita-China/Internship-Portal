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
            
            String nm="";
            String bd="";
            int yr=0;
            String st="";
            String ps="";
            float mk=00.00f;
            String sc="";
            String ch_ft="";
            String ch_cor="";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                stu_mail=(String)session.getAttribute("stu_mail");
                stm = con.createStatement();
            
                String sql1="select std_name from Student where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql1);
                
                if(rs.next())
                {
                    nm=rs.getString("std_name"); 
                }
                
                String sql="select * from Student_ED_XII where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql);   
                       
                if(rs.next())
                {
                    bd=rs.getString("std_board");
                    yr=rs.getInt("std_passing_year");
                    st=rs.getString("std_stream");
                    ps=rs.getString("std_performance_scale");
                    mk=rs.getFloat("std_marks");
                    sc=rs.getString("std_school");
                  
                    if(rs.getString("std_education_type").equals("Fulltime"))
                    {
                        ch_ft="checked";
                    }
                    else
                    {
                        ch_cor="checked";
                    }
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
                    <form class="educational_detail_form" name="class_XII_form" onsubmit="return class_XII_validation()" method="POST" action="class_XII.jsp">

                        <div class="educational_detail">
                            <p class="text1">Educational Details</p>             
                            <p class="text2">12th Class (XII)</p>

                            <div class="class_X_XII">
                                <div class="ed_form_board">
                                    <p class="text">Board :</p>
                                    <input class="board" type="text" name="board" value="<%=bd%>">
                                </div>

                                <div class="ed_form_year">
                                    <p class="text">Passing Year :</p>
                                    <script>
                                        var year;
                                        document.write("<select class='year' name='year'>");
                                        document.write("<option value=''>--select--</option>");
                                        for (year = 1990; year <= 2022; year++)
                                        {
                                            if(year === <%=yr%>)
                                                document.write("<option value='<%=yr%>' selected='selected'><%=yr%></option>");
                                            else                                                   
                                                document.write("<option value='" + year + "'>" + year + "</option>");
                                        }
                                        document.write("</select>");
                                    </script>
                                </div>

                                <div class="ed_form_stream">
                                    <p class="text">Stream :</p>
                                    <select class="stream" name="stream">
                                        <option value="">--select--</option>
                                        <%if(!st.equals("")) out.print("<option value='"+st+"' selected='selected'>"+st+"</option>");%>
                                        <option value="Arts">Arts</option>
                                        <option value="Science">Science</option>
                                        <option value="Commerce">Commerce</option>
                                    </select>
                                </div>

                                <div class="ed_form_marks">
                                    <p class="text">Marks :</p>
                                    <select class="marks_scale" name="marks_scale">
                                        <option value="">--performance scale--</option>
                                        <%if(!ps.equals("")) out.print("<option value='"+ps+"' selected='selected'>"+ps+"</option>");%>
                                        <option value="Percentage">Percentage</option>
                                        <option value="CGPA">CGPA (Scale of 10)</option>
                                    </select>
                                    
                                    <input class="marks" type="text" name="marks" value="<%=mk%>">
                                </div>

                                <div class="ed_form_school">
                                    <p class="text">School :</p>
                                    <input class="school" type="text" name="school" value="<%=sc%>">
                                </div>

                                <div class="ed_form_education_type">
                                    <p class="text">Education type :</p>
                                    <p class="text3">Full time</p>
                                    <input class="education_type" type="radio" name="education_type" value="Fulltime" <%=ch_ft%>>
                                    <p class="text3">Correspondence</p>
                                    <input class="education_type" type="radio" name="education_type" value="Correspondence" <%=ch_cor%>>
                                </div>   
                            </div>


                        </div>

                        <div class="save_next">
                            <input class="save_next_button" type="submit" name="save_next_button" value="Save & Next">
                        </div>

                    </form> 
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
