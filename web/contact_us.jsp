<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
           
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                String nm = request.getParameter("name");
                String mail = request.getParameter("email");
                String sub = request.getParameter("subject");
                String msg = request.getParameter("message");
                stm = con.createStatement();
                String sql="insert into Contact(cont_name,cont_email,cont_subject,cont_message) values('"+nm+"','"+mail+"','"+sub+"','"+msg+"')";
                stm.executeUpdate(sql);
                out.println("Message sent successfully");
                
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
