<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" href="css/admin/css/mystyles.css" type="text/css" media="screen" />
<div id="wrapper">
	<div id="header">
		<div id="header-top">
			<h1> <span> <img src="images/header2.jpg" width="320px" height="59px" class="mainhead"/> </span>
		 </h1>
		</div>
		<div id="navigation">
			<ul class="menu">
			</ul>
		</div>
	</div>
	<div id="admin-content">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr><td>
		<div id="content-left"></div>
		</td><td>
		<div id="content-right">

			<div style = "color:red" >
			<h2>Login</h2>
			</div>
			<div id="fm_error"></div>
	<c:url var="loginUrl" value="/login.htm" />
	<form:form modelAttribute="user" method="POST" action="${loginUrl}" onsubmit="return validateForm()" id="adminForm">
	<table>
	<tr><td>
	UserName:</td><td>
	<form:input path="userName" size="20"/></td>
	</tr><tr><td>
	Password:</td><td>
	<form:password path="password" size="20"/></td>
	</tr>
	<tr><td colspan="2">
	<%
	String message=(String)session.getAttribute("errorMsg") ;
	System.out.println("In Jsp :adminLogin "+message);
	if(message!=null){
	%>
	
	<font color="red"><%=message %></font>
	<%} %>
	</td></tr>
	<tr><td></td>
			<td>
			<input type="submit" value="Login" class="button2"/>
			</td></tr>
			</table>
</form:form>
			
			<p class="forgot_pwd" ><a href="">Forgot Password Click Here</a></p>

		</div>
		</td></tr>
	</table>
	</div>
	<div id="footer">
		<div id="footer-top"></div>
		<div id="footer-bottom"></div>
	</div>
</div>
<script type="text/javascript">
var $ = jQuery;
	  
$(document).ready(function() {
    $("#adminForm").validate({
    	
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
        	
        userName: {required:true, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        password: {required:true,  maxlength:100, accept:"[a-zA-Z0-9_!~@#$%^&*]+"}
        },
        messages: {
        userName: {required:"<br/>Name is required", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        password: {required:"<br/>Password is required",  maxlength:"max 100 chars is allowed", accept:"Password is not valid"}
        }
    });

});
function validateForm() {
	if($("#adminForm").valid()) {
		document.adminForm.submit();
		return true;
	}
	return false;
}

jQuery(document).ready(function() {
	document.frm.userName.focus();
	validateForm();
});
</script>
