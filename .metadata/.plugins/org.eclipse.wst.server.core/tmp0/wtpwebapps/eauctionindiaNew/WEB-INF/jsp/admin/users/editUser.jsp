<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.Enquiry"%><html>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Bankers"%>
<%@page import="java.util.List"%>
<table border="0" class="maincontent-table">		
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<!--edit page-->
		<div>
		
		</div>
		<div id="a">
			<div class="msg"></div>
			<c:url var="saveUserUrl" value="/saveUser.htm" />
			<form:form name="userForm" modelAttribute="user" method="POST" action="${saveUserUrl}">
			<div class="editTable">
			<table border="0">
			<tr><td valign='top'>

			<div class="sliderkit tabs-standard">
          
				<div class="sliderkit-nav">
					<div class="sliderkit-nav-clip">
						<ul>
							<li><a href="#" title="[link title]">User Details</a></li>
							<li><a href="#" title="[link title]">Roles</a></li>
							<li><a href="#" title="[link title]">Permissions</a></li>
						</ul>
					</div>
				</div>
				<div class="sliderkit-panels">
<%
User user=(User)request.getAttribute("user");
Customer cust = (Customer)request.getAttribute("email");
%>
					<div class="sliderkit-panel">
						<div class="sliderkit-news">
							<table>
							<tr><th colspan=2>Enter Users Details <input type="hidden" value="<%=user.getUserId() %>" name="userId"/> </th></tr>
							<tr><td> Projects </td>
								<td>
								<form:select path="auctionId" >
								<from:option value="0" label="-None-"/> 
								<%
									//User user=(User)request.getAttribute("user");
									List<Auction> projectList=(List)request.getAttribute("auctionList");
									if(projectList!=null && projectList.size()>0){
										for(Auction auction:projectList){
											if(auction.getStatus().equals("P")||auction.getStatus().equals("S")){
										%>
											<form:option value="<%=auction.getAid() %>" label="<%= auction.getProject().getProjName() %>"/> 
										<%}}
									}
									
									%>
								</form:select>
								</td></tr>
							<tr><td> Customer </td>
								<td>
								<form:select path="custId">
								<form:option value="0" label="-None-"/>
								<% 
									List<Customer> customerList=(List)request.getAttribute("customerList");
									if(customerList!=null && customerList.size()>0){
										for(Customer customer:customerList){%>
											<form:option value="<%=customer.getCid() %>" label="<%= customer.getCname() %>"/>
										<%}
									}
									
									%>
								</form:select>
								</td></tr>
							<tr><td>Bank </td>
								<td>
									<form:select path="bid">
									<form:option value="0" label="-None-"/> 
									<%
									List<Bankers> BankerList=(List)request.getAttribute("BankerList");
									if(BankerList!=null && BankerList.size()>0){
										for(Bankers banker:BankerList){%>
											<form:option value="<%=banker.getBid() %>" label="<%= banker.getBankName() %>"/>
										<%}
									}
									
									%>
									</form:select>
								</td></tr>
							<tr><td> User Name </td>
								<td> <form:input path="userName" id="cname" onblur="chkAvailability()" />  <input name="chkAvail" type="button" onclick="chkAvailability()" value="Check Availability" id="chkAvail"/><div id="avail"></div></td></tr>
							<tr><td> Password </td>
								<td> <input type="password"  name="password"  id="pwd" value="<%=user.getPassword()%>"/></td></tr>
							<tr><td> Mobile </td>
								<td> <form:input path="mobileNo" /> </td></tr>
								
						    <tr><td> Email </td>
								<td> <form:input path="email" /></td></tr>		
							<tr><td> Status </td>
							<td> <form:checkbox value="A" path="status" /> </td></tr>
						</table>
						
						</div>
					</div>

					<div class="sliderkit-panel">
						<div class="sliderkit-news">
							<jsp:include page="userRoleTab.jsp"></jsp:include>
						</div>
					</div>
					<div class="sliderkit-panel">
						<div class="sliderkit-news">
							<jsp:include page="userPermTab.jsp"></jsp:include>
						</div>
					</div>

				</div>
			</div>
			</td></tr>
			</div>
				<tr>
				<td align="center" colspan="2"><input type="submit" id="save" value="save" > &nbsp;&nbsp;
				<input type="button" id="cancel" value="Cancel" onclick="cancelUser()">  &nbsp;&nbsp;
				</tr>
			</table>
			</div>
			
			</div>
			<!--edit page-->
		</div>
		</td>
		</tr>
