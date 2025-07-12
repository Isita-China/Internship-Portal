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
                String passw = request.getParameter("password");
                stm = con.createStatement();
                String sql="select * from Student where std_email='"+mail+"' and std_psw='"+passw+"'";
                rs=stm.executeQuery(sql);
                String email=null;
                String psw=null;
                while(rs.next())
                {
                    email=rs.getString("std_email");
                    psw=rs.getString("std_psw");
                }
                if(mail.equals(email) && passw.equals(psw))
                {
                    session.setAttribute("stu_mail",mail);
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    out.print("<script>alert('Invalid User id and password');"+"window.location='login.html';"+"</script>");
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
