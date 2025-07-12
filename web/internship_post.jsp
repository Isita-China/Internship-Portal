<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%    
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            String emp_mail = null;

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                emp_mail = (String)session.getAttribute("emp_mail");
                String id = request.getParameter("internship_id");
                String profile = request.getParameter("internship_profile");
                String loc = request.getParameter("internship_location");
                String skill = request.getParameter("internship_skill");
                String res = request.getParameter("internship_responsibilities");
                String other_skill = request.getParameter("internship_others_skill");
                String post_date = request.getParameter("internship_posting_date");
                String exp = request.getParameter("internship_experience");
                String dur = request.getParameter("internship_duration");
                String stipend = request.getParameter("internship_stipend");
                String desc = request.getParameter("internship_description");
                
                stm = con.createStatement();
                
                String sql1="select com_name from Employer_PD where com_email='"+emp_mail+"'";
                rs=stm.executeQuery(sql1);
                String comp_name=null;
                while(rs.next())
                {
                    comp_name=rs.getString("com_name");
                }
                
                String sql2="insert into Internship(internship_code,Posting_date,internship_profile,com_name,com_email,location,skills,responsibilities,other_skills,experience,duration,stipend,description) values('"+id+"','"+post_date+"','"+profile+"','"+comp_name+"','"+emp_mail+"','"+loc+"','"+skill+"','"+res+"','"+other_skill+"','"+exp+"','"+dur+"','"+stipend+"','"+desc+"')";
                stm.executeUpdate(sql2);
                out.print("<script>alert('Internship Post Successful');"+"window.location='list_internship.jsp';"+"</script>");
              
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