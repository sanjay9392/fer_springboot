
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@ page import="com.zedapp.eauction.model.Bid" %>
<%@ page import="com.zedapp.eauction.model.Broadcast" %>
<%@ page import="java.util.List" %>
<%

	List<Broadcast> broadcasts=(List)request.getAttribute("allBroadCasts");
	List<Bid> allBids=(List)request.getAttribute("allBids");
	Auction auction= (Auction) request.getAttribute("auction");
	System.out.print("auction object"+auction);
	BankProjects bankProject=auction.getProject();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
	
	String bankName = auction.getBankName();
	String projName = bankProject.getProjName();
	String aucDate = "";
	try {
		aucDate = sdf.format(auction.getAuctionDate());
		//aucDate = sdf.format(cal.getTime());
	} catch(Exception ex) { System.out.println("aucDate ex: "+ex.getMessage());}
	String inspDate = "";
	try {
		Date adt = auction.getInspectionDt();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, adt.getDate());
		cal.set(Calendar.MONTH, adt.getMonth());
		cal.set(Calendar.YEAR, 1900+adt.getYear());
		cal.set(Calendar.HOUR_OF_DAY, adt.getHours()+5);
		cal.set(Calendar.MINUTE, adt.getMinutes()+30);
		cal.set(Calendar.SECOND, adt.getSeconds());
		cal.set(Calendar.MILLISECOND, 0);
		//inspDate = sdf.format(auction.getInspectionDt());
		inspDate = sdf.format(cal.getTime());
	} catch(Exception ex) { System.out.println("inspDate ex: "+ex.getMessage());}
	String aucStartDate = "";
	try {
		Date adt = auction.getStartedDt();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, adt.getDate());
		cal.set(Calendar.MONTH, adt.getMonth());
		cal.set(Calendar.YEAR, 1900+adt.getYear());
		cal.set(Calendar.HOUR_OF_DAY, adt.getHours()+5);
		cal.set(Calendar.MINUTE, adt.getMinutes()+30);
		cal.set(Calendar.SECOND, adt.getSeconds());
		cal.set(Calendar.MILLISECOND, 0);
		//aucStartDate = sdf.format(auction.getStartedDt());
		aucStartDate = sdf.format(cal.getTime());
	} catch(Exception ex) { System.out.println("aucStartDate ex: "+ex.getMessage());}
	
	String aucCloseDate = "";
	try {
		Date adt = auction.getClosedDt();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, adt.getDate());
		cal.set(Calendar.MONTH, adt.getMonth());
		cal.set(Calendar.YEAR, 1900+adt.getYear());
		cal.set(Calendar.HOUR_OF_DAY, adt.getHours()+5);
		cal.set(Calendar.MINUTE, adt.getMinutes()+30);
		cal.set(Calendar.SECOND, adt.getSeconds());
		cal.set(Calendar.MILLISECOND, 0);
		//aucCloseDate = sdf.format(auction.getClosedDt());
		aucCloseDate = sdf.format(cal.getTime());
	} catch(Exception ex) { System.out.println("aucStartDate ex: "+ex.getMessage());}

	String startBid = bankProject.getMinBid();
	String emd=bankProject.getEmd();
	String status = auction.getStatus();
	String dispStatus = "";
	String cname = "";
	String mobile = "";
	String email = "";
	String addr = "";

	String aoName="";
	String winBidAmt="";
	Customer winner=null;
	try{
		aoName=auction.getAoBankerName();
		winBidAmt = auction.getWinBidAmt();
		winner=auction.getCustomer();
	if(winner!=null) {
	
		
		cname = winner.getCname();
		mobile = winner.getMobile();
		email = winner.getEmail();
		addr = winner.getAddr();
	
	}

	if(status.equals("C"))
		dispStatus = "CLOSED";
	}catch(Exception e){System.out.println("------Sahoo added --------------------");e.printStackTrace();}
%>


<%@page import="com.zedapp.common.util.MoneyUtil"%><style type="text/css">

.custList {

	/*width: 600px;*/

	border: 1px solid #000;

}

.custList th, .custList td {

	padding: 5px;

	border-left: 1px solid #000;

	border-bottom: 1px solid #000;

	text-align: left;

}

table th {

	text-align: left;

}

div.signature {

	float: right;
	line-height: 32px;

}

</style>

<center>

<table border="0">

<tr><td valign="top">

	<table border="0">

	<tr><th>Bank</th><td> <%=bankName%> </td></tr>

	<tr><th>Auction</th><td> <%=projName%> </td></tr>

	<tr><th>Auction Date</th><td> <%=aucDate%> </td></tr>

	<tr><th>Start Date</th><td> <%=aucStartDate%> </td></tr>

	<tr><th>Closed Date</th><td> <%=aucCloseDate%> </td></tr>

	<tr><th>Auction Status</th><td> <%=dispStatus%> </td></tr>

	<tr><th>EMD</th><td> Rs.<%=MoneyUtil.displayMoney(emd) %> </td></tr>

	<tr><th>Reserve Price</th><td> Rs.<%=MoneyUtil.displayMoney(startBid)%> </td></tr>

	</table>

</td><td valign="top">

	<table border="0">

	<tr><th colspan="2">Winner Details </th></tr>

	<tr><th>Name</th><td> <%=cname%> </td></tr>

	<tr><th>Mobile</th><td> <%=mobile%> </td></tr>

	<tr><th>Email</th><td> <%=email%> </td></tr>

	<tr><th>Address</th><td> <%=addr%> </td></tr>

	<tr><th>Final Bid</th><td> Rs.<%=MoneyUtil.displayMoney(winBidAmt)%> </td></tr>

	</table>

</td></tr>

