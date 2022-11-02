<%@ page import="java.sql.*" %>
<%
String email1= request.getParameter("email");

String password1= request.getParameter("password");

try
{
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
	String qry="insert into loginform values(?,?)";
	PreparedStatement pstmt=con.prepareStatement(qry);
	pstmt.setString(1,email1);
	pstmt.setString(2,password1);
	int sts=pstmt.executeUpdate();
	out.println(sts+"rows inserted successfully");
}
catch(Exception e)
{
	out.println("please enter valid information");
}
%>
	