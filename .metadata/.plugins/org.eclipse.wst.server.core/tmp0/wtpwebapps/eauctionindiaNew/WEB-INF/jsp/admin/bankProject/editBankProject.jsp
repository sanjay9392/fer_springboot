<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Bankers"%>
<%@page import="org.springframework.core.convert.support.PropertyTypeDescriptor"%><html>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="java.util.List"%>
<head><title>Add Project</title></head>
<body>
<style type="text/css">
.success-msg {
	font-weight: bold;
	color: green;
}
</style>
<div class="msg">
<%-- <%
if(request.getAttribute("errorMsg")!=null) {
	out.println("<div class='errorMsg'>"+request.getAttribute("errorMsg")+"</div>");
}else
	out.println("<div >file size not Huge</div>");
if(request.getAttribute("successMsg")!=null) {
	out.println("<div class='successMsg'>"+request.getAttribute("successMsg")+"</div>");
}
%> --%>
</div>
<c:url var="viewProjectUrl" value="/project.htm" />
<a href="project.htm">Back</a>
<span style="float: right; padding-top: 10px; padding-right: 10px; font-weight: normal">
			<span style="color: black; font-weight: normal; font-size: small;">
			<span style="color: #ff0000;"> *</span>
			Marked fields are Mandatory
			</span>
			</span>
<br></br>

<center>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
		<!--edit page-->
		<%
			BankProjects projects=(BankProjects)request.getAttribute("project");
		System.out.println("projects==>"+projects);
		%>	
		
		<div id="a">
			<div class="msg"></div>
				<c:url var="saveProjectUrl" value="/saveProject.htm" />
				<form:form modelAttribute="project" method="POST" action="${saveProjectUrl}" enctype="multipart/form-data"  id="prform" onsubmit="return validateForm()">
			<div class="table">
			<table>
			<tr><td valign="top">
			<table border="0">
			<tr><th colspan=2>Enter Bank Projects Details <form:hidden  path="pid"/></th></tr>
			
			<tr>
			<td align='left'>Select Bank</td>
				<td><form:select path="bid" class="MultiSelectOpt">
				<option value="0">None</option>
				<%
			List<Bankers> bankers=(List)request.getAttribute("bankers");
			if(bankers!=null && bankers.size()>0){
				for(Bankers banker:bankers){%>
					<form:option value="<%=banker.getBid() %>" label="<%= banker.getBankName() %>"/>
				<%}
			}
			
			%>
   			</form:select>
			</td></tr>
			<tr><td align='left'>Project Name <strong class="red">*</strong> </td>
			<td align='left'> <form:input path="projName"/> </td></tr>
			<tr><td align='left'>Project Code <strong class="red">*</strong> </td>
			<td align='left'> <form:input path="projCode"/> </td></tr>
			<tr><td align='left'>Borrower Name <strong class="red">*</strong> </td>
			<td align='left'> <form:input path="borrowerName"/> </td></tr>
			<tr><td align='left'>Co-Borrower Name </td>
			<td align='left'> <form:input path="coborrowerName"/> </td></tr>
			<tr><td align='left'>Borrower Address </td>
			<td align='left'> <form:input path="borrowerAddress"/> </td></tr>
			<tr><td align='left'>Co-Borrower Address </td>
			<td align='left'> <form:input path="coborrowerAddress"/> </td></tr>
			<tr><td align='left'>Property Address<strong class="red">*</strong> </td>
			<td align='left'><form:input path="propertyAddress" id="propertyAddress"/> </td></tr>
			<tr><td align='left'>Address In Map<strong class="red">*</strong> </td>
			<td align='left'><form:input path="addrForGMap" id="addrForGMap" onblur="showByAddress()"/> </td></tr>
			<tr><td align='left'>Property Area <strong class="red">*</strong> </td>
			<td align='left'> <form:input path="propertyArea"/> </td></tr>
			
			
			<tr><td align='left'> Select Property City <strong class="red">*</strong></td>
			<td><form:select path="propertyCity" class="MustSelectOpt">
			    <form:option value="0" label="-Select-"/>
			    <form:option value="Hyderabad" label="Hyderabad"/>
			    <form:option value="Bangalore" label="Bangalore"/>
			    <form:option value="Pune" label="Pune"/>
			    <form:option value="Vijayawada" label="Vijayawada"/>
			    <form:option value="Mumbai" label="Mumbai"/>
				
			</form:select></td>
			</tr>
			<tr><td align='left'>Auction Date <strong class="red">*</strong> </td>
			<%if(projects.getPid()>0){ 
				System.out.println("Auction date is==>>"+projects.getAuctionDate());
			%>
			<td align='left'> <input name="auctionDate1" id="aucDate" value="<%=projects.getAuctionDate() %>"/> </td></tr>
			<%}else{ %>
			<td align='left'> <input name="auctionDate1" id="aucDate"/> </td></tr>
			<%} %>
			
			<tr><td align='left'>Inspection Date  <strong class="red">*</strong> </td>
			<%if(projects.getPid()>0){ 
				System.out.println("Inspection Date==>>"+projects.getInspectionDt());
			%>
			<td align='left'> <input name="InspectionDate1" id="inspDate" value="<%=projects.getInspectionDt() %>"/> </td></tr>
			<%}else{ %>
			<td align='left'> <input name="InspectionDate1" id="inspDate"/> </td></tr>
			<%} %>  
			
						
			<tr><td align='left'>Reserve Price<strong class="red">*</strong> </td>
			<td align='left'> <form:input path="minBid"/> </td></tr>
			<tr><td align='left'>Participant EMD  </td>
			<td align='left'> <form:input path="emd"/> </td></tr>
			
			<tr><td>Amount for Interse bid  </td>
			<td> <form:input path="maxBidDiff"/> </td></tr>
			<tr><td align='left'> Select Property Type</td>		
			<td><form:select path="propertyType" class="MustSelectOpt">
			    <form:option value="0" label="None"/>
			    <form:option value="flat" label="Flat"/>
			    <form:option value="house" label="House"/>
			    <form:option value="land" label="Land"/>
			    <form:option value="plot" label="Plot"/>
				
			</form:select></td>
			<tr><td align='left'>Property Image</td><td align='left'><form:input path="upfile" type="file"/></td></tr>
			<tr><td align='left'>Advertisement Image</td><td align='left'><form:input path="upfile1" type="file"/></td></tr>
	 		<%
	 		
     		String message =(String)session.getAttribute("errorMsg") ;
			System.out.println("In Jsp :adminLogin "+message);
			if(message!=null){
			%>
			<div class='errorMsg'><%=message %></div>
			<%} %>
			
			<tr><td align='left'> Select AO</td><td align='left'>
			<form:select path="aoid" class="MultSelectOpt">
			<form:option value="0">None</form:option>
			<%
			List<User> aoList=(List)request.getAttribute("aoList");
			if(aoList!=null && aoList.size()>0){
				for(User user:aoList){%>
					<form:option value="<%=user.getUserId() %>" label="<%= user.getUserName() %>"/>
				<%}
			}
			
			%>
   			</form:select>
			</td></tr>
			<tr><td align='left'>Contact No <strong class="red">*</strong> </td>
			<td align='left'> <form:input path="contactsNos"/> </td></tr>
			<tr> 
				<td align="center" colspan="2"><input type="submit" id="save" value="Save"> &nbsp;&nbsp;</td>
				</tr>
			</table>
			</td>
			
			<td valign="top">
				<table>
				<tr><th>Google Map</th></tr>
				<tr><td>
				Property Address:
				<div class="propAddress"></div>
				<div class="gmap" id="gmap">
				</div>
				</td></tr>
				</table>
			</td></tr>
			</table>
			
			</div>

			
			</form:form>
			</div>
		</td>
		</tr>