</table>

<style type="text/css">
.tabs-standard {
	height: 450px;
}
.tabs-standard .sliderkit-panels, .tabs-standard .sliderkit-panel {
	height: 400px;
}
</style>

<script src="js/external/jquery.easing.1.3.min.js" type="text/javascript"></script>
<script src="js/external/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="js/sliderkit/jquery.sliderkit.1.9.pack.js" type="text/javascript"></script>
<script type="text/javascript">

function cancelUser(){
	window.location.href = "users.htm";
}
var $ = jQuery;
function chkAvailability(){
	//alert("function called");
	
	var cname = $("#cname").val();
	//alert(cname);
	ajaxgetUserDetails(cname);
}
function ajaxgetUserDetails(cname){
	//alert(cname);
	var urlStr =  "/eauction/ajaxCheckUserAvail.htm";
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "cname="+cname,
		dataType: "json",
		error: function(req,status, error) { alert("error="+error); },

		success: function(data) {
			//alert(data);
			var respUser = data;
			if(respUser && respUser.userId>0) { //data.length>0){
				//alert("user already exist");
				$("#avail").html("<b><font color='red'>user name already exists</font></b>");
			} else {
				$("#avail").html("<b><font color='green'>user name available</font></b>");
			}
		}
	});
}

</script>


<script type="text/javascript">

	var $ = jQuery;
	$(document).ready(function() {
		
		var values = "";
		var values2 = "";
		$(".assign option:selected").each(function(){
			values += $(this).val()+",";
		});
		$(".assignIds").val(values);
		$(".assign2 option:selected").each(function() {
			values2 += $(this).val()+",";
		});
		$(".assignIds2").val(values2);
	});
	$(window).load(function(){ //$(window).load() must be used instead of $(document).ready() because of Webkit compatibility				
	 
				// Tabs > Standard
				$(".tabs-standard").sliderkit({
					auto:false,
					tabs:true,
					mousewheel:true,
					circular:true,
					panelfx:"none"
				});
	});
	 
	function addToAssignList(sid) {			
		var s = "";
		if(sid && sid==2) s="2";
		$(".assign"+s).append($(".available"+s+" option:selected"));
		$(".available"+s+" option:selected").remove();
		var v = "";
		$(".assign"+s+" option").each(function() {
			v += $(this).val()+",";
		});
		$(".assignIds"+s).val(v);
	}
	function removeFromAssignList(sid) {
		var s = "";
		if(sid && sid==2) s="2";
		$(".available"+s).append($(".assign"+s+" option:selected"));
		$(".assign"+s+" option:selected").remove();
		var v = "";
		$(".assign"+s+" option").each(function() {
			v += $(this).val()+",";
		});
		$(".assignIds"+s).val(v);
	}
	/*$(window).load(function(){ //$(window).load() must be used instead of $(document).ready() because of Webkit compatibility				
		 
		// Tabs > Standard
		$(".tabs-standard").sliderkit({
			auto:false,
			tabs:true,
			mousewheel:true,
			circular:true,
			panelfx:"none"
		});
});*/
/*
function addToAssignList(sid) {			
	var s = "";
	if(sid && sid==2) s="2";
	$(".assign"+s).append($(".available"+s+" option:selected"));
	$(".available"+s+" option:selected").remove();
	var v = "";
	$(".assign"+s+" option").each(function() {
		v += $(this).val()+",";
	});
	//alert(".assignIds"+s);
	$(".assignIds"+s).val(v);
}
function removeFromAssignList(sid) {
	var s = "";
	if(sid && sid==2) s="2";
	$(".available"+s).append($(".assign"+s+" option:selected"));
	$(".assign"+s+" option:selected").remove();
	var v = "";
	$(".assign"+s+" option").each(function() {
		v += $(this).val()+",";
	});
	$(".assignIds"+s).val(v);
}*/
</script>
</form:form>