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
                        <a href="index.html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">

                </div>

                <div class="header_right">
                    <div class="log_reg">
                        <ul class="list_log_reg">
                            <li>
                                <a href="login.html">Login</a>
                            </li>	
                            <li class="reg">		
                                <a href="">Register</a>
                                <ul>
                                    <li>
                                        <a href="register_student.html">as a Student</a>
                                    </li>
                                    <li>
                                        <a href="register_employer.html">as a Employer</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            
            <div class="display">
                <div class="success_msg" >
                
        <%    
            Connection con = null;
            Statement stm = null;
           
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                String name = request.getParameter("fullname");
                String mail = request.getParameter("email");
                String passw = request.getParameter("password");
                String mob = request.getParameter("mob_no");
                stm = con.createStatement();
                String sql="insert into Student(std_name,std_email,std_psw,std_mob_no) values('"+name+"','"+mail+"','"+passw+"','"+mob+"')";
                stm.executeUpdate(sql);
                
                String sql1="insert into Student_PD values('"+name+"','"+mail+"','"+mob+"','','','','','','','')";
                stm.executeUpdate(sql1);
                
                out.print("<p class='msg'>Registration Successful</p>");
                out.print("<p class='msg1'>Click here to <a href='login.html'>Login</a></p>");
                
                stm.close();
                con.close();
            }            
            catch(SQLException e)
            {
                out.print("<p class='msg'>Sorry, that email already exists</p>");
                out.print("<p class='msg1'>Go back to <a href='register_student.html'>Register</a> page</p>");
            }
        %>
        
                </div>
            </div>

            <div class="footer">

                <div class="footer_left">
                    <div class="footer_about_list">
                        <ul class="about_list">
                            <li class="top">Intern House</li>
                            <li><a href="about_us.html">About us</a></li>
                            <li><a href="terms&condition.html">Terms & Conditions</a></li>
                            <li><a href="contact_us.html">Contact us</a></li>
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
