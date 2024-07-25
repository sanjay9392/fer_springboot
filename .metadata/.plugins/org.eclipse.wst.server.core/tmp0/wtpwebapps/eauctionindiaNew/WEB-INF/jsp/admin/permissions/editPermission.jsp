<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="com.zedapp.eauction.model.Role"%><html>
<%@page import="java.util.List"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<head><title>Add Role</title></head>
<body>

<c:url var="viewPermissionsUrl" value="/permissions.htm" />
<a href="permissions.htm">Back</a>
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
				<c:url var="savePermUrl" value="/savePermission.htm" />
				<form:form modelAttribute="permission" method="POST" action="${savePermUrl}" onsubmit=" return validateForm()" id="permissionForm">
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Permission Details <form:hidden  path="pid"/></th></tr>
			
			<tr><td>Permission name <strong class="red">*</strong> </td><td> <form:input path="pname"/> </td></tr>
			<tr><td>Description </td><td> <form:input path="pdescr"/> </td></tr>
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

<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	
    $("#permissionForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
    	pname: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
        },
        messages: {
        	pname: {required:"Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"}
        }
    });

});
function validateForm() {
	if($("#permissionForm").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}

jQuery(document).ready(function() {
	document.frm.pname.focus();
	validateForm();
});

</script>







