<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
     
        <%
            Connection con = null;
            Statement stm = null;
            
            String sid = request.getParameter("st_id");
            String icode = request.getParameter("icode");
            String stu_mail = null;
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                stu_mail = (String)session.getAttribute("stu_mail");
                stm = con.createStatement();
                String sql = "update applicant set status='selected' where std_user_email_id='"+sid+"' and internship_code='"+icode+"'";
                stm.executeUpdate(sql);
                response.sendRedirect("selected_applicants_emp.jsp");
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
