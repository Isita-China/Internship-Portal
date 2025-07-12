<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                String mail = request.getParameter("email");
                String get_dob = request.getParameter("dob");
                stm = con.createStatement();
                String sql="select std_email,std_dob from Student_PD where std_email='"+mail+"' and std_dob='"+get_dob+"'";
                rs=stm.executeQuery(sql);
                String email=null;
                String dob=null;
                while(rs.next())
                {
                    email=rs.getString("std_email");
                    dob=rs.getString("std_dob");
                }
                if(mail.equals(email) && get_dob.equals(dob))
                {
                    session.setAttribute("stu_mail",mail);
                    response.sendRedirect("change_your_psw_stu.html");
                }
                else
                {
                    out.print("<script>alert('Invalid email id and date of birth');"+"window.location='forgot_your_psw_stu.html';"+"</script>");
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
    </body>
</html>
