<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@page import="java.util.Collections"%>
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
<div class="welcome">
<div class='current-time'>Date</div>
</div>
<div class="auctions-list">
<div class="running-auctions">
	<div class="section-title">Closed Auctions</div>
	<%
				Set<Auction> viewAuction=(Set)request.getAttribute("project");
				Collections.synchronizedCollection(viewAuction);
				for(Auction auction:viewAuction){
					if(auction.getStatus().equals("C")){
					BankProjects p=auction.getProject();
					String minBid = p.getMinBid();
					String winBidAmt = auction.getWinBidAmt();
				%>
				<div class='auction-project'>
						<table><tr>
						<td width='150' class='auction-image'>
						<%-- <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'> --%>
						<a href="javascript:viewImg('<%=p.getPropertyImage() %>')"> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></a>
						</td>
						<td width='150' class='auction-image'><a href="javascript:viewImg('<%=p.getAdvImage() %>')"> <img src='./uploads/<%=p.getAdvImage() %>' width='100' height='100' alt='Auction Image'></a></td>
						<%-- <td width='150' class='auction-image'><img src='./uploads/<%=p.getPropertyImage() %>' onclick="javascript:viewImg('<%=p.getPropertyImage() %>')"  width='100' height='100' alt='Auction Image'></td> --%>
						<td width='400'>
						<div class='bank'><%=auction.getBankName() %></div>
						<div class='project-title'><%=p.getProjName() %></div>
						<div class='auction-date'>Auction Date: <%=auction.getAuctionDate() %></div>
						<div class='start-bid'>Reserve Price  Rs.<%=MoneyUtil.displayMoney(minBid) %></div>
						<%-- <div class='contact-info'>acution date:<%=auction.getAuctionDate() %></div> --%>
						</td><td width='200'>
						<%-- <div class='winner'>Winner is: <%=auction.getWinnerName() %></div> --%>
						<div class='winner'>Winner is :<%=auction.getWinnerName() %></div>
						<%System.out.println("getwinndrname"+auction.getWinnerName()); %>
						<div class='win-bid-amt'>Winning Bid :<%=MoneyUtil.displayMoney(winBidAmt) %></div>
						<input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
						<br> <input type='button' class='button' value='View Report / Print Report' onclick='openWindow(<%=auction.getAid() %>)'>
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
function viewProject(aid) {
	window.location.href = "viewProjectDetails.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
function openWindow(aid) {
	//window.open("<?php echo base_url(); ?>admin/BankProjects/viewPrintAuction/"+aid);
	window.open("viewPrintAuction.htm?aid="+aid, "", "toolbar=no,location=no,menubar=no, scrollbars=1");
}
function viewImg(img) {
	
	var img1="./uploads/"+img;
	window.open(img1);
		
}
function viewAuction(aid) {
	window.location.href = "viewRunningAuction.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
</script>