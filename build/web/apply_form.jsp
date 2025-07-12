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
            String get_in_code=null;
            get_in_code= request.getParameter("in_code");
            
            String nm=null;
            String em=null;
            String mb=null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                session.setAttribute("hold_in_code",get_in_code);
                stu_mail=(String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                String sql="select std_name,std_email,std_mob_no from Student where std_email='"+stu_mail+"'";
                rs=stm.executeQuery(sql);
              
                while(rs.next())
                {
                    nm=rs.getString("std_name");
                    em=rs.getString("std_email");
                    mb=rs.getString("std_mob_no");    
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
        
        <%   
                String sql1= "select internship_code from applicant where std_email='"+stu_mail+"' and internship_code = '"+get_in_code+"'";
                rs=stm.executeQuery(sql1);
                if(rs.next())
                {
                    if(rs.getString("internship_code").equals(get_in_code))
                    {
        %>        
                
                <div class="right_pane"><p class="mssg">&#9745; You are already applied</p></div>
                
        <%              
                    }
                }
                else
                {
                    String sql2="select com_name,internship_profile,Location,experience from internship where internship_code='"+get_in_code+"'";
                    rs=stm.executeQuery(sql2);
                    
                    String comp_name=null;
                    String loc=null;
                    String inter_prf=null;
                    String expr=null;
                    
                    while(rs.next())
                    {
                        comp_name=rs.getString("com_name");
                        loc=rs.getString("location");
                        inter_prf=rs.getString("internship_profile");
                        expr=rs.getString("experience");
                    }
        %>
                
                <div class="right_pane">
                    <div class="apply_form">
                        <p class="text1">Internship Details</p>
                        
                        <p class="text2">Company Name :</p>
                        <p class="text"><%=comp_name%></p>
                        <p class="text2">Internship Profile :</p>
                        <p class="text"><%=inter_prf%></p>
                        <p class="text2">Location :</p>
                        <p class="text"><%=loc%></p>
                        <p class="text2">Experience :</p>
                        <p class="text"><%=expr%></p>
                        <p class="text2"><a href="view_internship.jsp?in_code=<%=get_in_code%>">See Details</a></p>
                    </div>
                    
                    <form class="apply_form" name="apply_form" onsubmit="return apply_validation()" method="POST" action="apply.jsp">
                        <p class="text1">Apply form</p>
                        
                        <div class="apply_form_name">
                            <p class="text">Name :</p>
                            <input class="name" type="text" name="name" value="<%=nm%>" readonly>
                        </div>
                        
                        <div class="apply_form_email">
                            <p class="text">Email :</p>
                            <input class="email" type="text" name="email" value="<%=em%>">
                        </div>
                        
                        <div class="apply_form_mob">
                            <p class="text">Mobile Number :</p>
                            <input class="mob" type="text" name="mob" value="<%=mb%>">
                        </div>
                     
                        <div class="apply">
                            <input class="apply_button" type="submit" name="apply_button" value="Apply" onclick="return confirm('Are you sure you want to apply this internship?');">
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
