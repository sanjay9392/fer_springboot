<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="java.util.List"%>
<style type="text/css">
.success-msg {
	font-weight: bold;
	color: green;
}
</style>
<div class="msg">
<%
if(request.getAttribute("errorMsg")!=null) {
	out.println("<div class='errorMsg'>"+request.getAttribute("errorMsg")+"</div>");
}
if(request.getAttribute("successMsg")!=null) {
	out.println("<div class='successMsg'>"+request.getAttribute("successMsg")+"</div>");
}
%>
</div>
<c:url var="saveUserProfileUrl" value="/userProfileSave.htm" />
<form:form modelAttribute="user" method="POST" action="${saveUserProfileUrl}" onsubmit="return validateForm()">
<div class="editTable">
<table border="0">
<tr><td>
<%
/*String msg = (String)request.getAttribute("resultMsg");
if(msg!=null && msg.trim().length()>0) {
	out.println("<div class='successMsg'>"+msg+"</div>");
}*/
%>
</td></tr>
<tr><td valign='top'>
<table width="300">
<%/*  User user=(User) request.getAttribute("user");
	String uType=user.getUserType();
if(uType.equals("A"))
	uType="Admin";
if(uType.equals("AO"))
	uType="AO-Banker";
if(uType.equals("B"))
	uType="Banker"; 
	
 if(uType.equals("C"))
			uType="Participant";
 */
  //User user=null;
User user = (User)request.getAttribute("userProf");
//if(request.getSession().getAttribute("loginUser")!=null)
	//user = (User)request.getSession().getAttribute("loginUser");
int userId = user.getUserId();
String uType = user.getUserType();
if(uType.equals("C"))
	uType="Participant";

%>
	<tr><th colspan=2>Profile Details <form:hidden value="<%=user.getUserId() %>" path="userId"/> </th></tr> 
	<%-- <tr><td align="left">Role</td><td align="left"><form:hidden path="userType" vlaue="<%=user.getUserType() %>"/><%=uType %></td></tr>
	<tr><td align="left">Bank</td><td align="left"><form:hidden path="bid" value="<%=user.getBid() %>"/><%=user.getBankName() %></td></tr> --%> 
	<tr><td align="left"> User Name </td>
		<td align="left"> <%=user.getUserName()%> </td></tr>
	<tr><td align="left"> Current Password </td>
		<td align="left"> <input type="password" name="password" id="password" /></td></tr>
	<tr><td align="left"> New Password </td>
		<td align="left"> <input type="password" name="newPwd" id="newPwd" /></td></tr>
	<tr><td align="left"> Confirm Password </td>
		<td align="left"> <input type="password" name="confirm" id="confirm" onkeyup="confirmPass()" />
			<div id="confirmMsg">&nbsp;</div>
		</td></tr>
	<tr> 
		<td align="center" colspan="2"><input type="submit" id="save" value="Save"> &nbsp;&nbsp;</td>
	</tr>
</table>
</td>
</tr>
</table>
</div>
</form:form>
<script type="text/javascript">
var $ = jQuery;
function confirmPass() {
	var pwd = document.getElementById("newPwd").value;
	var confirm = document.getElementById("confirm").value;
	if(pwd != confirm) {
		//alert("Password mismatched");
		$("#confirmMsg").html("Confirm Password not matching").css("color", "red");
		//document.CustomerForm.password.focus();
	} else {
		if(pwd.length>0 && confirm.length>0) {
			$("#confirmMsg").html("Confirm Password matched").css("color", "green");
			$("#newPwd").css("border", "1px solid green");
			$("#confirm").css("border", "1px solid green");
		} else {
			$("#newPwd").css("border", "1px solid red");
			$("#confirm").css("border", "1px solid red");
		}
	}
}
function validateForm() {
	var curPwd = document.getElementById("password").value;
	var pwd = document.getElementById("newPwd").value;
	var confirm = document.getElementById("confirm").value;
	if(curPwd.length==0 || pwd.length==0 || confirm.length==0 || confirm!=pwd) {
		if(curPwd.length==0) {
			$("#pwd").css("border", "1px solid red");
		} else {
			$("#pwd").css("border", "1px solid green");
		}
		if(pwd.length==0) {
			$("#newPwd").css("border", "1px solid red");
		} else {
			$("#newPwd").css("border", "1px solid green");
		}
		if(confirm.length==0) {
			$("#confirm").css("border", "1px solid red");
		} else {
			$("#confirm").css("border", "1px solid green");
		}
		if(pwd.length>0 && confirm.length>0) {
			if(confirm!=pwd) {
				$("#newPwd").css("border", "1px solid red");
				$("#confirm").css("border", "1px solid red");
			} else {
				$("#newPwd").css("border", "1px solid green");
				$("#confirm").css("border", "1px solid green");
			}
		}	
		return false;
	}
	return true;
}
</script>