<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false","root","root");
                String mail = request.getParameter("email");
                String get_cin = request.getParameter("cin");
                stm = con.createStatement();
                String sql="select com_email,com_CIN from Employer_PD where com_email='"+mail+"' and com_CIN='"+get_cin+"'";
                rs=stm.executeQuery(sql);
                String email=null;
                String cin=null;
                while(rs.next())
                {
                    email=rs.getString("com_email");
                    cin=rs.getString("com_CIN");
                }
                if(mail.equals(email) && get_cin.equals(cin))
                {
                    session.setAttribute("emp_mail",mail);
                    response.sendRedirect("change_your_psw_emp.html");
                }
                else
                {
                    out.print("<script>alert('Invalid email id and CIN');"+"window.location='forgot_your_psw_emp.html';"+"</script>");
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
