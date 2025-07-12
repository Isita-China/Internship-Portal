<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs= null;
            
            String stu_mail = null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");
                stu_mail=(String)session.getAttribute("stu_mail");
                
                stm = con.createStatement();
                
                String sql1="select Resume_path from student_resume where std_email ='"+stu_mail+"'";
                rs=stm.executeQuery(sql1);
                String path="";
                while(rs.next())
                {
                    path=rs.getString("Resume_path");
                }
                
                File myObj = new File(path);
                myObj.delete();
                    
                String sql="delete from student_resume where std_email='"+stu_mail+"'";
                stm.executeUpdate(sql);
                out.print("<script>alert('It is Deleted');"+"window.location='upload_resume.jsp';"+"</script>");
                
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
