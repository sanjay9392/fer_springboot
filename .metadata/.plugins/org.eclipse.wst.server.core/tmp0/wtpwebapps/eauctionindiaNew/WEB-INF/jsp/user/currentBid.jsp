<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="java.util.Set"%>

<%@page import="com.zedapp.eauction.service.BankersService"%>
<%@page import="com.zedapp.eauction.service.BankersServiceImpl"%>
<%@page import="com.zedapp.eauction.service.BankProjectsService"%>
<%@page import="com.zedapp.eauction.service.BankProjectsServiceImpl"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Bankers"%>
<%@page import="com.zedapp.common.util.MoneyUtil"%>

<%
BankersService bankersService= new BankersServiceImpl();
BankProjectsService bankProjectsService= new BankProjectsServiceImpl();
//User user=(User)request.getAttribute("user");
User user=null;
//String loginStatus ="Online";
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
Auction auction= (Auction) request.getAttribute("auction");
System.out.println("Auction Id==============>>>>"+auction.getAid());
BankProjects project=auction.getProject();
String status=auction.getStatus();
//BankProjects bankProjects= bankProjectsService.getById(auction.getPid());
Bankers banker=bankersService.getById(project.getBid());
if(status.equals("S"))
		status="Running";
if(status.equals("P"))
		status="Pending";
if(status.equals("C"))
	status="Closed";

//Set<Customer> custList=auction.getCutomerList();
Set<Customer> custList=(Set)request.getAttribute("customerList");
Set<User> userList = (Set)request.getAttribute("userList");
%>

<div class="current-bid">
	<div class="section-title">Current Bid</div>
	<div class="section-body">
		<!-- <div class="timer-run">00</div> -->
		<div class="project-title"> <%=project.getProjName() %> <input type="hidden" name="aid" value="<%=auction.getAid() %>" id="aid"> </div>
		<div class="bank"> Banker: <%= banker.getBankName() %> </div>
		<div class="start-bid"> Reserve Price Rs.<%= project.getMinBid() %>  </div>
		<!--<div class="bid-rule"> Bid Rule : Rs.<%=project.getMaxBidDiff() %></div> 
		--><div class="admin-bid-rule">Bid Rule : Rs.<%=project.getMaxBidDiff()%> </div>
		<div class="running-status">Status:<%=status %></div>
		<div class="ao-status-label">AO Banker: <span class="ao-status"></span></div>
		
		
	</div>
</div>
