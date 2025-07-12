<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
            
            String stu_mail = null;
            String in_no[]=null;
            in_no= request.getParameterValues("in");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                stu_mail=(String)session.getAttribute("stu_mail");
                
                stm = con.createStatement();
                String sql="delete from Student_ID where std_email='"+stu_mail+"' and sl_no='" +in_no[0]+ "'";
                stm.executeUpdate(sql);
                out.print("<script>alert('It is Deleted');"+"window.location='view_profile-ID.jsp';"+"</script>");
                
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
