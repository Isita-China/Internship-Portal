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

                <div class="right_pane">
                    <div class="list_internship_detail">
                        <table class="list_internship_table" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <th>Date</th>
                                <th>Internship Code</th>
                                <th>Internship Profile</th>
                                <th>No.of Applicants</th>
                                <th>View Applicants</th>
                            </tr>
                            
        <%
            Connection con = null;
            Statement stm = null;
            Statement stm2 = null;
            ResultSet rs = null;
            ResultSet rs1 = null;
            String emp_mail = null;
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                emp_mail = (String)session.getAttribute("emp_mail");
                stm = con.createStatement();
                stm2 = con.createStatement();
                String sql = "select * from internship where com_email ='" + emp_mail + "'";
                rs = stm.executeQuery(sql);

                while (rs.next())
                {
        %>      
                            <tr>
                                <td><%=rs.getString("Posting_date")%></td>
                                <td><%=rs.getString("internship_code")%></td>
                                <td><%=rs.getString("internship_profile")%></td>
                                
                <%
                    String sql1 = "select count(std_user_email_id) as tot from applicant where internship_code='"+rs.getString("internship_code")+"'";
                    rs1 = stm2.executeQuery(sql1);
                    rs1.next();
                %>  
                                
                                <td><%=rs1.getString("tot")%></td>
                                <td><a href="view_applicants_list.jsp?inter=<%=rs.getString("internship_code")%>"><span style='font-size:35px;'>&#128065;</span></a></td>
                            </tr>
                            
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
        
                        </table>
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
