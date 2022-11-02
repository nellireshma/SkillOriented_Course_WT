<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
 
String sql="select * from register";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
<body bgcolor="pink">
<center>

<h1>Welcome to  Registered User Details</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="7" align="center">Registered User Details</th></tr>

<tr>
<td>Fname</td>
<td>Mname</td>
<td>Lname</td>
<td>Email</td>
<td>Password</td>
<td>Confpw</td>
<td>Mobno</td>

</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>

</tr>
<%
}
%>
</table>
<br>
<br>
<% }
catch(Exception e)
{
 out.println(e.toString());
}
%>


<html>
<style>
button:hover{
		opacity:0.8;}
	.button {
		background-color: orange;
		border: none;
		padding: 9px 40px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		margin: 4px 2px;
		cursor: pointer;
		}
	.button{font-size: 20px;}


</style>
<body>

<a href="my_admin2.html"><button class="button">Back </button></a>
</body>

</html>