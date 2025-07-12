<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%    
            Connection con = null;
            Statement stm = null;
            String stu_mail = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                stu_mail=(String)session.getAttribute("stu_mail");
                String np = request.getParameter("new_password");
                String cp = request.getParameter("confirm_password");
                stm = con.createStatement();
                if(np.equals(cp))
                {
                    String sql="update Student set std_psw='"+cp+"' where std_email='"+stu_mail+"'";
                    stm.executeUpdate(sql);
                    out.print("<script>alert('Your Password has been changed successfully');"+"window.location='login.html';"+"</script>");
                }
                else
                {
                    out.print("<script>alert('Password does not match');"+"window.location='change_your_psw_stu.html';"+"</script>");
                }
              
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