<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.service.ExecutivesService"%>
<%@page import="com.zedapp.eauction.service.ExecutivesServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Executive"%><html>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="java.util.List"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<head><title>Add Executives</title></head>
<body>
<c:url var="viewExecutiveUrl" value="/executive.htm" />
<a href="${viewExecutiveUrl}">Back</a>
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
				<c:url var="saveExecutiveUrl" value="/saveExecutive.htm" />
				<form:form modelAttribute="executive" method="POST" action="${saveExecutiveUrl}" onsubmit="return validateForm()" id="executiveForm" >
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Executive Details <form:hidden  path="exid"/></th></tr>
			<tr><td>Executive Name <strong class="red">*</strong> </td><td> 
			<form:input path="exname"/> </td></tr>
			<tr><td>Email</td>
			<td> <form:input path="email"/> </td></tr>
			<tr><td>Mobile<strong class="red">*</strong></td>
			<td> <form:input path="mobile"/> </td></tr>
			<tr><td>Status <strong class="red">*</strong>
			<td> <form:checkbox value="A" path="status" /> </td></tr>
			
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
	
    $("#executiveForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
        exname: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
         mobile:{required:true, minlength:10, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
       
        },
        messages: {
        	
            exname: {required:"Name required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
          	mobile: {required:"Password  required", minlength:"Mobile must be of atleast 10 chars", maxlength:"max 100 chars is allowed", accept:"Mobile Number is not valid"}
        	
        }
    });

});
function validateForm() {
	if($("#executiveForm").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}


jQuery(document).ready(function() {
	document.frm.exname.focus();
	validateForm();
});

</script>