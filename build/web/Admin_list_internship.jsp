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
                        <a href="index.html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">
                    <ul>
                        <li><a href="Admin_list_student.jsp">List of Students</a></li>
                        <li><a href="Admin_list_employer.jsp">List of Employers</a></li>
                        <li><a href="Admin_list_internship.jsp">List of Internships</a></li>
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

            <div class="display">
                <div class="report">
                    <p class="text">List of Internships</p>
                    <table class="report_table" border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <th>Posting Date</th>
                            <th>Internship Code</th>
                            <th>Internship Profile</th>
                            <th>Company Name</th>
                            <th>Company Email</th>
                            <th>Location</th>
                        </tr>
                        <%
                            Connection con = null;
                            Statement stm = null;
                            ResultSet rs = null;
                            String admin_id = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                                admin_id = (String) session.getAttribute("admin_id");
                                stm = con.createStatement();
                                String sql = "select * from internship";
                                rs = stm.executeQuery(sql);

                                while (rs.next()) {
                        %>

                        <tr>
                            <td><%=rs.getString("Posting_date")%></td>
                            <td><%=rs.getString("internship_code")%></td>
                            <td><%=rs.getString("internship_profile")%></td>
                            <td><%=rs.getString("com_name")%></td>
                            <td><%=rs.getString("com_email")%></td>
                            <td><%=rs.getString("location")%></td>
                        </tr>

                        <%
                                }

                                rs.close();
                                stm.close();
                                con.close();
                            } catch (SQLException e) {
                                out.print("Throw e" + e);
                            }
                        %>

                    </table>
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