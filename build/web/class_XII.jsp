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
                
                String board = request.getParameter("board");
                int year =Integer.parseInt(request.getParameter("year"));
                String stream = request.getParameter("stream");
                String p_scale = request.getParameter("marks_scale");
                float mark = Float.parseFloat(request.getParameter("marks"));
                String sch = request.getParameter("school");
                String edu_type = request.getParameter("education_type");
                
                stm = con.createStatement();
                
                String sql2 = "select std_board from Student_ED_XII where std_email='" + stu_mail + "'";
                rs = stm.executeQuery(sql2);
                String temp_string="";
                if (rs.next())
                {
                   temp_string=rs.getString("std_board"); 
                }
                
                if(temp_string.equals(""))
                {
                    String sql="insert into Student_ED_XII(std_email,std_board,std_passing_year,std_stream,std_performance_scale,std_marks,std_school,std_education_type) values('"+stu_mail+"','"+board+"','"+year+"','"+stream+"','"+p_scale+"','"+mark+"','"+sch+"','"+edu_type+"')";
                    stm.executeUpdate(sql);
                    out.print("<script>alert('Data successfully stored');"+"window.location='edit_profile-ED(Diploma).jsp';"+"</script>");
                }
                else
                {
                    String sql="update Student_ED_XII set std_board='"+board+"',std_passing_year='"+year+"',std_stream='"+stream+"',std_performance_scale='"+p_scale+"',std_marks='"+mark+"',std_school='"+sch+"',std_education_type='"+edu_type+"' where std_email ='"+stu_mail+"'";
                    stm.executeUpdate(sql);
                    out.print("<script>alert('Data successfully updated');"+"window.location='edit_profile-ED(Diploma).jsp';"+"</script>");
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