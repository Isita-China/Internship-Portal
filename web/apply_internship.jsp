<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
            
            String nm=null;
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                stu_mail = (String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                
                String sql1="select std_name from Student where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql1);
                
                if(rs.next())
                {
                    nm=rs.getString("std_name"); 
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
                    <div class="list_internship_detail">
                        <table class="list_internship_table" border="1" cellspacing="0" cellpadding="0">
                            <tr>
                                <th>Date</th>
                                <th>Company Name</th>
                                <th>Internship Profile</th>
                                <th>Location</th>
                                <th>Experience</th>
                                <th>View</th>
                                <th>Apply</th>
                            </tr>
                                               
        <%
                
                String sql = "select * from internship ";
                rs = stm.executeQuery(sql);
          
                while(rs.next())
                {                         
                        
        %>               
                            <tr>
                                <td><%=rs.getString("Posting_date")%></td>
                                <td><%=rs.getString("com_name")%></td>
                                <td><%=rs.getString("internship_profile")%></td>
                                <td><%=rs.getString("location")%></td>
                                <td><%=rs.getString("experience")%></td>
                                <td><a href="view_internship.jsp?in_code=<%=rs.getString("internship_code")%>">View</a></td>
                                <td><a href="apply_form.jsp?in_code=<%=rs.getString("internship_code")%>">Apply</a></td>
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
