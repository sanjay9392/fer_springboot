<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@page import="java.util.Collections"%>
<%@page import="com.zedapp.eauction.model.Borrower"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.service.BankersService"%>
<%@page import="com.zedapp.eauction.service.BankersServiceImpl"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.User"%>

<%@page import="java.util.HashSet"%>
<%@page import="com.zedapp.eauction.common.services.UserService"%>
<%@page import="com.zedapp.eauction.common.services.UserServiceImpl"%>
<%@page import="com.zedapp.common.util.DatesUtil"%>
<%
String uType="C";
User user=null;
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
if(user!=null)
	uType=user.getUserType();
%>

<div class="welcome">
<div class='current-time'>Date</div>
</div>
<div class="auctions-list">
<div class="running-auctions">
	<div class="section-title">Future Auctions (Or Pending Auctions)</div>
	<%
			Set<Auction> viewAuction=(Set)request.getAttribute("project");
			Collections.synchronizedCollection(viewAuction);
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("P")){
				BankProjects p=auction.getProject();
				String minBid = p.getMinBid();
			/* 	Borrower brwr = auction.getBorrower(); */
				
			%>
			<div class='auction-project'>
			<table>
			<%-- <tr><td valign="top">
			<div class="table">
			<table border="0">	
			<tr>
			
			<th>Property Image </th><th>Customer name </th><th>Property Address</th><th>Property Type</th><th>Property Area</th><th>Inspection Date & Time </th><th>Auction Date & Time</th><th>Reserve Price</th></tr>
			<tr>
			<td width='150' class='auction-image'> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></td>
			<td> </td><td></td>
			    <td><%=auction.getBorrower().getPropertyAddress()%></td>
			    <td><%=auction.getProject().getPropertyType() %></td>
			    <td><%=auction.getProject().getPropertyArea() %></td>
			    <td><%=auction.getInspectionDt() %></td>
			    <td><%=auction.getAuctionDate() %></td>
			    <td><%=auction.getProject().getMinBid() %></td>
			    
			    <td width='200'>
					<%if(uType.equals("C")){ %>
					<input type='button' class='button2' value='Registration' onclick='registration(<%=auction.getAid() %>)'>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(<%=auction.getAid() %>)'>
					<%} else{ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
					<%} %>
					</td>
			    </tr>
			    </table>
			    </div>
			    </td>
			    </tr> --%>
			 <table><tr>
			 <td width="150" class='auction-image' >
			 <%-- <img src='./uploads/<%=p.getPropertyImage() %>'  width='100' height='100' alt='Auction Image'> --%>
			 <a href="javascript:viewImg('<%=p.getPropertyImage() %>')"> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></a>
			 
			 </td>
			 <td width='150' class='auction-image'> <a href="javascript:viewImg('<%=p.getAdvImage() %>')"> <img src='./uploads/<%=p.getAdvImage() %>'  width='100' height='100' alt='Auction Image'></a></td>
			<td width='400'>
			<div class='bank'><%=auction.getBankName() %></div>
			<div class='project-title'><%=p.getProjName() %></div>
					<div class='auction-date'>Auction Date: <%=DatesUtil.getFormatDMYHMSA(auction.getAuctionDate())%></div>
					<div class='start-bid'>Reserve Price  Rs.<%=MoneyUtil.displayMoney(minBid) %></div>
					<%if(!uType.equals("C") ){ %>
					<div class='start-bid'>No of Registrations =<%=auction.getCutomerList().size() %> </div>
					<%} %>
					<div class='start-bid'>For Help Contact AO  <br>
					ContactNo:<%=auction.getContactsNos() %></div>
					</td><td width='200'>
					<%if(uType.equals("C")){ %>
					<%--  <input type='button' class='button2' value='Registration' onclick='registration(<%=auction.getAid() %>)'> --%>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(<%=auction.getAid() %>)'>
					<%} else{ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
	                 <br><input type='button' class='button2' value='Cancel Auction' onclick='cancelAuction(<%=auction.getAid() %>)'> 				
					<%} %>
					</td></tr> 
					</table>
					</div>
					<%
					}
			}
		%>
	</div>
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

function cancelAuction(aid){
	//alert("cancelauction  "+aid);
	
	
	if(aid==0) return;
	cancelAuctionByAdmin(aid);
	//showConfirm("Are you sure you want to cancel the Auction?", "cancelAuctionByAdmin(aid)");
	/* 
	window.location.href = "cancelAuctions.htm?aid="+aid;
	 */
}

function cancelAuctionByAdmin(aid) {
	//alert("cancel function"+aid);
	//msgOK();
	/* var aid = $("#aid").val(); */
//	increaseAjaxReqNo();
	$.ajax({
			type: "POST",
			url: "/eauction/ajaxCancelAuction.htm",
			data: "aid="+aid/* +"&ajaxReqNo="+ajaxReqNo */,
			// timeout: ajaxTimeout,
			dataType: "json",
			error: function(req, status, error) {
				
				//	checkResponseTimeout(status);
				},
			success: function(data) {
				
				
				//updateCurrentBid(data);
				$(".running-auctions").load();
			}
		});
}
function registration(aid){
	window.location.href ="registration.htm?aid="+aid;
}
function viewProject(aid) {
	window.location.href = "viewProjectDetails.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}

function viewImg(img) {
	
	var img1="./uploads/"+img;
	window.open(img1);
		
}
</script>
