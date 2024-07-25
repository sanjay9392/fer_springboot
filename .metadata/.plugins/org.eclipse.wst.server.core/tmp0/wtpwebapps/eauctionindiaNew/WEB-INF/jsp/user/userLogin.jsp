<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>

<%
	User user = (User) session.getAttribute("loginUser");
	//System.out.println("user = "+user);
	if (user != null) {
		
		System.out.println("user==>"+user);
	%>
		<table><tr></tr>
		<tr><tr><td>
		<br></br>
		<div class="login-div">
		<div class="login section-title">LogIn</div>
		<div class="fprocessDiv">Your Logged In<br></br>
		<a href="userHome.htm">Go To Bidding</a>
	</div>
	
</div>
</td>
</tr>
</table>
	<%}else{ %>



<table><tr></tr>
	
	<tr><tr><td>
	<br></br>
<div class="login-div" >
	<div class="login section-title">Login</div>
	<div class="fprocessDiv">
	
	</div>
	<c:url var="loginUrl" value="/login.htm" />	
	<form:form modelAttribute="user" method="POST" action="${loginUrl}" onsubmit="return validateForm()" id="userForm" name="userForm"  >	
	<table border="0">
	<tr></tr>
	<tr></tr>
	<tr></tr>
	<tr></tr>
	<tr><th>Username</th><td><form:input path="userName" /> </td></tr>
	<tr><th>Password</th><td><form:password path="password"/> </td></tr>
	<tr><td></td><td>
		<form:select path="userType" id="userType">
		<form:option value="C" label="Participant"/>
		<form:option value="B" label="Banker"/>
		</form:select>
		</td></tr>
	<tr><td colspan="2">
	<%
		HttpSession sess=request.getSession(true);
		String message=(String)sess.getAttribute("errorMsg") ;
		System.out.println("In Jsp :userLogin "+message);
	    if(message!=null){
	%>
	<font color="red"><%=message %></font>
	<%
	//sess.invalidate();
	    } %>
	</td></tr>
	<tr></tr>
	<tr><td colspan="2"> <a href="javascript:;">Terms & Conditions</a> <br>
			<input type="hidden" name="channel" value="O">
			<input type="submit" value="Login" class="button2"/> </td></tr>
			
	</table>
	</td></tr></table>
	</form:form>
</div>
<%} %>	




<script type="text/javascript">
var $ = jQuery;


	  
$(document).ready(function() {
    $("#userForm").validate({
    	
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
	if($("#userForm").valid()) {
		document.userForm.submit();
		return true;
	}
	return false;
}

jQuery(document).ready(function() {
	document.userForm.userName.focus();
	//validateForm();
});
</script>

<script type="text/javascript">
function login() {
	//alert("login page");
	var f = document.forms["userForm"];
	var utype = f.utype.options[f.utype.options.selectedIndex].value;
	alert(utype);
	if(utype=="C") {
		/* f.action = "<?php echo base_url();?>Pages/login";
 */	}
	if(utype=="B") {
	/* 	f.action = "<?php echo base_url();?>admin/verifylogin/check_user"; */
	}
	f.submit();
}

</script>


