<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.,java.lang."%>
<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    String mail = request.getParameter("email1");
    String password = request.getParameter("pw");
    out.write("<p>"+mail+" "+password+"</p>");
    try{
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
        statement = con.createStatement();
		String sql = "SELECT email,password FROM register where password='"+password+"'";
        resultSet = statement.executeQuery(sql);
        String db_mail = "";
        String db_pwd = "";
        
        while(resultSet.next()){
            db_mail = resultSet.getString("EMAIL");
            db_pwd = resultSet.getString("PASSWORD");
        }
        out.write("<p>"+db_mail+" "+db_pwd+" "+"</p>");
        if(mail.equals(db_mail) && password.equals(db_pwd)){
            out.write("<p> Hello</p>");
            session.setAttribute("Email",db_mail);
            response.sendRedirect("http://localhost:8081/MyProject/my_admin2.html");
        }
        else if(mail=="" && password==""){
            session.setAttribute("Email",mail);
            response.sendRedirect("http://localhost:8081/MyProject/my_admin3.html");
        }
        else if(mail!=db_mail && password != db_pwd){
            session.setAttribute("Email",mail);
            response.sendRedirect("http://localhost:8081/MyProject/my_admin3.html");
        }
        else if(mail!=db_mail || password != db_pwd){
            session.setAttribute("Email",mail);
            response.sendRedirect("http://localhost:8081/MyProject/my_admin3.html");
        }

        
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
<html>
    <script>
        setTimeout(function(){
            window.location.href = 'http://localhost:8081/MyProject/projecthome.html';
        },5000);
    </script>
</html>