<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.service.SmsTemplateService"%>
<%@page import="com.zedapp.eauction.service.SmsTemplateServiceImpl"%>
<%@page import="com.zedapp.eauction.model.SmsTemplate"%><html>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<head><title>Add Sms Settings</title></head>
<body>
<c:url var="viewSmsSettingsUrl" value="/smsSettings.htm" />
<a href="${viewSmsSettingsUrl}">Back</a>
<br></br>
<center>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
			
		<div id="a">
			<div class="msg"></div>
				<c:url var="saveSmsSettingsUrl" value="/saveSmsSettings.htm" />
				<form:form modelAttribute="smsSettings" method="POST" action="${saveSmsSettingsUrl}" onsubmit="return validateForm()" id="smsSettingsForm">
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Sms Settings Details <form:hidden  path="sid"/></th></tr>
			<tr><td>Sms Url <strong class="red">*</strong> </td>
			<td> <form:textarea  path="smsUrl" rows="5" cols="30"/></td></tr>
			<tr><td>Sms Username <strong class="red">*</strong> </td>
			<td> <form:input path="uname" rows="5" cols="30"/></td></tr>
			<tr><td>Sms Password <strong class="red">*</strong> </td>
			<td> <form:input type="password" path="pwd" rows="5" cols="30"/></td></tr>
			<tr><td>Sms Sender <strong class="red">*</strong> </td>
			<td> <form:input path="senderId" rows="5" cols="30"/></td></tr>
			
			
		    <tr><td>Status</td>
		    <td><form:checkbox value="A" path="status"/></td>
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
	
    $("#smsSettingsForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
    	smsUrl: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        uname: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        pwd: {required:true, minlength:2, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        senderId:{required:true, minlength:2, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
        },
        messages: {
        	smsUrl: {required:"Url is required", minlength:"Url must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:" Url is not valid"},
            uname: {required:"Name required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	pwd: {required:"Password  required", minlength:"Password must be of atleast 2 chars", maxlength:"max 100 chars is allowed", accept:"Password is not valid"},
        	senderId:{required:"Sender  required", minlength:"Sender must be of atleast 2 chars", maxlength:"max 100 chars is allowed", accept:"Sender is not valid"}
        }
    });

});
function validateForm() {
	if($("#smsSettingsForm").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}


jQuery(document).ready(function() {
	document.frm.smsUrl.focus();
	validateForm();
});
</script>


