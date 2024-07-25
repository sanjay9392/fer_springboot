<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>JSTL sql:query Tag</title>
</head>

<body>
	<sql:setDataSource var="ds" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/jsp_crud" user="root" password="root" />

	<sql:update dataSource="${ds}" var="numberOfRecAffected">
         INSERT INTO Employees (age,first,last) VALUES (20,'Sanjay', 'kumar');
      </sql:update>

	${numberOfRecAffected } record(s) got affected.....!
	<br>
	<sql:query dataSource="${ds}" var="resultSet">
            SELECT * from Employees;
         </sql:query>

	<table border="1" width="100%">
		<tr>
			<th>Emp ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
		</tr>

		<c:forEach var="row" items="${resultSet.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.first}" /></td>
				<td><c:out value="${row.last}" /></td>
				<td><c:out value="${row.age}" /></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>