<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%


String userid = "system";
String password = "system";
String name=request.getParameter("nam");
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body
				{
					background-image:url("car_search.jpg");
					background-size:100%;
					background-attachment:fixed;
					background-repeat:no-repeat;
				}
        .he{
			color:white;
			background-color:#db4da7;
			height:40px;
		   }
		.ta {
		padding:10px;
		
		height:100px;
		width:400px;
		margin:10px;
		color:white;
		}
        </style>
    </head>

<body>
<center>

<h1 class="he" >Search Data</h1>
<div class="ta">
<table  cellspacing="5px" cellpadding="5px" bgcolor="#f25c96" border="1">
<tr>
<td>Name</td>
<td>Email </td>
<td>Password</td>
</tr>
</div>
<%
try{
connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
statement=connection.createStatement();
String sql ="select first_name,email,password from register where FIRST_NAME='"+name+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=resultSet.getString(3) %></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</center>
</body>
</html>