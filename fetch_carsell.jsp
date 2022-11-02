<%@page import="java.sql.*"%>
<%
try{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
 
String sql="select * from carloginform";
PreparedStatement stmt=con.prepareStatement(sql);  
ResultSet rs=stmt.executeQuery();  
%>
<html>
<body bgcolor="pink">
<center>

<h1 style="color:white">Welcome to Car Sell User Details</h1>
<table border="5" bgcolor="white">
<tr>


<th colspan="10" align="center">Sell Car User Details</th></tr>

<tr>
<td>Name</td>
<td>Email</td>
<td>Phno</td>
<td>Year</td>
<td>Brand</td>
<td>Model</td>
<td>Mileage</td>
<td>Exterior</td>
<td>Interior</td>
<td>Beenacc</td>

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
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><%=rs.getString(10)%></td>

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

body
	{
	background-image:url("car_tab.jpg");
	background-size:100%;
	background-attachment:fixed;
	background-repeat:no-repeat;
	}

</style>
<body>

<a href="my_admin2.html"><button class="button">Back </button></a>
</body>

</html>