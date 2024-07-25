<%@page import="com.zedapp.eauction.model.User"%>
<div id="admin-content">
<%
System.out.println("sessId = "+request.getSession().getId());
User user = null;
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
System.out.println("User ==="+user);
if(user==null) {
	//System.out.println("redirect to index");
	//response.sendRedirect("index.htm");
	//response.setStatus(response.SC_MOVED_TEMPORARILY);
	//response.setHeader("Location", "index.htm");
	out.println("<script type='text/javascript'>");
	out.println("window.location.href = 'index.htm';");
	out.println("</script>");
	return;
}

int userId=user.getUserId();
System.out.println("User Id==="+user.getUserId());
%>


		<table border="0" cellspacing="0" cellpadding="0">
		<tr><td valign="top" align="left">
		<div id="left-menu" class="cssmenu">
		<ul class="panel">
		<%if(user.getUserType().equals("C")){ %>
		<li><a href="addUser.htm">»&nbsp;My Profile</a>
		<%} %>
		<li><a href="enquiries.htm">»&nbsp;Enquiries/Responses</a> 
		<li><a href="project.htm">»&nbsp;Bank Projects</a>
		<li><a href="customer.htm">»&nbsp;Bidders</a> 
		<li><a href="bankers.htm">»&nbsp;Bankers</a>
		<%if(user.getUserType().equals("A")){ %>
		<li><a href="users.htm">»&nbsp;Users</a>
		<li><a href="roles.htm">»&nbsp;Roles</a>
		<li><a href="permissions.htm">»&nbsp;Permissions</a>
		<li><a href="executive.htm">»&nbsp;Executives</a>
		<li><a href="sms.htm">»&nbsp;Sms Sent</a>
		<li><a href="smsTemplate.htm">»&nbsp;Sms Templates</a>
		<li><a href="smsSettings.htm">»&nbsp;Sms Settings</a>
		<li><a href="addUser.htm?cmd=myProfile&userId=<%=userId %>">»&nbsp;My Profile</a></li>
		<%}%>
		<%if(user.getUserType().equals("AO") || user.getUserType().equals("B")){ %>
		<li><a href="addUser.htm?cmd=myProfile&userId=<%=userId %>">»&nbsp;My Profile</a></li>
		<%} %>
		</ul>
		</div>
		</td></tr></table>
</div>
	