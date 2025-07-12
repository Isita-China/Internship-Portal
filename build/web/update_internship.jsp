<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%    
            Connection con = null;
            Statement stm = null;
            String stu_mail = null;
            String in_code = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                
                stu_mail=(String)session.getAttribute("stu_mail");
                in_code = (String)session.getAttribute("in_code");
                
                String prof = request.getParameter("profile");
                String org = request.getParameter("organization");
                String loc = request.getParameter("location");
                String s_date = request.getParameter("start_date");
                String e_date = request.getParameter("end_date");
                
                stm = con.createStatement();
                
                String sql="update Student_ID set std_profile='"+prof+"',std_organization='"+org+"',std_location='"+loc+"',std_start_date='"+s_date+"',std_end_date='"+e_date+"' where sl_no ='"+in_code+"'";
                stm.executeUpdate(sql);
                out.print("<script>alert('Data Successfully updated');"+"window.location='view_profile-ID.jsp';"+"</script>");
 
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