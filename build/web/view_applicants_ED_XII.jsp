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
            String hold_in_id = null;
            String get_st_id[]=null;
            get_st_id= request.getParameterValues("st_id");
            
            String bd="";
            int yr=0;
            String st="";
            String ps="";
            float mk=00.00f;
            String sc="";
            String edty="";
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                emp_mail = (String)session.getAttribute("emp_mail");
                hold_in_id = (String)session.getAttribute("get_in_id");
                
                stm = con.createStatement();
                String sql = "select * from Student_ED_XII where std_email ='" + get_st_id[0] + "'";
                rs = stm.executeQuery(sql);

                if (rs.next())
                {
                    bd=rs.getString("std_board");
                    yr=rs.getInt("std_passing_year");
                    st=rs.getString("std_stream");
                    ps=rs.getString("std_performance_scale");
                    mk=rs.getFloat("std_marks");
                    sc=rs.getString("std_school");
                    edty=rs.getString("std_education_type");
                }
             
            }            
            catch(SQLException e)
            {
                out.print("Throw e" + e);
            }
        %>         
                
                <div class="right_pane">
                    <div class="view_profile_detail_stu">
                        <p class="text2">Educational Details</p>
                        <p class="text3">12th Class (XII)</p>
                        
                        <div class="ed">
                            <div class="ed_stu_board">
                                <p class="text">Board :</p>
                                <p class="text1"><%=bd%></p>
                            </div>
                            
                            <div class="ed_stu_year">
                                <p class="text">Passing Year :</p>
                                <p class="text1"><%=ps%></p>
                            </div>
                            
                            <div class="ed_stu_stream">
                                <p class="text">Stream :</p>
                                <p class="text1"><%=st%></p>
                            </div>
                            
                            <div class="ed_stu_marks">
                                <p class="text">Marks :</p>
                                <p class="text1"><%=ps%> <%=mk%></p>
                            </div>
                            
                            <div class="ed_stu_school">
                                <p class="text">School :</p>
                                <p class="text1"><%=sc%></p>
                            </div>
                            
                            <div class="ed_stu_education_type">
                                <p class="text">Education type :</p>
                                <p class="text1"><%=edty%></p>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="next">
                        <input class="next_button" type="button" name="next_button" value="Next" onclick="location.href='view_applicants_ED_Diploma.jsp?st_id=<%=rs.getString("std_email")%>'">
                        <input class="back_button" type="submit" name="back_button" value="Back" onclick="location.href='view_applicants_list.jsp?inter=<%=hold_in_id%>'">
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
