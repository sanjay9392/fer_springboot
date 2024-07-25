<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="java.util.List"%><script src="./js/jqueryRotate.js" type="text/javascript"></script>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>

<%User user=null;
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
Auction auction= (Auction) request.getAttribute("auction");
BankProjects project=auction.getProject();
String status=auction.getStatus();
if(status.equals("S"))
		status="Running";
if(status.equals("P"))
		status="Pending";
if(status.equals("C"))
	status="Closed";

List<User> custList=(List)request.getAttribute("customerList");
%>
<div class="participants-div">
	<div class="participants section-title">Participants</div>
	<div class="section-body">
		<%
			for(User customer1:custList){%>
				<div class='user'><%=customer1.getUserName() %></div>
			<%}
					
		%>
	</div>
</div>
