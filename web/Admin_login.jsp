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
                String u_id = request.getParameter("user_id");
                String passw = request.getParameter("password");
                stm = con.createStatement();
                String sql="select * from Admin where user_id='"+u_id+"' and password='"+passw+"'";
                rs=stm.executeQuery(sql);
                String uid=null;
                String psw=null;
                while(rs.next())
                {
                    uid=rs.getString("user_id");
                    psw=rs.getString("password");
                }
                if(u_id.equals(uid) && passw.equals(psw))
                {
                    session.setAttribute("admin_id",u_id);
                    response.sendRedirect("Admin_list_internship.jsp");
                }
                else
                {
                    out.print("<script>alert('Invalid User id and password');"+"window.location='Admin_login.html';"+"</script>");
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
