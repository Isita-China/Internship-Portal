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
                String passw = request.getParameter("password");
                stm = con.createStatement();
                String sql="select * from Employer where emp_email='"+mail+"' and emp_psw='"+passw+"'";
                rs=stm.executeQuery(sql);
                String email=null;
                String psw=null;
                while(rs.next())
                {
                    email=rs.getString("emp_email");
                    psw=rs.getString("emp_psw");
                }
                if(mail.equals(email) && passw.equals(psw))
                {
                    session.setAttribute("emp_mail",mail);
                    response.sendRedirect("home_emp.jsp");
                }
                else
                {
                    out.print("<script>alert('Invalid User id and password');"+"window.location='login.html';"+"</script>");
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
