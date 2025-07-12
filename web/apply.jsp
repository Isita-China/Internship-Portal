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
            String i_code = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                stu_mail=(String)session.getAttribute("stu_mail");
                i_code = (String)session.getAttribute("hold_in_code");
                String nm = request.getParameter("name");
                String mail = request.getParameter("email");
                String mob = request.getParameter("mob");
            
                stm = con.createStatement();
                
                String sql1="select com_mob_no from employer_pd where com_email in (select com_email from internship where internship_code='"+i_code+"')";
                rs=stm.executeQuery(sql1);
                String comp_mob=null;
                while(rs.next())
                {
                    comp_mob=rs.getString("com_mob_no");
                }
                
                String sql2="select * from internship where internship_code='"+i_code+"'";
                rs=stm.executeQuery(sql2);
                String comp_name=null;
                String comp_mail=null;
                String inter_prf=null;
                String pos_dt=null;
                while(rs.next())
                {
                    comp_name=rs.getString("com_name");
                    comp_mail=rs.getString("com_email");
                    inter_prf=rs.getString("internship_profile");
                    pos_dt=rs.getString("Posting_date");
                }
                
                String sql3="select * from student_resume where std_email ='"+stu_mail+"'";
                rs=stm.executeQuery(sql3);
                
                int no=0;
                String rnm="";
                String mod="";
                String path="";
                String em="";
                while(rs.next())
                {
                    em=rs.getString("std_email");
                    no=rs.getInt("sl_no");
                    rnm=rs.getString("Resume_name");
                    mod=rs.getString("Modified_Resume_name");
                    path=rs.getString("Resume_path");
                }
                
                if(stu_mail.equals(em))
                {
                    String sql="insert into applicant(std_user_email_id,std_name,std_email,std_mob_no,internship_code,Posting_date,internship_profile,com_email,com_name,com_mob_no,status,resume_id,Resume_name,Modified_Resume_name,Resume_path) values('"+stu_mail+"','"+nm+"','"+mail+"','"+mob+"','"+i_code+"','"+pos_dt+"','"+inter_prf+"','"+comp_mail+"','"+comp_name+"','"+comp_mob+"','pending','"+no+"','"+rnm+"','"+mod+"','"+path+"')";
                    stm.executeUpdate(sql);
                    out.print("<script>alert('Applied Successfully');"+"window.location='applied_internship.jsp';"+"</script>");
                }
                else
                {
                    out.print("<script>alert('Upload your Resume');"+"window.location='upload_resume.jsp';"+"</script>");
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