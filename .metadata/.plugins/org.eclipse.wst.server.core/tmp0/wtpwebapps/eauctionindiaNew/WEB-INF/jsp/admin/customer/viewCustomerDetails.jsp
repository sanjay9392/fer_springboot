<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="com.zedapp.eauction.service.ProjectService"%>
<%@page import="com.zedapp.eauction.service.ProjectServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.eauction.model.Payment"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.service.CustomerService"%>
<%@page import="com.zedapp.eauction.service.CustomerServiceImpl"%>
<%@page import="java.util.List"%>
		
<c:url var="viewCustomerUrl" value="/customer.htm" />
<%-- <a href="${viewCustomerUrl}">Back</a> --%>
<a href="customer.htm">Back</a>
<br></br>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
		<!--edit page-->
			
		<div id="a">
			<div class="msg"></div>
		<table border="0">
		<tr><td valign="top">
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Participant Details </th></tr>
			<%
			Customer customer=(Customer)request.getAttribute("customer");
			BankProjects bankProjects=(BankProjects)request.getAttribute("bankProjects");
			String minBid = bankProjects.getMinBid();
			String emd = bankProjects.getEmd();
			String ddAmt = customer.getDdAmt();
		 
			%> 
			<tr><td>Property For Auction</td><td align="left"><%=  bankProjects.getProjName() %>
				</td></tr>
				<tr><td>Bidder name </td><td align="left"><%=customer.getCname()%></td></tr>
				<tr><td>Address </td><td align="left"> <%=customer.getAddr()%></td></tr>
				<tr><td>City </td><td align="left"><%=customer.getCity()%></td></tr>
				<tr><td>PIN Code </td><td align="left"> <%=customer.getPincode() %></td></tr>
				<tr><td>State </td><td align="left"> <%=customer.getState()%> </td></tr>
				<tr><td>Country </td><td align="left"><%=customer.getCountry()%> </td></tr>
				<tr><td>EMail </td><td align="left"> <%=customer.getEmail()%> </td></tr>
				<tr><td>Mobile </td><td align="left"> <%=customer.getMobile()%> </td></tr>
				
				<tr><th colspan=2>Know Your Customer(Self Attested)</th></tr>
				<tr><td>Bidder Photo</td><td align="left"> <%=((customer.getPhoto()!=null)? customer.getPhoto():"Not Available") %>
				<tr><td>Bidder Pan Card</td><td align="left"> <%=((customer.getPan()!=null)? customer.getPan():"Not Available")%>
				<tr><td>Bidder Proof</td><td align="left"> <%=((customer.getProof()!=null) ? customer.getProof(): "Not Available")%> 
				<tr><td>Tender Amount </td><td align="left"><%=MoneyUtil.displayMoney(minBid)%>/-</td></tr>
			</table>
			</div>
			
		</td><td valign="top">
			<div class="auctionDetails"> 
			<%
			 
			 if(bankProjects!=null){
			%>
				<%=bankProjects.getAuctionDetails()%>
				<%} %>
			</div>
			<table border="0">
				<tr><th colspan=2>Enter Payment Details </th></tr>
				
				<tr><td> EMD Payment </td>
				<td align="left"><%=MoneyUtil.displayMoney(emd)%>/-</td></tr>
				
				<tr><td> EMD Pay Date </td>
				<td align="left"> <%=customer.getPayDt() %> </td></tr>
				<tr><td> DD PO NO </td>
				<td align="left"> <%=customer.getDdNo() %></td></tr>
				<tr><td> DD PO Amt</td>
				<td align="left"> <%=MoneyUtil.displayMoney(ddAmt)%>/-</td></tr>
				<tr><td> DD PO Date</td>
				<td align="left"> <%=customer.getDdDt() %></td></tr>
				<tr><td> DD BankName</td>
				<td align="left"> <%=customer.getDdBank()%></td></tr>
				<tr><td> In Favour Of</td>
				<td align="left"> <%=customer.getInfavour()%></td></tr>

							
		</table>
		</td>
		</tr>
</table>
</div>
</div>
</td>
</tr>
</table>
<script type="text/javascript">
var $ = jQuery;
var f = document.forms["CustomerForm"];
var aid = f.aid.value;
$(document).ready(function() {
	//showAuctionDetails();
	
	//showRegistrationAuctionDetails();
});
function showAuctionDetails() {
					
	$(".auctionDetails").html("refreshing");
	var f = document.forms["CustomerForm"];
	var aid = f.aid.options[f.aid.options.selectedIndex].value;
	var urlStr = "/eauction/ajaxAuctionDetails.htm";
	//alert(aid);
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid,
		dataType: "json",
		error: function(req,error) { //alert("error="+error); 
			},
		success: function(data) {
			//alert(data.projName);
					$(".auctionDetails").html(data.auctionDetails);
					$("#payAmt").val(data.emd);
					$("#quotation").val(data.minBid);
				}
	});
}


function selectPaid() {
	var f = document.forms["CustomerForm"];
	var isPaid = 0;
	$("#payAmt").val(0);
	for(var x=0;x<f.paid.length;x++) {
		if(f.paid[x].checked) {
			isPaid = f.paid[x].value;
		}
	}
	if(isPaid>0) {
		$("#payAmt").val($("#emdAmt").val());
	}
}
function viewBigger(obj) {
	$("#"+obj).show();
}
function closePopupImg(obj) {
	$("#"+obj).hide();
}

function showPowerOfAttorneyForm() {
var f=document.forms["CustomerForm"];

if(f.custtype.options[f.custtype.options.selectedIndex].value==="PA"){
	$("#powerDiv").show();
}
else{
	$("#powerDiv").hide();
}
/*	$("#powerDiv").html("<div id='custDiv'></div>");
	var f = document.forms["CustomerForm"];
	var aid = f.aid.options[f.aid.options.selectedIndex].value;
	var urlStr = "<?php echo base_url(); ?>admin/Customers/ajaxAuctionDetails/"+aid;
	//alert(urlStr);
	$.ajax({
		type: "POST",
		url: urlStr,
		error: function(req,error) { alert("error="+error); },
		success: function(data) {
					$(".auctionDetails").html(data);
					$("#payAmt").val($("#emdAmt").val());*/
				
	      }
	//});
	//}
</script>
<script type="text/javascript">
var $ = jQuery;
function chkAvailability(){
	//alert("function called");
	var f = document.forms["CustomerForm"];
	
	var cname = $("#uname").val();
	//alert(cname);
	ajaxgetUserDetails(cname);
}
function ajaxgetUserDetails(cname){
	//alert(cname);
	var urlStr =  "/eauction/ajaxCheckUserAvail.htm";
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "cname="+cname,
		dataType: "json",
		error: function(req,status, error) { alert("error="+error); },

		success: function(data) {
			//alert(data);
			var respUser = data;
			if(respUser && respUser.userId>0) { //data.length>0){
				//alert("user already exist");
				$("#avail").html("<b><font color='red'>user name already exists</font></b>");
			} else {
				$("#avail").html("<b><font color ='green'>user name available</font></b>");
			}
		}
	});
}

</script>