</table>
</center>
<style type="text/css">
input[type="text"] {
	width: 250px;
}
.gmap {
	width: 350px;
	height: 350px;
	border: 1px solid #000;
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
	if(address.length==0) address = "Hyderabad";
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
</script>

<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	
	
	$.validator.addMethod("MultiSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, "<br/> You must select any Option.");

	
	$.validator.addMethod("MustSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, "<br/> You must select any Option.");

	$.validator.addMethod("MultSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, "<br/> You must select any Option.");



	
    $("#prform").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
        	projName: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        	projCode: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        	borrowerName: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        	/* coborrowerName: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        	borrowerAddress:{required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        	coborrowerAddress:{required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"}, */
        	propertyAddress:{required:true, minlength:3, maxlength:1000},
        	/* minBid:{required:true,  maxlength:100, accept:"[0-9 ]+"},
        	maxBidDiff:{required:true,  maxlength:100, accept:"[0-9 ]+"}, */
        	//emd:{required:true,  maxlength:100, accept:"[0-9 ]+"},
        	contactsNos:{required:true, minlength:10, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        },
        messages: {
        	
        	projName: {required:"<br/> Project required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	projCode: {required:"<br/> Code required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Code is not valid"},
        	borrowerName: {required:"<br/> Borrower Name required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	/* coborrowerName: {required:"<br/> CoBorrower Name required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	borrowerAddress: {required:"<br/>Borrower Address required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	coborrowerAddress: {required:"<br/> Address Name required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"}, */
        	propertyAddress: {required:"<br/> Property Address required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed"},
        	/* minBid: {required:"<br/> Reserve Price  required",  maxlength:"max 100 chars is allowed", accept:"Amount is not valid"},
           	maxBidDiff: {required:"<br/> Interse bid  Price  required",  maxlength:"max 100 chars is allowed", accept:"Amount is not valid"},
        	 *///emd: {required:"<br/> Emd Price  required",  maxlength:"max 100 chars is allowed", accept:"Amount is not valid"},
        	contactsNos: {required:"<br/> Number required", minlength:"Number must be of atleast 10 chars", maxlength:"max 100 chars is allowed", accept:"Number is not valid"},
        
           
        }
    });

});
function validateForm() {
	if($("#prform").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}

/*
jQuery(document).ready(function() {
	document.frm.projName.focus();
	validateForm();
});*/

</script>
