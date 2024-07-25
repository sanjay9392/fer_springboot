<html>
<%
 session.setAttribute("fullname", request.getParameter("fullname"));

 pageContext.setAttribute("fullname_p",request.getParameter("fullname"),pageContext.PAGE_SCOPE);
 pageContext.setAttribute("fullname_r",request.getParameter("fullname"),pageContext.REQUEST_SCOPE);
 pageContext.setAttribute("fullname_s",request.getParameter("fullname"),pageContext.SESSION_SCOPE);
 pageContext.setAttribute("fullname_a",request.getParameter("fullname"),pageContext.APPLICATION_SCOPE);
%>
<br>
<body>
	<form action='AddressInfo.jsp' method='post'>
		Mobile: <input type="text" name="mobile"> <br> <input
			type="submit" value="Next">
			<br>
			<br>
	Page Scope : <%= pageContext.getAttribute("fullname_p",  PageContext.PAGE_SCOPE) %>
	<br>
	Request Scope : <%= pageContext.getAttribute("fullname_r",  PageContext.REQUEST_SCOPE) %>
	<br>
	Session Scope : <%= pageContext.getAttribute("fullname_s",  PageContext.SESSION_SCOPE) %>
	<br>
	Application Scope : <%= pageContext.getAttribute("fullname_a",  PageContext.APPLICATION_SCOPE) %>
	<br>
	
	<br>
	</form>
</body>
</html>
<jsp:include page="ThankYou.jsp"/>