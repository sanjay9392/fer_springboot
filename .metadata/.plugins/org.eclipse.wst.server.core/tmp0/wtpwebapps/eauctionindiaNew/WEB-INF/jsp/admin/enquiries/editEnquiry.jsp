
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.zedapp.eauction.model.Executive"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="com.zedapp.eauction.model.Enquiry"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="java.util.List"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>

<head><title>Add Enquiry</title></head>
<body>

<c:url var="viewEnquiriesUrl" value="/enquiries.htm" />
<a href="enquiries.htm">Back</a>
<br></br>
<%
Enquiry enquiry = (Enquiry)request.getAttribute("enquiry");
%>
<center>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
		<!--edit page-->
			
		<div id="a">
			<div class="msg"></div>
				<c:url var="saveEnquiryUrl" value="/saveEnquiry.htm" />
				<form:form modelAttribute="enquiry" name="enquiryForm" method="POST" onsubmit="return validateForm()"  action="${saveEnquiryUrl}" id="enqfrm" >
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Enquiry Details <form:hidden  path="eid"/></th></tr>
			
			<span style="float: right; padding-top: 10px; padding-right: 10px; font-weight: normal">
			<span style="color: black; font-weight: normal; font-size: small;">
			<span style="color: #ff0000;"> *</span>
			Marked fields are Mandatory
			</span>
			</span> 
			
			<tr><td> Select Property For Auction<strong class="red">*</strong> </td><td>
			<form:select path="aid" onchange="showAuctionDetails()" class="MultiSelectOpt">
			<form:option value="0" label="--- Select ---"/>
			<%
				List<Auction> projectList=(List)request.getAttribute("auctionList");
				if(projectList!=null && projectList.size()>0){
					for(Auction auction:projectList){
					if(auction.getStatus().equals("P") ||auction.getStatus().equals("S") ){
					%>
						<form:option value="<%=auction.getAid() %>" label="<%= auction.getProject().getProjName() %>"/>
					<%}}
				}
				
				%>
   			</form:select>
			</td></tr>
			<tr><td><div class="auctionDetails"> 

				Select the auction for more details

				<input type='hidden' name='emdAmt' value='0' id='eid'>

			</div><td></tr>
			
			<tr><td>Enquirer name <strong class="red">*</strong> </td><td> <form:input path="name"/> </td></tr>
			<tr><td>EMail </td><td> <form:input path="email"/> </td></tr>
			<tr><td>Mobile<strong class="red">*</strong>  </td><td> <form:input path="mobile"/> </td></tr>
			<tr><td>Remarks </td><td> <form:textarea  path="remarks" rows="3" cols="100"/></td></tr>
			<%-- <tr><td>Enquired Date </td>
				<td> <input name="enquiryDt" id="enquiryDt" value="<%=enquiry.getEnquiryDt()%>"/> </td></tr>
			 --%>	
			<tr><td align='left'>Enquired Date  <strong class="red">*</strong> </td>
			<%-- <td align='left'> <input name="enquiryDtStr" id="enquiryDt" value="<%=enquiry.getEnquiryDt()%>"/> </td></tr> --%>
			<%if(enquiry.getExid()>0){ 
				System.out.println("Auction date is==>>"+enquiry.getEnquiryDt());
				Date date0= enquiry.getEnquiryDt();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String temp= df.format(date0);
				System.out.println("temp==>"+temp);
				
			%>
			<td align='left'> <input name="enquiryDtStr" id="enquiryDt" value="<%=temp%>"/> </td></tr>
			<%}else{ %>
			<td align='left'> <input name="enquiryDtStr" id="enquiryDt"/> </td></tr>
			<%} %>
			
				
				
				
                <tr><td> Select Enquiry Type </td><td>
				<form:select path="enquiryType">  <%-- class="MustSelectOpt" --%> 
				<form:option value="0">--Select One--</form:option>
				<form:option value="vlc">VLC</form:option>
				<form:option value="loan" >Boundary</form:option>
				<form:option value="openplot">Loan</form:option>
				<form:option value="pricehigh">Open Plot</form:option>
				<form:option value="ageofprop">Age Of Property</form:option>
				</form:select>
				</td></tr>
				<tr><td> Select Executive </td><td>
				<form:select path="exid" class="MultSelectOpt">
				<form:option value="0">--Select One--</form:option>
				<%
					List<Executive> executiveList=(List)request.getAttribute("executiveList");
					if(executiveList!=null && executiveList.size()>0){
						for(Executive executive:executiveList){%>
							<form:option value="<%=executive.getExid() %>" label="<%= executive.getExname() %>"/>
						<%}
					}
					
					%>
					</form:select>
				</td></tr>
				<tr><td>Response Given </td><td> <form:textarea path="responseGiven" rows="3" cols="100" /></td></tr>
				<tr><td>Interested In Property</td>
				<td>  
				<form:radiobutton path="propertyIntrested" value="Yes"/>YES 
				<form:radiobutton path="propertyIntrested" value="No"/>NO
				<form:radiobutton path="propertyIntrested" value="Dont Know"/>Dont Know
				</td>
				</tr>

				<tr><td>Interested In Location</td>
				<td>
				<form:radiobutton path="LocationIntrested" value="Yes"/>YES 
				<form:radiobutton path="LocationIntrested" value="No"/>NO
				<form:radiobutton path="LocationIntrested" value="Dont Know"/>Dont Know
				</td>
				</tr>

				<tr> 
				<td align="center" colspan="2"><input type="submit" id="save" value="Save"> &nbsp;&nbsp;</td>
				</tr>
			</table>
			</div>

			
			</form:form>
			</div>
			<!--edit page-->
		</div>
		</td>
		</tr>
</table>

</center>
<script type="text/javascript" src="script/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="script/jquery-ui-1.8.18.custom.min.js"></script>
<!--script type="text/javascript" src="script/jquery-1.5.1.min.js"></script -->
<script type="text/javascript" src="script/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	$.validator.addMethod("MultiSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, " You must select any Option.");

	
	/* $.validator.addMethod("MustSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, " You must select any Option.");
 */

	/* $.validator.addMethod("MultSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, " You must select any Option."); */
    $("#enqfrm").validate({
    	
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
    	name: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        //email: {required:true, email: true},
        mobile: {required:true, minlength:10, maxlength:100, accept:"[0-9-]+"}
        },
        messages: {
        	name: {required:"Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	//email: {required:"We need your email address to contact you", email: "Your email address must be in the format of name@domain.com"},
        	mobile: {required:"Mobile is required", minlength:"Mobile must be of atleast 10 digits", maxlength:"max 100 chars is allowed", accept:"Number is not valid"}
        }
    });
    
    $("#enquiryDt").datepicker({ dateFormat : 'yy-mm-dd' }); 
    

    
});
function validateForm() {
	if($("#enqfrm").valid()) {
		document.enqfrm.submit();
		return true;
	}
	return false;
}

function showAuctionDetails() {
	$(".auctionDetails").html("refreshing");
	var f = document.forms["enquiryForm"];
	var aid = f.aid.options[f.aid.options.selectedIndex].value;
	var urlStr = "/eauction/ajaxAuctionDetails.htm";
	//alert(aid);
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid,
		dataType: "json",
		error: function(req,error) {// alert("error="+error); 
			},
		success: function(data) {
			//alert(data.projName);
					$(".auctionDetails").html(data.auctionDetails);
					
					$("#payAmt").val($("#emd").val());
					$("#quotation").val($("#minBid").val());
				}
	});
}
jQuery(window).ready(function() {
	document.frm.name.focus();
	validateForm();
});

</script>
