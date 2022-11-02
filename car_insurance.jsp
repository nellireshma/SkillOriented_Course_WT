<%@ page import="java.sql.*" %>
	<%
	
	String regnum=request.getParameter("xi");
      String mail=request.getParameter("li");
	String mobno=request.getParameter("tu");
      
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		String qry="insert into carinsurance values(?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(qry);
		pstmt.setString(1,regnum);
		pstmt.setString(2,mail);
		pstmt.setString(3,mobno);
		int sts=pstmt.executeUpdate();
		response.sendRedirect("projecthome.html");

	}
	catch(Exception e)
	{
            out.print(e);
	}
	%>