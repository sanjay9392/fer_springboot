<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.service.SmsTemplateService"%>
<%@page import="com.zedapp.eauction.service.SmsTemplateServiceImpl"%>
<%@page import="com.zedapp.eauction.model.SmsTemplate"%><html>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<head><title>Add Sms Template</title></head>
<body>
<c:url var="viewSmsTemplateUrl" value="/smsTemplate.htm" />
<a href="${viewSmsTemplateUrl}">Back</a>
<br></br>
<%--
while(i.hasNext()){
SmsTemplate id=(SmsTemplate)i.next();
int tid=id.getTid();
String selected = "";
--%>

<%--
List l=(List)request.getAttribute("smsTemplate");
if(l!=null &&l.size()>0){
Iterator i=l.iterator();
int cc=0;
while(i.hasNext())
{
	
	SmsTemplate id=(SmsTemplate)i.next();
	++cc;	
int tid=id.getTid();
String selected = "";
String type=id.getType();
String template=id.getTemplates();
String clasStr="odd";
if(cc%2==0) clasStr="even";
--%>



<center>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
			
		<div id="a">
			<div class="msg"></div>
				<c:url var="saveSmsTemplateUrl" value="/saveSmsTemplate.htm" />
				<form:form modelAttribute="smsTemplate" method="POST" action="${saveSmsTemplateUrl}" onsubmit="return validateForm()" id="smsTemplateForm">
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Sms Template Details <form:hidden  path="tid"/></th></tr>
			<tr><td> Select Type</td><td>		
			<form:select path="type">
			    <option value="C">For Customer</option>
				<option value="B">For Banker</option>
				<option value="O">Other</option>
			</form:select></td>
			<tr><td>Template <strong class="red">*</strong> </td>
			<td> <form:textarea  path="templates" rows="5" cols="30"/></td></tr>
<%-- 		  <tr><td>Status<input type="checkbox" value="<%=id.getTid()%>" <%=selected%>/><%=id.getStatus()%></td>
<%
}
}
%>--%>				<tr><td> Status </td>
							<td> <form:checkbox value="A" path="status" /> </td></tr>
		    <td align="center" colspan="2"><input type="submit" id="save" value="Save"> &nbsp;&nbsp;</td>
			</table>
			</div>
             <div class="sms-info">
				Use the following codes in SMS template:
				<table>
				<tr><th>Code</th><th>Description</th></tr>
				<tr><th>OTP_CODE</th><td>One Time Password Code</td></tr>
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
	
    $("#smsTemplateForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
    	templates: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
         //   descr: {required:true, minlength:2, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
        },
        messages: {
        	templates: {required:"Template is required", minlength:"Template must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Template is not valid"}
         //   descr: {required:"Description required", minlength:"Description must be of atleast 2 chars", maxlength:"max 100 chars is allowed", accept:"Description is not valid"}
        }
    });

});
function validateForm() {
	if($("#smsTemplateForm").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}

jQuery(document).ready(function() {
	document.frm.templates.focus();
	validateForm();
});
</script>



