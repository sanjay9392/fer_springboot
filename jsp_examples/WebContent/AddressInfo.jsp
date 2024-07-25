<html>
<%
 session.setAttribute("mobile", request.getParameter("mobile"));
%>
<body>
	<form action='Review.jsp' method='post'>
		City: <input type="text" name="city"> <br> <input
			type="submit" value="Review">
	</form>
	
	<br>
</body>
</html>
<jsp:include page="ThankYou.jsp"/>