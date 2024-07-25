<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@page import="com.zedapp.eauction.model.User"%><html>

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
	<%
		User user=(User)request.getAttribute("user");
		System.out.println("otpcode Login:"+user.getUserName());
	%>
			
			<h2>Enter OTP</h2>
			<div id="fm_error"></div>
			<c:url var="otpCode" value="/checkOtp.htm" />
			<form:form modelAttribute="user" method="POST" action="${otpCode}" onsubmit="return validateForm()" >
			<!-- < form : hidden path = "userId" value = " $ { user . userId } " />  -->
			<input type="hidden" name="userId" value="<%=user.getUserId() %>"/>
			OTP Code:
			<form:input path="otpCode" />
			<br/>
			<%
			String message=(String)request.getAttribute("msg") ;
			System.out.println("In Jsp:otpCode: "+message);
			if(message!=null){
			%>
			<font color="red"><%=message %></font>
			<br/>
			<%} %>
			<input type="submit" value="Login" class="button2"/>
			</form:form>
			<p class="forgot_pwd" ><a href="sendOTP.htm?cmd='send'&userId=<%=user.getUserId() %>">Resend OTP</a></p>

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
	document.adminForm.userName.focus();
	//validateForm();
});
</script>
