<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
    </head>
    <body>
        <%
            session.invalidate();
           /* out.print("<script>alert('You have been logged out successfully');"+"window.location='index.html';"+"</script>");*/
            response.sendRedirect("index.html");
        %>
    </body>
</html>
