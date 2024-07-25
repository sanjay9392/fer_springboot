<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.common.services.UserService"%>
<%@page import="com.zedapp.eauction.common.services.UserServiceImpl"%>
<%User user=null;
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
Auction auction= (Auction) request.getAttribute("auction");
UserService userService= new UserServiceImpl();
User aoUser=userService.getById(auction.getAoid());
BankProjects project=auction.getProject();
%>

<div class='contacts-div'>
<div class='section-title'>Contact Details</div>
<div class='section-body'>
<div class='proj-title'>Auction: <%=project.getProjName() %></div>
<div class='ao-info'>Contact AO-Banker:<br> 
<%=aoUser.getUserName() %> (<%=auction.getContactsNos() %>) </div>
</div>
</div>