<tr><td valign="top" colspan="2">

	<table class="custList">

	<tr><th>Participant Name</th><th>Address</th><th>EMD Detail</th><th>Tender Amount</th><th>Auction History</th></tr>

	<%
	for(Customer customer:auction.getCutomerList()) {
	%>
		<tr><td><%=customer.getCname() %></td>

		<td><%=customer.getAddr() %> &nbsp; </td>

		<td>Rs.<%=MoneyUtil.displayMoney(emd) %></td>

		<td>Rs.<%=MoneyUtil.displayMoney(customer.getQuotation()) %></td>

		<td>
	<%
		boolean isFound = false;

		if(allBids.size()>0) {

			for(Bid bid:allBids) {
			 if(customer.getUser()!=null){	 

				if(customer.getUser().getUserId() == bid.getCid()) {

					isFound = true;
	%>

					<table cellspacing='0' cellpadding='0'>
					<tr><td>Rs.<%=MoneyUtil.displayMoney(bid.getBidAmount()) %> </td>
					<td>
					<%
					try {
					Date bcdt = bid.getCreatedDt();
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.DAY_OF_MONTH, bcdt.getDate());
					cal.set(Calendar.MONTH, bcdt.getMonth());
					cal.set(Calendar.YEAR, 1900+bcdt.getYear());
					cal.set(Calendar.HOUR_OF_DAY, bcdt.getHours()+5);
					cal.set(Calendar.MINUTE, bcdt.getMinutes()+30);
					cal.set(Calendar.SECOND, bcdt.getSeconds());
					cal.set(Calendar.MILLISECOND, 0);
					out.println(sdf.format(cal.getTime()));
					} catch(Exception ex) {ex.printStackTrace();}
					//sdf.format(bid.getCreatedDt())
					%> 
					</td></tr> </table>
<%
				}

			}

		}
		}
		if(!isFound) {
%>
			 &nbsp;
<%
		}
%>
		</td>
<%
	}

	 %>
	<tr><td colspan="5">Total Bidding count = <%if(allBids.size()>0){%><%= allBids.size()%> <%}else{%> "Not Available"<%} %></td></tr>
	</table>

</td></tr>

<tr><td valign="top" colspan="2">

	<table class="custList">

	<tr><th>Message By</th><th>Message</th><th>Message Time</th></tr>

	<%

	for(Broadcast broadcast:broadcasts) {

		String str = "";

		if(broadcast.getUserType().equals("AO")) {

			str = " (AO-Banker)";
%>
			<tr><td><%=aoName+str %></td><td><%=broadcast.getMessage() %></td>
			<td>
			<%
					try {
					Date bcdt = broadcast.getCreatedDt();
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.DAY_OF_MONTH, bcdt.getDate());
					cal.set(Calendar.MONTH, bcdt.getMonth());
					cal.set(Calendar.YEAR, 1900+bcdt.getYear());
					cal.set(Calendar.HOUR_OF_DAY, bcdt.getHours()+5);
					cal.set(Calendar.MINUTE, bcdt.getMinutes()+30);
					cal.set(Calendar.SECOND, bcdt.getSeconds());
					cal.set(Calendar.MILLISECOND, 0);
					out.println(sdf.format(cal.getTime()));
					} catch(Exception ex) {ex.printStackTrace();}
					//sdf.format(broadcast.getCreatedDt())
					%>
			</td></tr>
<%
		} else if(broadcast.getUserType().equals("C")) {
			str = " says";
			%>
			<tr><td><%=broadcast.getUser().getUserName()+str %></td><td><%=broadcast.getMessage() %></td>
			<td>
			<%
					try {
					Date bcdt = broadcast.getCreatedDt();
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.DAY_OF_MONTH, bcdt.getDate());
					cal.set(Calendar.MONTH, bcdt.getMonth());
					cal.set(Calendar.YEAR, 1900+bcdt.getYear());
					cal.set(Calendar.HOUR_OF_DAY, bcdt.getHours()+5);
					cal.set(Calendar.MINUTE, bcdt.getMinutes()+30);
					cal.set(Calendar.SECOND, bcdt.getSeconds());
					cal.set(Calendar.MILLISECOND, 0);
					out.println(sdf.format(cal.getTime()));
					} catch(Exception ex) {ex.printStackTrace();}
					//sdf.format(broadcast.getCreatedDt())
					%>
			</td></tr>
	<%	} else {

			str = " (Event)";
%>
			<tr><td><%=str %></td><td><%=broadcast.getMessage() %></td>
			<td>
			<%
					try {
					Date bcdt = broadcast.getCreatedDt();
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.DAY_OF_MONTH, bcdt.getDate());
					cal.set(Calendar.MONTH, bcdt.getMonth());
					cal.set(Calendar.YEAR, 1900+bcdt.getYear());
					cal.set(Calendar.HOUR_OF_DAY, bcdt.getHours()+5);
					cal.set(Calendar.MINUTE, bcdt.getMinutes()+30);
					cal.set(Calendar.SECOND, bcdt.getSeconds());
					cal.set(Calendar.MILLISECOND, 0);
					out.println(sdf.format(cal.getTime()));
					} catch(Exception ex) {ex.printStackTrace();}
					//sdf.format(broadcast.getCreatedDt())
					%>
			</td></tr>
<%
		}

	}

	%>

	</table>

</td></tr>

<tr><td>The Auction was won by <%=((winner!=null) ? winner.getCname() : "") %> at Rs.<%=MoneyUtil.displayMoney(auction.getWinBidAmt())%> </td></tr>

<tr><td colspan="2" height="50">&nbsp;</td></tr>

<tr><td colspan="2" class="signature">

	<div class="signature">Signature <br><br>

	<%=aoName%><br>

		(Authorized Officer)</div>
	</table>

</td></tr>

</table>

</center>

<script type="text/javascript">

window.print();

</script>

