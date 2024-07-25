<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.service.ProjectService"%>
<%@page import="com.zedapp.eauction.service.ProjectServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Bankers"%><html>
<%@page import="com.zedapp.eauction.model.Auction"%><html>
<%@page import="java.util.List"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<html>
<head><title>Add Bankers</title></head>
<body>
<c:url var="viewBankersUrl" value="/bankers.htm" />
<a href="bankers.htm">Back</a>
<br></br>
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
				<c:url var="saveBankersUrl" value="/saveBankers.htm" />
				<form:form modelAttribute="bankers" method="POST"  onsubmit="return validateForm()" action="${saveBankersUrl}"   id="bankersForm">
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Bankers Details <form:hidden  path="bid"/></th></tr>
			<tr><td align='left'>Bank Name <strong class="red">*</strong> </td><td align='left'> 
			<form:input path="bankName"/> </td></tr>
			<tr><td align='left'>Address <strong class="red">*</strong></td>
			<td align='left'> <form:textarea path="addr"/> </td></tr>
			<tr><td align='left'>Street</td>
			<td align='left'> <form:input path="street"/> </td></tr>
			<tr><td align='left'>City  </td>
			<td align='left'> <form:input  path="city"/></td></tr>
			<tr><td align='left'>State </td>
			<td align='left'> <form:input  path="state"/></td></tr>
			<tr><td align='left'>Pincode  </td>
			<td align='left'> <form:input  path="pincode"/></td></tr>
			<tr><td align='left'>Country </td>
			<td align='left'> <form:input  path="country"/></td></tr>
			<tr><td> Registered </td>
							<td> <form:checkbox value="Y" path="registered" /> </td></tr>
			<td align="center" colspan="2"><input type="submit" id="save" value="Save"> &nbsp;&nbsp;</td>
			
			
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


<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	
    $("#bankersForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
    	bankName: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
    	addr: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
    	},
        messages: {
        	bankName: {required:"Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	addr: {required:"Address is required", minlength:"Address must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Address is not valid"}
        	
        }
    });

});

function validateForm() {
	if($("#bankersForm").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}

jQuery(document).ready(function() {
	document.frm.bankName.focus();
	validateForm();
});
</script>

