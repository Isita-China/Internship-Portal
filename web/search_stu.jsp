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
                        <a href="index_(login).html">Intern House</a>
                    </div>
                </div>

                <div class="header_center">

                </div>

                <div class="header_right">
                    <div class="box">
                        <div class="home_list">
                            <ul class="list_home">
                                <li class="home">		
                                    <a href="home.jsp">Home</a>
                                    <ul>
                                        <li><a href="edit_profile-PD.jsp">Edit Profile</a></li>
                                        <li><a href="apply_internship.jsp">Apply</a></li>
                                        <li><a href="applied_internship.jsp">Applied</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                        <div class="logout">
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="display">
                <div class="search_list">
                
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                String se = request.getParameter("search");
                stm = con.createStatement();
                String sql="select * from internship where internship_profile like '%"+se+"%'";
                rs=stm.executeQuery(sql);
                while(rs.next())
                {
        %>
        
                    <table border="0" cellspacing="10" cellpadding="0">
                    <tr><td colspan="2" class="text"><%=rs.getString("internship_profile")%></td></tr>
                    <tr><td class="text1">Company Name :</td><td class="text1"><%=rs.getString("com_name")%></td></tr>
                    <tr><td class="text1">Location :</td><td class="text1"><%=rs.getString("location")%></td></tr>
                    <tr><td class="text1">Skills :</td><td class="text1"><%=rs.getString("skills")%></td></tr>
                    <tr><td class="text1">Experience :</td><td class="text1"><%=rs.getString("experience")%></td></tr>
                    <tr><td class="text1">Duration :</td><td class="text1"><%=rs.getString("duration")%></td></tr>
                    <tr><td class="text1">Stipend :</td><td class="text1"><%=rs.getString("stipend")%></td></tr>
                    <tr><td><a class="click" href="view_internship.jsp?in_code=<%=rs.getString("internship_code")%>">View</a></td><td><a class="click" href="apply_form.jsp?in_code=<%=rs.getString("internship_code")%>">Apply</a></td></tr>
                    </table>
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
            </div>

            <div class="footer">

                <div class="footer_left">
                    <div class="footer_about_list">
                        <ul class="about_list">
                            <li class="top">Intern House</li>
                            <li><a href="about_us_(login).html">About us</a></li>
                            <li><a href="terms&condition.html">Terms & Conditions</a></li>
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
