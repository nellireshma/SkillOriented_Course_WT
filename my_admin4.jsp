<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

String name12="Reshma";
String password12="Reshma31";
int count=0;
if (name12.equals(request.getParameter("f1")))
{
if (password12.equals(request.getParameter("p1")))
{
    count=1;
}
}
if (count==0)
{
response.sendRedirect("my_admin3.html");
}
if(count==1)
{
response.sendRedirect("my_admin2.html");
}

}
catch(Exception e)
{
 out.println(e.toString());
}
%>

