<%@ page import="java.sql.*" %>
	<%
	
	String name=request.getParameter("pc");
      String mail=request.getParameter("pi");
	String phno=request.getParameter("p1");
	String year=request.getParameter("yr");
	String brand=request.getParameter("br");
	String model=request.getParameter("mo");
	String mileage=request.getParameter("mi");
	String exterior=request.getParameter("ext");
	String interior=request.getParameter("int");
	String beenacc=request.getParameter("bee");
	
      
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		String qry="insert into carloginform values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(qry);
		pstmt.setString(1,name);
		pstmt.setString(2,mail);
		pstmt.setString(3,phno);
		pstmt.setString(4,year);
		pstmt.setString(5,brand);
		pstmt.setString(6,model);
		pstmt.setString(7,mileage);
		pstmt.setString(8,exterior);
		pstmt.setString(9,interior);
		pstmt.setString(10,beenacc);
		int sts=pstmt.executeUpdate();
		response.sendRedirect("projecthome.html");

	}
	catch(Exception e)
	{
            out.print(e);
	}
	%>