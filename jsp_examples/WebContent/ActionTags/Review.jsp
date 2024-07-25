<jsp:useBean id="user" class="com.rs.jsp.action.usebean.ex.User" scope="session"/>
<jsp:setProperty name="user" property="city" />

<html>

<body>
	<form action='Review.jsp' method='post'>
	
		<b> Review Profile Update</b><br>
		
		<u><b>Name Info</b></u><br>
		Full Name:<jsp:getProperty name="user" property="fullname" /><br>
		Salary:<jsp:getProperty name="user" property="salary" /><br>
		Gender:<jsp:getProperty name="user" property="gender" /><br>
		
		<u><b>Contact Info </b></u><br>
		Mobile:<jsp:getProperty name="user" property="mobile" /><br>
		Email:<jsp:getProperty name="user" property="email" /><br>
		
		<u><b>Address Info </b></u><br>
		City:<jsp:getProperty name="user" property="city" />
		<br> 
		
	</form>
</body>
</html>
<jsp:include page="ThankYou.jsp"/> 
<%-- <jsp:forward page="ThankYou.jsp"/> --%>
