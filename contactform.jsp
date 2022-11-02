<%@ page import="java.sql.*" %>
	<%
	
	String name=request.getParameter("xt");
      String mail=request.getParameter("yi");
	String subject=request.getParameter("so");
      String msg=request.getParameter("sz");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		String qry="insert into contactform values(?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(qry);
		pstmt.setString(1,name);
		pstmt.setString(2,mail);
		pstmt.setString(3,subject);
		pstmt.setString(4,msg);
		int sts=pstmt.executeUpdate();
		response.sendRedirect("projecthome.html");

	}
	catch(Exception e)
	{
            out.print(e);
	}
	%>