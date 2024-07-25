<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@page import="java.util.Collections"%>
<%@page import="com.zedapp.eauction.model.Borrower"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.User"%>

<%@page import="java.util.HashSet"%>

<%@page import="com.zedapp.common.util.DatesUtil"%>
<script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
<div class="welcome">

<div class='current-time'>Date</div>
</div>
<div class="auctions-list">
<div class="running-auctions">
	<div class="section-title">Live Online Auctions</div>
	<%
	String uType="C";
	User user=null;
	
	if(request.getSession().getAttribute("loginUser")!=null)
		user = (User)request.getSession().getAttribute("loginUser");
	if(user!=null)
		uType=user.getUserType();
			Set<Auction> viewAuction=(Set)request.getAttribute("project");
			Collections.synchronizedCollection(viewAuction);
			
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("S")){
				BankProjects p=auction.getProject();
				String minBid=p.getMinBid();
			%>
			<div class='auction-project'>
			<table>
		<%-- 	<tr><td valign="top">
			<div class="table">
			<table border="0">	
			<tr><th>Property Image </th><th>Customer name </th><th>Property Address</th><th>Property Type</th><th>Property Area</th><th>Inspection Date & Time </th><th>Auction Date & Time</th><th>Reserve Price</th></tr>
			<tr>
			<td width='150' class='auction-image'> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></td>
			<td><%=auction.getBorrower() %></td>
			       <td> </td>
			    <td><%=auction.getBorrower().getPropertyAddress()%></td>
			    <td><%=auction.getProject().getPropertyType() %></td>
			    <td><%=auction.getProject().getPropertyArea() %></td>
			    <td><%=auction.getInspectionDt() %></td>
			    <td><%=auction.getAuctionDate() %></td>
			    <td><%=auction.getProject().getMinBid() %></td>
			    
			    <td width='200'>
					<%if(uType.equals("C")){ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(<%=auction.getAid() %>)'>
					<%} else{ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
					<%} %>
					</td>
			    </tr>
			    </table>
			    </div>
			    </td>
			    </tr>
			     --%>
			<tr><td width="150" class='auction-image' >
			<%-- <img src='./uploads/<%=p.getPropertyImage()%>' width='100' height='100' alt='Auction Image'> --%>
			<a href="javascript:viewImg('<%=p.getPropertyImage() %>')"> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></a>
			</td>
			<td width='150' class='auction-image'> 
			
			 <a href="javascript:viewImg('<%=p.getAdvImage() %>')">  <img src='./uploads/<%=p.getAdvImage()%>' width='100' height='100' alt='Auction Image'></a></td> 
		
			<td width='400'>
			<div class='bank'><%=auction.getBankName() %></div>
			<div class='project-title'><%=p.getProjName() %></div>
					<div class='auction-date'>Auction Date: <%=DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) %></div>
					<div class='start-bid'>Reserve Price  Rs.<%=MoneyUtil.displayMoney(minBid) %></div>
					<%if(!uType.equals("C") ){ %>
					<div class='start-bid'>No of Registrations =<%=auction.getCutomerList().size() %> </div>
					<%} %>
					<div class='start-bid'>For Help Contact AO <br>
					ContactNo:<%=auction.getContactsNos() %></div>
					</td><td width='200'>
					<%if(uType.equals("C")){ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(<%=auction.getAid() %>)'>
					<%} else{ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
					<%} %>
					</td></tr> 
					
					
					</table>
					</div>
					<%
					}
			}
		%>
	</div>

<div class="auctions">
	<div class="section-title">Future Auctions (Or Pending Auctions)</div>
	<%
		String canc = "CL";
		if(uType.equals("C"))
	  	canc = "CLS";
			for(Auction auction:viewAuction){
				
				if(auction.getStatus().equals("P") || auction.getStatus().equals(canc)){
				BankProjects p=auction.getProject();
				String minBid = p.getMinBid();		
			%>
			<div class='auction-project'>
			
			<table>
			<%-- <tr><td valign="top">
			<div class="table">
			<table border="0">	
			<tr><th>Property Image </th><th>Customer name </th><th>Property Address</th><th>Property Type</th><th>Property Area</th><th>Inspection Date & Time </th><th>Auction Date & Time</th><th>Reserve Price</th></tr>
			<tr>
			<td width='150' class='auction-image'> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></td>
			<td></td><td></td>
			    <td><%=auction.getBorrower().getPropertyAddress()%></td>
			    <td><%=auction.getProject().getPropertyType() %></td>
			    <td><%=auction.getProject().getPropertyArea() %></td>
			    <td><%=auction.getInspectionDt() %></td>
			    <td><%=auction.getAuctionDate() %></td>
			    <td><%=auction.getProject().getMinBid() %></td>
			    
			    <td width='200'>
					<%if(uType.equals("C")){
						
						%>
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
		 <td  width='150' class='auction-image'>
		 <%-- <img  src='./uploads/<%=p.getPropertyImage() %>'  width='100' height='100' alt='Auction Image'> --%>
		 
		 <a href="javascript:viewImg('<%=p.getPropertyImage() %>')"> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></a>
		 </td>
		 <td width='150' class='auction-image'>
		 <div >
		 <a href="javascript:viewImg('<%=p.getAdvImage() %>')"> <img src='./uploads/<%=p.getAdvImage() %>'  width='100' height='100' alt='Auction Image'></a>
		 </div>
		  </td>
			<td width='400'>
			<div class='bank'><%=auction.getBankName() %></div>
			<div class='project-title'><%=p.getProjName() %></div>
			<% if(auction.getStatus().equals("P")) { %>
					<div class='auction-date'>Auction Date: <%=DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) %></div>
			<% } %>
					<div class='start-bid'>Reserve Price  Rs.<%=MoneyUtil.displayMoney(minBid) %></div>
					<%if(!uType.equals("C") ){ %>
					<div class='start-bid'>No of Registrations =<%=auction.getCutomerList().size() %> </div>
					<%} %>
					<div class='start-bid'>For Help Contact AO  <br>
					ContactNo:<%=auction.getContactsNos() %></div>
					</td><td width='200'>
					<%if(uType.equals("C")){ %>
					<%-- <input type='button' class='button2' value='Registration' onclick='registration(<%=auction.getAid() %>)'> --%>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(<%=auction.getAid() %>)'>
					<%} else{ %>
					<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(<%=auction.getAid() %>)'>
					<%} %>
			</td></tr>
			</table>
			</div>
			<%
			}
			}
