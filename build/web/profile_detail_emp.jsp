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
                
                String name = request.getParameter("comp_name");
                String mail = request.getParameter("comp_email");
                String mob = request.getParameter("comp_mob_no");
                String CIN = request.getParameter("comp_cin");
                String regno = request.getParameter("comp_reg_no");
                String industry = request.getParameter("comp_industry_type");
                String DOI = request.getParameter("comp_doi");
                String add = request.getParameter("comp_address");
                String country = request.getParameter("comp_country");
                String state = request.getParameter("comp_state");
                String dist = request.getParameter("comp_district");
                String city = request.getParameter("comp_city");
                String pinc = request.getParameter("comp_pincode");
                
                stm = con.createStatement();
                
                String sql2 = "select com_CIN from Employer_PD where com_email='" + emp_mail + "'";
                rs = stm.executeQuery(sql2);
                String get_cin=null;
                while (rs.next())
                {
                    get_cin=rs.getString("com_CIN");
                }
                
                if(get_cin.equals(""))
                {
                    String sql="update Employer_PD set com_name='"+name+"',com_email='"+mail+"',com_mob_no='"+mob+"',com_CIN='"+CIN+"',com_registration_no='"+regno+"',com_industry_type='"+industry+"',com_DOI='"+DOI+"',com_address='"+add+"',com_country='"+country+"',com_state='"+state+"',com_district='"+dist+"',com_city='"+city+"',com_pincode='"+pinc+"' where com_email ='"+emp_mail+"'";
                    stm.executeUpdate(sql);
                
                    String sql1="update Employer set emp_email='"+mail+"',emp_name='"+name+"',emp_mob_no='"+mob+"' where emp_email ='"+emp_mail+"'";
                    stm.executeUpdate(sql1);
                    session.setAttribute("emp_mail",mail);
                
                    out.print("<script>alert('Data successfully stored');"+"window.location='home_emp.jsp';"+"</script>");
                }
                else
                {
                    String sql="update Employer_PD set com_name='"+name+"',com_email='"+mail+"',com_mob_no='"+mob+"',com_CIN='"+CIN+"',com_registration_no='"+regno+"',com_industry_type='"+industry+"',com_DOI='"+DOI+"',com_address='"+add+"',com_country='"+country+"',com_state='"+state+"',com_district='"+dist+"',com_city='"+city+"',com_pincode='"+pinc+"' where com_email ='"+emp_mail+"'";
                    stm.executeUpdate(sql);
                
                    String sql1="update Employer set emp_email='"+mail+"',emp_name='"+name+"',emp_mob_no='"+mob+"' where emp_email ='"+emp_mail+"'";
                    stm.executeUpdate(sql1);
                    session.setAttribute("emp_mail",mail);
                
                    out.print("<script>alert('Data successfully updated');"+"window.location='home_emp.jsp';"+"</script>");
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