<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@page import="com.zedapp.eauction.model.User"%><html>

<%
	User user=(User)request.getAttribute("user");
	System.out.println("otpcode Login===frm usre:"+user.getUserName());
	System.out.println("Otpcode for users");
%>
			
<h2>Enter OTP</h2>
<div id="fm_error"></div>
<c:url var="otpCode" value="/checkOtpForUser.htm" />
<form:form modelAttribute="user" method="POST" action="${otpCode}" onsubmit="return validateForm()" >

<!-- < form : hidden path = "userId" value = " $ { user . userId } " />  -->
			<input type="hidden" name="userId" value="<%=user.getUserId() %>"/>
OTP Code:
<form:input path="otpCode" />
<br/>
<%
String message=(String)request.getAttribute("msg") ;
System.out.println("In Jsp :"+message);
if(message!=null){
%>
<font color="red"><%=message %></font>
<br/>
<%} %>
<input type="submit" value="Login" class="button2"/>
</form:form>
<p class="forgot_pwd" ><a href="sendOTPU.htm?cmd='send'&userId=<%=user.getUserId() %>">Resend OTP</a></p>

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
	document.forms[0].userName.focus()
	//document.adminForm.userName.focus();
	//validateForm();
});
</script>

