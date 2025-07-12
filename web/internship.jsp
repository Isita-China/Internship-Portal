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
                String add = request.getParameter("add_button");
                if(add==null)
                    add="abc";
                
                stu_mail=(String)session.getAttribute("stu_mail");
                String prof = request.getParameter("profile");
                String org = request.getParameter("organization");
                String loc = request.getParameter("location");
                String s_date = request.getParameter("start_date");
                String e_date = request.getParameter("end_date");
                
                stm = con.createStatement();
                
                String sql="insert into Student_ID(std_email,std_profile,std_organization,std_location,std_start_date,std_end_date) values('"+stu_mail+"','"+prof+"','"+org+"','"+loc+"','"+s_date+"','"+e_date+"')";
                stm.executeUpdate(sql);
                
                if(add.equals("Add Internship"))
                {    
                    out.print("<script>alert('Data successfully stored');"+"window.location='edit_profile-ID.jsp';"+"</script>");
                }
                else
                {
                    out.print("<script>alert('Data successfully stored');"+"window.location='view_profile-ID.jsp';"+"</script>");
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