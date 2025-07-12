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
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                emp_mail = (String)session.getAttribute("emp_mail");
                stm = con.createStatement();

                String sql = "select * from Employer_PD where com_email='" + emp_mail + "'";
                rs = stm.executeQuery(sql);
              
                while (rs.next())
                {
        %>

                <div class="right_pane">
                    <form class="profile_detail_form" name="profile_detail_form" onsubmit="return profile_detail_validation()" method="POST" action="profile_detail_emp.jsp">

                        <div class="profile_detail">
                            <p class="text1">Company Details</p>

                            <div class="pd_left">
                                <div class="pd_form_compname">
                                    <p class="text">Company Name :</p>
                                    <input class="comp_name" type="text" name="comp_name" value="<%=rs.getString("com_name")%>">
                                </div>

                                <div class="pd_form_compemail">
                                    <p class="text">Official Email Id :</p>
                                    <input class="comp_email" type="text" name="comp_email" value="<%=rs.getString("com_email")%>">
                                </div>

                                <div class="pd_form_compmob">
                                    <p class="text">Mobile Number :</p>
                                    <input class="comp_mob_no" type="text" name="comp_mob_no" value="<%=rs.getString("com_mob_no")%>">
                                </div>

                                <div class="pd_form_CIN">
                                    <p class="text">CIN :</p>
                                    <input class="comp_cin" type="text" name="comp_cin" value="<%=rs.getString("com_CIN")%>">
                                </div>

                                <div class="pd_form_compRegNO">
                                    <p class="text">Registration Number :</p>
                                    <input class="comp_reg_no" type="text" name="comp_reg_no" value="<%=rs.getString("com_registration_no")%>">
                                </div>

                                <div class="pd_form_compindustry">
                                    <p class="text">Industry type :</p>
                                    <input class="comp_industry_type" type="text" name="comp_industry_type" value="<%=rs.getString("com_industry_type")%>">
                                </div>

                                <div class="pd_form_compDOI">
                                    <p class="text">Date of Incorporation :</p>
                                    <input class="comp_doi" type="date" name="comp_doi" value="<%=rs.getString("com_DOI")%>">
                                </div>
                            </div>

                            <div class="pd_right">
                                <div class="pd_form_compaddress">
                                    <p class="text">Office Address :</p>
                                    <textarea class="comp_address" type="text" name="comp_address"><%=rs.getString("com_address")%></textarea>
                                </div>

                                <div class="pd_form_comp_country">
                                    <p class="text">Country :</p>
                                    <input class="comp_country" type="text" name="comp_country" value="<%=rs.getString("com_country")%>">
                                </div>

                                <div class="pd_form_comp_state">
                                    <p class="text">State :</p>
                                    <input class="comp_state" type="text" name="comp_state" value="<%=rs.getString("com_state")%>">
                                </div>

                                <div class="pd_form_comp_district">
                                    <p class="text">District :</p>
                                    <input class="comp_district" type="text" name="comp_district" value="<%=rs.getString("com_district")%>">
                                </div>

                                <div class="pd_form_comp_city">
                                    <p class="text">City :</p>
                                    <input class="comp_city" type="text" name="comp_city" value="<%=rs.getString("com_city")%>">
                                </div>

                                <div class="pd_form_comp_pincode">
                                    <p class="text">Pincode :</p>
                                    <input class="comp_pincode" type="text" name="comp_pincode" value="<%=rs.getString("com_pincode")%>">
                                </div>
                            </div>

                        </div>

                        <div class="save">
                            <input class="save_button" type="submit" name="save_button" value="Save">
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
