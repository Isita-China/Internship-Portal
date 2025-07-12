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
                
                String status = request.getParameter("diploma_status");
                String stream = request.getParameter("stream");
                String clg = request.getParameter("college");
                int s_year =Integer.parseInt(request.getParameter("start_year"));
                int e_year =Integer.parseInt(request.getParameter("end_year"));
                String p_scale = request.getParameter("marks_scale");
                float mark = Float.parseFloat(request.getParameter("marks"));
                String edu_type = request.getParameter("education_type");
                
                stm = con.createStatement();
                
                String sql2 = "select std_stream from Student_ED_Diploma where std_email='" + stu_mail + "'";
                rs = stm.executeQuery(sql2);
                String temp_string="";
                if (rs.next())
                {
                   temp_string=rs.getString("std_stream"); 
                }
                
                if(temp_string.equals(""))
                {
                    String sql="insert into Student_ED_Diploma(std_email,std_diploma_status,std_stream,std_college,std_start_year,std_end_year,std_performance_scale,std_marks,std_education_type) values('"+stu_mail+"','"+status+"','"+stream+"','"+clg+"','"+s_year+"','"+e_year+"','"+p_scale+"','"+mark+"','"+edu_type+"')";
                    stm.executeUpdate(sql);
                    out.print("<script>alert('Data successfully stored');"+"window.location='edit_profile-ED(GD).jsp';"+"</script>");
                }
                else
                {
                    String sql="update Student_ED_Diploma set std_diploma_status='"+status+"',std_stream='"+stream+"',std_college='"+clg+"',std_start_year='"+s_year+"',std_end_year='"+e_year+"',std_performance_scale='"+p_scale+"',std_marks='"+mark+"',std_education_type='"+edu_type+"' where std_email ='"+stu_mail+"'";
                    stm.executeUpdate(sql);
                    out.print("<script>alert('Data successfully updated');"+"window.location='edit_profile-ED(GD).jsp';"+"</script>");
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