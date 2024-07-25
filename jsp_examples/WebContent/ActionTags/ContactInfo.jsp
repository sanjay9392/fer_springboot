<jsp:useBean id="user" class="com.rs.jsp.action.usebean.ex.User" scope="session"/>
<jsp:setProperty name="user" property="*" />
<html>
<br>
<body>
	<form action='AddressInfo.jsp' method='post'>
		Mobile: <input type="text" name="mobile"> <br> 
		Email: <input type="text" name="email"> <br> 
		<input type="submit" value="Next"> <br> <br> <br>
	</form>
</body>
</html>