%>
</div>
<% if(user!=null ){
	if(!user.getUserType().equals("C")){%>

<div class="auction-results">
	<div class="section-title">Auction Results</div>
	<%
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("C")){
				BankProjects p=auction.getProject();
				String minBid = p.getMinBid();
				String winBidAmt = auction.getWinBidAmt();
			%>
			<div class='auction-project'>
			
					<table><tr><td width="150" class='auction-image' >
					<%-- <img  src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'> --%>
					
					<a href="javascript:viewImg('<%=p.getPropertyImage() %>')"> <img src='./uploads/<%=p.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></a>
					</td>
					<td width='150' class='auction-image'>
					
					<a href="javascript:viewImg('<%=p.getAdvImage() %>')"> <img  src='./uploads/<%=p.getAdvImage() %>' width='100' height='100' alt='Auction Image'></a>
					
					</td>
					<td width='400'>
					<div class='bank'><%=auction.getBankName() %></div>
					<div class='project-title'><%=p.getProjName() %></div>
					<div class='auction-date'>Auction Date: <%=DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) %></div>
					<div class='start-bid'>Reserve Price  Rs. <%=MoneyUtil.displayMoney(minBid) %></div>
					</td><td width='200'>
					<div class='winner'>Winner is :<%=auction.getWinnerName() %></div>
					<%System.out.println("Winner Name :"+auction.getWinnerName()); %>
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
<%}} %>

<script type="text/javascript">
var $ = jQuery;
var timeId = 0;
$(document).ready(function() {
	var today = new Date();
	$(".current-time").html(""+today);
	var runId = setInterval(getAuctionsList, 10000);
	timeId = setInterval(showDateTime, 2000);
	
	$('.img:gt(0)').hide();
    setInterval(function() {
        $(".img:first-child").fadeOut(3000).next(".img").fadeIn(3000).end().appendTo("#show-case")
}, 4000);
	
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
function registration(aid){
	window.location.href ="registration.htm?aid="+aid;
}
function viewProject(aid) {
	window.location.href = "viewProjectDetails.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
function openWindow(aid) {
	//window.open("<?php echo base_url(); ?>admin/BankProjects/viewPrintAuction/"+aid);
	window.open("viewPrintAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}

function BigImage(){
	 $(document).ready(function(){
	      $('.imgSmile').animate({width: "500px"}, 'slow');
	      
	       $(".imgSmile").toggle(function()
	          {$(this).animate({width: "100px"}, 'slow');}, 
	          function()
	          {$(this).animate({width: "500px"}, 'slow');
	       });
	    });
	}
function viewImg(img) {
	
	var img1="./uploads/"+img;
	window.open(img1);
		
}

</script>

<div class="hits-counter">
<span>Hits : </span>
<!-- Start of StatCounter Code for Default Guide -->
<script type="text/javascript">
var sc_project=8463032; 
var sc_invisible=0; 
var sc_security="305bbac1"; 
var scJsHost = (("https:" == document.location.protocol) ? "https://secure." : "http://www.");
document.write("<sc"+"ript type='text/javascript' src='" + scJsHost + "statcounter.com/counter/counter.js'></"+"script>");
</script>
<noscript>
<div class="statcounter">
<!-- <a title="web counter" href="http://statcounter.com/free-hit-counter/" target="_blank"> -->
<img class="statcounter" src="https://c.statcounter.com/8463032/0/305bbac1/0/" alt="web counter">
<!-- </a> -->
</div></noscript>
<!-- End of StatCounter Code for Default Guide -->
</div>

