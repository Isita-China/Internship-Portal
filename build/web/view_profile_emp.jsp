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
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                emp_mail = (String)session.getAttribute("emp_mail");
                stm = con.createStatement();
                String sql = "select * from Employer_PD where com_email ='" + emp_mail + "'";
                rs = stm.executeQuery(sql);

                while (rs.next())
                {
        %>        
                
                <div class="right_pane">
                    <div class="view_profile_detail">

                        <div class="pd_left">
                            <div class="pd_comp_name">
                                <p class="text">Company Name :</p>
                                <p class="text1"><%=rs.getString("com_name")%></p>
                            </div>
                            
                            <div class="pd_comp_email">
                                <p class="text">Official Email Id :</p>
                                <p class="text1"><%=rs.getString("com_email")%></p>
                            </div>
                            
                            <div class="pd_comp_mob">
                                <p class="text">Mobile Number :</p>
                                <p class="text1"><%=rs.getString("com_mob_no")%></p>
                            </div>
                            
                            <div class="pd_comp_CIN">
                                <p class="text">CIN :</p>
                                <p class="text1"><%=rs.getString("com_CIN")%></p>
                            </div>
                            
                            <div class="pd_comp_RegNO">
                                <p class="text">Registration Number :</p>
                                <p class="text1"><%=rs.getString("com_registration_no")%></p>
                            </div>
                            
                            <div class="pd_comp_industry">
                                <p class="text">Industry type :</p>
                                <p class="text1"><%=rs.getString("com_industry_type")%></p>
                            </div>
                            
                            <div class="pd_comp_DOI">
                                <p class="text">Date of Incorporation :</p>
                                <p class="text1"><%=rs.getString("com_DOI")%></p>
                            </div>
                        </div>

                        <div class="pd_right">
                            <div class="pd_comp_address">
                                <p class="text">Office Address :</p>
                                <p class="text1"><%=rs.getString("com_address")%></p>
                            </div>
                            
                            <div class="pd_comp_country">
                                <p class="text">Country :</p>
                                <p class="text1"><%=rs.getString("com_country")%></p>
                            </div>
                            
                            <div class="pd_comp_state">
                                <p class="text">State :</p>
                                <p class="text1"><%=rs.getString("com_state")%></p>
                            </div>
                            
                            <div class="pd_comp_district">
                                <p class="text">District :</p>
                                <p class="text1"><%=rs.getString("com_district")%></p>
                            </div>
                            
                            <div class="pd_comp_city">
                                <p class="text">City :</p>
                                <p class="text1"><%=rs.getString("com_city")%></p>
                            </div>
                            
                            <div class="pd_comp_pincode">
                                <p class="text">Pincode :</p>
                                <p class="text1"><%=rs.getString("com_pincode")%></p>
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
