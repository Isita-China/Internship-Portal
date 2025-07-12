<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%    
            Connection con = null;
            Statement stm = null;
            String emp_mail = null;
            String in_code = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                emp_mail = (String)session.getAttribute("emp_mail");
                in_code = (String)session.getAttribute("in_code");
                
                String profile = request.getParameter("internship_profile");
                String loc = request.getParameter("internship_location");
                String skill = request.getParameter("internship_skill");
                String res = request.getParameter("internship_responsibilities");
                String other_skill = request.getParameter("internship_others_skill");
                String exp = request.getParameter("internship_experience");
                String dur = request.getParameter("internship_duration");
                String stipend = request.getParameter("internship_stipend");
                String desc = request.getParameter("internship_description");
                
                stm = con.createStatement();
                String sql="update Internship set internship_profile='"+profile+"',location='"+loc+"',skills='"+skill+"',responsibilities='"+res+"',other_skills='"+other_skill+"',experience='"+exp+"',duration='"+dur+"',stipend='"+stipend+"',description='"+desc+"' where internship_code ='"+in_code+"'";
                stm.executeUpdate(sql);
                out.print("<script>alert('Internship Post Successfully updated');"+"window.location='list_internship.jsp';"+"</script>");
 
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