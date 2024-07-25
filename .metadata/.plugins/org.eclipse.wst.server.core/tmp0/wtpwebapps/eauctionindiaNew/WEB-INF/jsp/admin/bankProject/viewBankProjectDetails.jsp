<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>

<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.Borrower"%>
<%@page import="org.springframework.core.convert.support.PropertyTypeDescriptor"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="java.util.List"%>

<%

Auction auction=(Auction)request.getAttribute("auction");
Borrower borrower=(Borrower)request.getAttribute("borrower");
%>
<html>
<head><title>View Project</title></head>
<body>

<br></br>

<center>
<form:form modelAttribute="project" method="POST"  enctype="multipart/form-data"  id="prform" onsubmit="return validateForm()">
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
		<!--edit page-->
			
		<div id="a">
			<div class="msg"></div>
				
			<div class="table">
			<table>
			<tr><td valign="top">
			<table  border="1" cellspacing="0" cellpadding="4">
			<tr><th class="pad5" colspan=2>Bank Project Details </th></tr>
			
			
			<% BankProjects project=(BankProjects)request.getAttribute("project");
			   String minBid = project.getMinBid();
			   String emd = project.getEmd();
			%>
			<tr><td class="pad5" style="width: 130px">Project Name  </td>
			<td> <%=project.getProjName() %> </td></tr>
			<tr><td>Project Code  </td>
			<td> <%=project.getProjCode() %> </td></tr>
			<tr><td>Borrower Name  </td>
			<td> <%=borrower.getBorrowerName() %> </td></tr>
			<tr><td>Co-Borrower Name </td>
			<td><%=borrower.getCoborrowerName() %></td></tr>
			<tr><td>Borrower Address </td>
			<td> <%=borrower.getBorrowerAddress() %> </td></tr>
			<tr><td>Co-Borrower Address </td>
			<td> <%=borrower.getCoborrowerAddress() %> </td></tr>
			<tr><td>Property Address </td>
			<td><%=borrower.getPropertyAddress() %> <input type="hidden" name="propertyAddress" id="propertyAddress" value="<%=borrower.getPropertyAddress() %>"> </td></tr>
			<tr><td>Auction Date </td>
			<td> <%=auction.getAuctionDate() %> </td></tr>
			<tr><td>Reserve Price</td>
			<td> Rs.<%=MoneyUtil.displayMoney(minBid) %> </td></tr>
			<tr><td>Participant EMD </td>
			<td> <%=MoneyUtil.displayMoney(emd) %> </td></tr>
			
			<tr><td>Amount for Interse bid </td>
			<td> <%=project.getMinBidDiff() %> </td></tr>
			<tr><td> Property Type</td>		
			<td><%=project.getPropertyType() %></td>
			<tr><td>Property Image</td><td width='150' class='auction-image'> <a href="javascript:viewImg('<%=project.getPropertyImage() %>')"><img src='./uploads/<%=project.getPropertyImage() %>' width='100' height='100' alt='Auction Image' id="<%=borrower.getPropertyAddress() %>"></a></td></tr>
			<tr><td> AO Name</td><td>
			<%=auction.getAoBankerName() %>
			</td></tr>
			<tr><td>Contact No  </td>
			<td> <%=auction.getContactsNos() %></td></tr>
			
			</table>
			</td>
			
			<td valign="top">
				<table>
				<tr><th>Google Map</th></tr>
				<tr><td>
				Property Address:</td></tr>
				<tr><td ><div class="propAddress" style="height: 80px; width: 500px"></div>
					<input type="hidden" id="addrForGMap" name="addrForGMap" value="<%=project.getAddrForGMap() %>">
					</td></tr>
				<tr><td><div class="gmap" id="gmap">
				</div>
				</td></tr>
				</table>
			</td></tr>
			</table>
			
			</div>
			
			
			</div>
		</div>
		</td>
		</tr>
</table>
</center>
</form:form>
<style type="text/css">
input[type="text"] {
	width: 250px;
}
.gmap {
	width: 350px;
	height: 350px;
	border: 1px solid #000;
}
.pad5, td{
padding: 5px;


}
</style>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDm3Qcv-WvSkahV0HXEEYiGHcv8z5HzgJ8&sensor=false">
</script>
<script type="text/javascript">
var geocoder;
var map;
var infowindow = new google.maps.InfoWindow();
var marker;
var $ = jQuery;
$(document).ready(function() {
	geocoder = new google.maps.Geocoder();
	var mapOptions = {
          center: new google.maps.LatLng(0, 0),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
	map = new google.maps.Map(document.getElementById("gmap"), mapOptions);
	showByAddress();
});
function showByAddress() {
	
	var address = document.getElementById('addrForGMap').value;
	if(address.length==0) address ="Hyderabad";
	//alert(address);
	$(".propAddress").html(address);
	geocoder.geocode( { 'address': address}, function(results, status) {
	  if (status == google.maps.GeocoderStatus.OK) {
		map.setCenter(results[0].geometry.location);
		map.setZoom(11);
		var marker = new google.maps.Marker({
			map: map,
			position: results[0].geometry.location
		});
		infowindow.setContent(results[0].formatted_address);
		infowindow.open(map, marker);
	  } else {
		alert('Geocode was not successful for the following reason: ' + status);
	  }
	});
}

function viewImg(img) {
	
	var img1="./uploads/"+img;
	window.open(img1);
		
}

</script>

