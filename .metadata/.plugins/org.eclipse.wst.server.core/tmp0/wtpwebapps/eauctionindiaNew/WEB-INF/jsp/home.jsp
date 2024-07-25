<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.service.BankersService"%>
<%@page import="com.zedapp.eauction.service.BankersServiceImpl"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.User"%>

<%@page import="java.util.HashSet"%><div class="welcome">
<%
User user=(User)request.getAttribute("user");
%>

<div class='current-time'>Date</div>
</div>
<div class="auctions-list">
<div class="running-auctions">
	<div class="section-title">Live Online Auctions</div>
	<%
			Set<Auction> viewAuction=(Set)request.getAttribute("project");
			BankersService bankerService=new BankersServiceImpl();
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("S")){
				BankProjects p=auction.getProject();
				String bankName=bankerService.getById(p.getBid()).getBankName();
			%>
			<div class='auction-project'>
			<table><tr><td width='150' class='auction-image'> <img src='".base_url()."uploads/".$p->propertyImage."' width='100' height='100' alt='Auction Image'></td>
			<td width='400'>
			<div class='bank'><%=bankName %></div>
			<div class='project-title'><%=p.getProjName() %></div>
					<div class='auction-date'>Auction Date: <%=p.getAuctionDate() %></div>
					<div class='auction-date'>Auction Date: <%=p.getAuctionDate() %></div>
					<div class='start-bid'>Reserve Price  Rs.<%=p.getMinBid() %></div>
					<div class='start-bid'>No of Participants = </div>
					<div class='contact-info'>Contact: </div>
					</td><td width='200'>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
					</td></tr></table>
					</div>
					<%
					}
			}
		%>
	</div>

<div class="auctions">
	<div class="section-title">Future Auctions (Or Pending Auctions)</div>
	<%
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("P") || auction.getStatus().equals("CL")){
				BankProjects p=auction.getProject();
				String bankName=bankerService.getById(p.getBid()).getBankName();
			%>
			<div class='auction-project'>
			<table><tr><td width='150' class='auction-image'> <img src='".base_url()."uploads/".$p->propertyImage."' width='100' height='100' alt='Auction Image'></td>
			<td width='400'>
			<div class='bank'><%=bankName %></div>
			<div class='project-title'><%=p.getProjName() %></div>
			<% if(auction.getStatus().equals("P")) { %>
				<div class='auction-date'>Auction Date: <%=p.getAuctionDate() %></div>
			<% } %>
			<div class='start-bid'>Reserve Price  Rs.<%=p.getMinBid() %></div>
			<div class='start-bid'>No of Participants = </div>
			<div class='contact-info'>Contact: </div>
			</td><td width='200'>
			<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
			</td></tr></table>
			</div>
			<%
			}
			}
%>
</div>

<div class="auction-results">
	<div class="section-title">Auction Results</div>
	<%
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("C")){
				BankProjects p=auction.getProject();
				String bankName=bankerService.getById(p.getBid()).getBankName();
			%>
			<div class='auction-project'>
					<table><tr><td width='150' class='auction-image'> <img src='".base_url()."uploads/".$p->propertyImage."' width='100' height='100' alt='Auction Image'></td>
					<td width='400'>
					<div class='bank'><%=bankName %></div>
					<div class='project-title'><%=p.getProjName() %></div>
					<div class='auction-date'>Auction Date: <%=p.getAuctionDate() %></div>
					<div class='start-bid'>Reserve Price  Rs.<%=p.getMinBid() %></div>
					<div class='contact-info'>acution date:<%=auction.getAuctionDate() %></div>
					</td><td width='200'>
					<div class='winner'>Winner is <%=auction.getWinnerName() %>
					</div>
				<div class='win-bid-amt'>Winning Bid :<%=auction.getWinBidAmt() %></div>
					</td></tr></table>
					</div>
					<%
					}
			}
		%></div>
</div>


<script type="text/javascript">
var $ = jQuery;
var timeId = 0;
$(document).ready(function() {
	var today = new Date();
	$(".current-time").html(""+today);
	var runId = setInterval(getAuctionsList, 10000);
	timeId = setInterval(showDateTime, 2000);
});
function showDateTime() {
	var today = new Date();
	$(".current-time").html(""+today);
}
function getAuctionsList() {
	//$(".auctions-list").html("refreshing");
	var urlStr = "project.htm";
	//alert(urlStr);
	$.ajax({
		type: "POST",
		url: urlStr,
		error: function(req,error) { /*alert("error="+error);*/ },
		success: function(data) {
					$(".auctions-list").html(data);
				}
	});
}
function startAuction(aid) {
	var urlStr = "<?php echo base_url(); ?>admin/Pages/ajaxStartAuction/"+aid;
	//alert(urlStr);
	$.ajax({
		type: "POST",
		url: urlStr,
		error: function(req,error) { alert("error="+error); },
		success: function(data) {
					$(".auctions-list").html(data);
				}
	});
}
function viewAuction(aid) {
	window.location.href = "viewRunningAuction.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
</script>