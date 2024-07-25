<html>
<%
 session.setAttribute("city", request.getParameter("city"));
%>
<body>
	<form action="ThankYou.jsp" method='post'>
		<b> Review Profile Update</b>
		<br> 
		Full Name :<%= session.getAttribute("fullname") %><BR>
		Mobile :<%= session.getAttribute("mobile") %><BR>
		City :<%= request.getParameter("city")%>
		<BR> Page Scope :
		<%= pageContext.getAttribute("fullname_p",  PageContext.PAGE_SCOPE) %>
		<br> Request Scope :
		<%= pageContext.getAttribute("fullname_r",  PageContext.REQUEST_SCOPE) %>
		<br> Session Scope :
		<%= pageContext.getAttribute("fullname_s",  PageContext.SESSION_SCOPE) %>
		<br> Application Scope :
		<%= pageContext.getAttribute("fullname_a",  PageContext.APPLICATION_SCOPE) %>
		<br>
	</form>
</body>
</html>
