<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@page import="java.sql.*"%>
<html>
    <body>
        <%
            Connection con = null;
            Statement stm = null;
            ResultSet rs = null;
            String stu_mail = null;
            String complete_string = null;
            String fileName = null;
            String mod_fileName = null;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Internship_Portal?useSSL=false", "root", "root");

                stu_mail = (String) session.getAttribute("stu_mail");
                
                String[] word=stu_mail.split("@");
                
                String contentType = request.getContentType();
                if ((contentType.indexOf("multipart/form-data") >= 0))
                {
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    
                    String filePath = "D:/NetBeans/Internship_Portal/web/resume/";
               
                    List fileItems = upload.parseRequest(request);
                    Iterator iterator = fileItems.iterator();
                    
                    while (iterator.hasNext())
                    {
                        FileItem fileItem = (FileItem) iterator.next(); 
                        fileName = fileItem.getName();  
                        mod_fileName=word[0]+'@'+fileName;
                        complete_string = filePath+mod_fileName;
                        fileItem.write(new File(complete_string));                      
                    }    
                }
                
                stm = con.createStatement();
                String sql1="select std_email,Resume_path from student_resume where std_email ='"+stu_mail+"'";
                rs=stm.executeQuery(sql1);
                
                String em="";
                String path="";
                while(rs.next())
                {
                    em=rs.getString("std_email");
                    path=rs.getString("Resume_path");
                }
                
                if(stu_mail.equals(em))
                {
                    File myObj = new File(path);
                    myObj.delete();
                    
                    String sql="update student_resume set Resume_name='"+fileName+"',Resume_path='"+complete_string+"',Modified_Resume_name='"+mod_fileName+"'where std_email ='"+stu_mail+"'";
                    stm.executeUpdate(sql);

                    out.print("<script>alert('File successfully updateded');"+"window.location='upload_resume.jsp';"+"</script>");
                }

                else
                {
                    String sql="insert into student_resume(std_email,Resume_name,Resume_path,Modified_Resume_name) values('"+stu_mail+"','"+fileName+"','"+complete_string+"','"+mod_fileName+"')";
                    stm.executeUpdate(sql);

                    out.print("<script>alert('File successfully uploaded');"+"window.location='upload_resume.jsp';"+"</script>");
                }
            }
            catch (SQLException e)
            {
                out.print("Throw e" + e);
            }
            finally
            {           
                if (stm != null)
                {
                    try
                    {
                        stm.close();
                    }
                    catch (SQLException e)
                    {
                    }
                }
                if (con != null)
                {
                    con.close();
                }
            }
        %>
    </body>
</html>
