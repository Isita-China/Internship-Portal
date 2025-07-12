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
                
                String nm = request.getParameter("new_mail");
                stm = con.createStatement();
                
                String sql1="update Student set std_email='"+nm+"' where std_email='"+stu_mail+"'";
                stm.executeUpdate(sql1);
                
                session.setAttribute("stu_mail",nm);
                
                out.print("<script>alert('Your Email has been updated successfully');"+"window.location='home.jsp';"+"</script>");
     
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