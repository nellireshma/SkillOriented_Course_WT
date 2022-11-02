<%@ page import="java.sql.*" %>
	<%
	
	String email=request.getParameter("email1");
      String pw1=request.getParameter("pw");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		String qry="insert into loginform values(?,?)";
		PreparedStatement pstmt=con.prepareStatement(qry);
		pstmt.setString(1,email);
		pstmt.setString(2,pw1);
		int sts=pstmt.executeUpdate();
		response.sendRedirect("projecthome.html");
	}
	catch(Exception e)
	{
            out.print(e);
	}
	%>