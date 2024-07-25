<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="java.util.List"%>
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
<c:url var="profileSave" value="/profileSave.htm" />
<form:form name="CustomerForm" modelAttribute="user" method="POST" action="${profileSave}" onsubmit="return validateForm()">
<div class="editTable">
<table border="0">
<tr><td valign='top'>
<table width="350">
<% User user=(User) request.getAttribute("user");
	String uType=user.getUserType();
if(uType.equals("A"))
	uType="Admin";
if(uType.equals("AO"))
	uType="AO-Banker";
if(uType.equals("B"))
	uType="Banker";
if(uType.equals("C"))
	uType="Participant";
%>
	<tr><th colspan=2>Profile Details <form:hidden value="<%=user.getUserId() %>" path="userId"/> </th></tr>
	<tr><td align="left">Role</td><td align="left"><form:hidden path="userType" vlaue="<%=user.getUserType() %>"/><%=uType %></td></tr>
<% if(user.getUserType().equals("AO")|| user.getUserType().equals("B")){ %>
	<tr><td align="left">Bank</td><td align="left"><form:hidden path="bid" value="<%=user.getBid() %>"/><%=user.getBankName() %></td></tr>
	<tr><td align="left"> User Name </td>
		<td align="left"> <%=user.getUserName()%>
			<input type="hidden" name="userName" id="cname" value="<%=user.getUserName()%>" /> 
			<%-- <form:input path="userName" id="cname" onblur="chkAvailability()" />
			<input name="chkAvail" type="button" onclick="chkAvailability()" value="Check Availability" id="chkAvail"/>
			<div id="avail"></div> --%>
			</td></tr>
		<tr><td align="left">Current Password<strong class="red">*</strong></td>
		<td align="left"> <input type="password"  name = "pwd" id="pwd" /></td></tr>
		<tr><td align="left">New Password<strong class="red">*</strong></td>
		<td align="left"><input type="password" name="password" id="newPwd"  /></td></tr>
		<tr><td align="left">Confirm Password<strong class="red">*</strong></td>
		<td align="left"><input type="password" name="confirm" id="confirm" onkeyup="confirmPass()" />
			<div id="confirmMsg">&nbsp;</div>
			</td></tr>
	<tr><td align="left"> Mobile </td>
		<td align="left"> <form:input path="mobileNo" /> </td></tr>
	<tr><td align="left"> Email </td>
		<td align="left"> <form:input path="email" /> </td></tr>
		
<%} %>
<% if(user.getUserType().equals("A")){ %>
    <tr><td align="left"> User Name </td>
		<td align="left"> <%=user.getUserName()%>
			<input type="hidden" name="userName" id="cname" value="<%=user.getUserName()%>" />
			</td></tr>
		<tr><td align="left">Current Password<strong class="red">*</strong></td>
		<td align="left"> <input type="password"  name = "pwd" id="pwd" /></td></tr>
		<tr><td align="left">New Password<strong class="red">*</strong></td>
		<td align="left"><input type="password" name="password" id="newPwd"  /></td></tr>
		<tr><td align="left">Confirm Password<strong class="red">*</strong></td>
		 <td align="left"><input type="password" name="confirm" id="confirm" onblur="confirmPass()" />
		 	<div id="confirmMsg" style="width:200px;">&nbsp;</div>
		 	</td></tr>
		<%} %> 
	<tr></tr>
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
function chkPassword(){
	//alert("function called");
	var f = document.forms["CustomerForm"];
	var pwd = $("#pwd").val();
	var cname = $("#cname").val();
	//alert(cname);
	ajaxgetPwd(pwd,cname);
	}
function ajaxgetPwd(pwd,cname){
	//alert(cname);
	//alert(pwd);
	if(pwd.length==0) return;
	var f = document.forms["CustomerForm"];
	var urlStr = "/eauction/ajaxCheckPwd.htm";
	//alert("datafasfa");
		$.ajax({
		type: "POST",
		url: urlStr,
		data: "cname="+cname+"&pwd="+pwd,
		dataType: "json",
		error: function(req, error) { alert("error="+error);return; },
		success: function(data) {
					//alert(data);
					if(data)
						f.submit();
						//$("#pwd").focus();
						//return;
					else
						alert("Enter Correct Password");
						$("#pwd").focus();
				}
	});
}

function chkAvailability(){
	//alert("function called");
	var f = document.forms["CustomerForm"];
	var cname = $("#cname").val();
	//alert(cname);
	ajaxgetUserDetails(cname);
}
function ajaxgetUserDetails(cname){
	//alert(cname);
	if(cname.length==0) return;
	$("#avail").html("<b>Processing...</b>");
	var urlStr = "/eauction/ajaxCheckUserAvail.htm";
		$.ajax({
		type: "POST",
		url: urlStr,
		data: "cname="+cname,
		dataType: "json",
		error: function(req,error) { alert("error="+error); },

		success: function(data) {
					//alert(data.length);
					if(data.length>0){
						//alert("user already exist");
						$("#avail").html("<b><font color='red'>Username already exists</font></b>");
						$("#cname").focus();
					}
					else{
						$("#avail").html("<b><font color='green'>Username is available</font></b>");
						$("#pwd").focus();
					}
				}
	});
}

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
	var curPwd = document.getElementById("pwd").value;
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
