<%@ page import="java.sql.*" %>
<%
    int eid = Integer.parseInt(request.getParameter("eid"));
    out.println(eid);

    String ename = request.getParameter("ename");
    out.println(ename);
    try{
        Connection con = null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
        String qry = "insert into emptable values(?,?)";
        PreparedStatement pstmt = con.prepareStatement(qry);
        pstmt.setInt(1,eid);
        pstmt.setString(2,ename);
        int sts = pstmt.executeUpdate();
        out.println(sts+"row inserted successfully");
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>