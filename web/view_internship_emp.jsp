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
        %>     
                
                <div class="right_pane">
                    <div class="view_internship_detail">

                        <div class="pd_left">
                            <div class="id_code">
                                <p class="text">Internship Code :</p>
                                <p class="text1"><%=rs.getString("internship_code")%></p>
                            </div>
                            
                            <div class="id_profile">
                                <p class="text">Internship Profile :</p>
                                <p class="text1"><%=rs.getString("internship_profile")%></p>
                            </div>
                            
                            <div class="id_location">
                                <p class="text">Location :</p>
                                <p class="text1"><%=rs.getString("location")%></p>
                            </div>
                            
                            <div class="id_skill">
                                <p class="text">Skills Required :</p>
                                <p class="text1"><%=rs.getString("skills")%></p>
                            </div>
                            
                            <div class="id_responsibility">
                                <p class="text">Responsibilities :</p>
                                <p class="text1"><%=rs.getString("responsibilities")%></p>
                            </div>
                            
                            <div class="id_other_skill">
                                <p class="text">Other Skills (optional) :</p>
                                <p class="text1"><%=rs.getString("other_skills")%></p>
                            </div>
                            
                            <div class="id_dop">
                                <p class="text">Date of Posting :</p>
                                <p class="text1"><%=rs.getString("Posting_date")%></p>
                            </div>
                        </div>

                        <div class="pd_right">
                            <div class="id_experience">
                                <p class="text">Experience :</p>
                                <p class="text1"><%=rs.getString("experience")%></p>
                            </div>
                            
                            <div class="id_duration">
                                <p class="text">Duration :</p>
                                <p class="text1"><%=rs.getString("duration")%></p>
                            </div>
                            
                            <div class="id_stipend">
                                <p class="text">Stipend :</p>
                                <p class="text1"><%=rs.getString("stipend")%></p>
                            </div>
                            
                            <div class="id_description">
                                <p class="text">Description :</p>
                                <p class="text1"><%=rs.getString("description")%></p>
                            </div>
                            
                        </div>

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
