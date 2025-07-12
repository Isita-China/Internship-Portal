<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
            
            String emp_mail = null;
            String in_id[]=null;
            in_id= request.getParameterValues("inter");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                emp_mail = (String)session.getAttribute("emp_mail");
                
                stm = con.createStatement();
                String sql="delete from internship where internship_code ='" +in_id[0]+ "'";
                stm.executeUpdate(sql);
                out.print("<script>alert('Your post is Deleted');"+"window.location='list_internship.jsp';"+"</script>");
                
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
