<%@page import="com.zedapp.eauction.service.BankersService"%>
<%@page import="com.zedapp.eauction.service.BankersServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Bankers"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.common.util.MoneyUtil"%>

<%User user=null;
String loginStatus ="Online";
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

//Set<Customer> custList=auction.getCutomerList();
BankersService bankersService= new BankersServiceImpl();
List<User> custList=(List)request.getAttribute("customerList");
Bankers banker=bankersService.getById(project.getBid());
%>
<div class="current-bid">
	<div class="section-title">Current Bid</div>
	<div class="section-body">
		<div class="project-title"> <%=project.getProjName() %> <input type="hidden" name="aid" value="<%=auction.getAid() %>" id="aid"> </div>
		<!-- <div class="bank"> ICICI</div> -->
		<div class="bank"> Banker: <%= banker.getBankName() %> </div>
		
		<div class="admin-bid-rule">Bid Rule Changed : Rs.<%=project.getMaxBidDiff()%> </div>
		<div class="running-status"><%=status %></div>
		
				
		<%-- <%if(user.getUserType().equals("C")){ %>
		<div class="participants section-title">AO Banker</div>
		<div class="section-body">
		<%
		
		out.print("<table border='0'>");
		if(user.getUserType().equals("C")){
		  if(user.getIsLogin().equals("Y"))
			  loginStatus ="Online";
		  else
			  loginStatus ="Offline";
		  	out.print("<tr class='user_"+user.getUserId()+" user'><td><div class='user_"+user.getUserId()+" user' title='"+user.getUserId()+"'>"+user.getUserName()+"</div></td>");
			out.print( "<td><div class='clogin_"+user.getUserId()+"'>"+loginStatus+"</td>");
			out.print( "</tr>");
		  
		  }
		  out.print("</table>");
		  }%>
		</div>  --%>
		
		 <div class="participants-bid-div">
		  
			<div class="participants section-title">Participants</div>
			<div class="section-body">
			<%
				if(custList!= null && custList.size()>0){
					//String loginStatus="Offline";
					out.print("<table border='0'>");
					for(User user1:custList){
						int uid1= user1.getTypeId();
						for(Customer c:auction.getCutomerList()){
							//System.out.println("customerList"+auction.getCutomerList());
							if(c.getCid()==uid1){
						
						if(user1.getIsLogin().equals("Y"))
							loginStatus="Online";
						else
							loginStatus="Offline";
						out.print("<tr class='user_"+user1.getUserId()+" user'><td><div class='user_"+user1.getUserId()+" user '' "+user1.getUserId()+"'>"+user1.getUserName()+"</div></td>");
						out.print( "<td><div class='cust_"+user1.getUserId()+" user' '"+user1.getUserId()+"'>Rs."+MoneyUtil.displayMoney(c.getQuotation()) +"</div></td>");
						out.print( "<td><div class='clogin_"+user1.getUserId()+"'>"+loginStatus+"</td>");
						out.print( "</tr>");
							}
					}
					}
					out.print("</table>");
				}
				%>
			
			</div>
			</div>
		</div>
	</div>
