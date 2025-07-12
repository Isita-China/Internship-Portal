<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%    
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            String stu_mail = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                stu_mail=(String)session.getAttribute("stu_mail");
                
                String name = request.getParameter("name");
                String mob = request.getParameter("mob_no");
                String dob = request.getParameter("dob");
                String gender = request.getParameter("gender");
                String add = request.getParameter("address");
                String state = request.getParameter("state");
                String dist = request.getParameter("district");
                String city = request.getParameter("city");
                String pinc = request.getParameter("pincode");
                
                stm = con.createStatement();
                
                String sql2 = "select std_dob from Student_PD where std_email='" + stu_mail + "'";
                rs = stm.executeQuery(sql2);
                while (rs.next())
                {
                    if(rs.getString("std_dob").equals(""))
                    {
                        String sql="update Student_PD set std_name='"+name+"',std_mob_no='"+mob+"',std_dob='"+dob+"',std_gender='"+gender+"',std_address='"+add+"',std_state='"+state+"',std_district='"+dist+"',std_city='"+city+"',std_pincode='"+pinc+"' where std_email ='"+stu_mail+"'";
                        stm.executeUpdate(sql);
                        String sql1="update Student set std_name='"+name+"',std_mob_no='"+mob+"' where std_email ='"+stu_mail+"'";
                        stm.executeUpdate(sql1);
                        out.print("<script>alert('Data successfully stored');"+"window.location='edit_profile-ED(X).jsp';"+"</script>");
                    }
                    else
                    {
                        String sql="update Student_PD set std_name='"+name+"',std_mob_no='"+mob+"',std_dob='"+dob+"',std_gender='"+gender+"',std_address='"+add+"',std_state='"+state+"',std_district='"+dist+"',std_city='"+city+"',std_pincode='"+pinc+"' where std_email ='"+stu_mail+"'";
                        stm.executeUpdate(sql);
                        String sql1="update Student set std_name='"+name+"',std_mob_no='"+mob+"' where std_email ='"+stu_mail+"'";
                        stm.executeUpdate(sql1);
                        out.print("<script>alert('Data successfully updated');"+"window.location='edit_profile-ED(X).jsp';"+"</script>");
                    }
                }
            
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