<%@ page import="java.sql.*" %>
	<%
	
	
	String fname=request.getParameter("form7");
	String mname=request.getParameter("form1");
      String lname=request.getParameter("form2");
	String email=request.getParameter("form3");
      String pw1=request.getParameter("form4");
      String confpw=request.getParameter("form5");
	String mobno=request.getParameter("form6");

	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		String qry="insert into register values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(qry);
		pstmt.setString(1,fname);
		pstmt.setString(2,mname);
		pstmt.setString(3,lname);
		pstmt.setString(4,email);
		pstmt.setString(5,pw1);
		pstmt.setString(6,confpw);
		pstmt.setString(7,mobno);

		int sts=pstmt.executeUpdate();
		response.sendRedirect("projecthome.html");
	}
	catch(Exception e)
	{
            out.print("please enter valid details");
	}
	%>