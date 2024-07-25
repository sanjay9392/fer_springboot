<jsp:useBean id="user" class="com.rs.jsp.action.usebean.ex.User" scope="session"/>
<jsp:setProperty name="user" property="*" />

<html>
<body>
	<form action='Review.jsp' method='post'>
		City: <input type="text" name="city"> <br> <input
			type="submit" value="Review">
	</form>
	
	<br>
</body>
</html>
