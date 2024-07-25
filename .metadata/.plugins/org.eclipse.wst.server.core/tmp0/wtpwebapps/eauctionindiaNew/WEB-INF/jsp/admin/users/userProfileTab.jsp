<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.service.ProjectService"%>
<%@page import="com.zedapp.eauction.service.ProjectServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Enquiry"%><html>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Bankers"%>
<%@page import="java.util.List"%>
<table> 
	<tr><th colspan=2>Enter Users Details <input type="hidden" value="<?php echo $fuid; ?>" name="uid"/> </th></tr>
	<tr><td> Projects </td>
		<td>
		<select name="auctionId" >
		<option value="0">-None-</option> 
		<%
			User user=(User)request.getAttribute("user");
			List<Auction> projectList=(List)request.getAttribute("auctionList");
			if(projectList!=null && projectList.size()>0){
				for(Auction auction:projectList){%>
					<option value="<%=auction.getAid() %>"><%= auction.getProject().getProjName() %> </option> 
				<%}
			}
			
			%>
		</select>
		</td></tr>
	<tr><td> Customer </td>
		<td>
		<select name="custId">
		<option value="0" >-None-</option>
		<%
			List<Customer> customerList=(List)request.getAttribute("customerList");
			if(customerList!=null && customerList.size()>0){
				for(Customer customer:customerList){%>
					<form:option value="<%=customer.getCid() %>" label="<%= customer.getCname() %>"/>
				<%}
			}
			
			%>
		</select>
		</td></tr>
	<tr><td>Bank </td>
		<td>
			<select name="bid">
			<option value="0">-None-</option> 
			<%
			List<Bankers> BankerList=(List)request.getAttribute("BankerList");
			if(BankerList!=null && BankerList.size()>0){
				for(Bankers banker:BankerList){%>
					<option value="<%=banker.getBid() %>" label="<%= banker.getBankName() %>"/>
				<%}
			}
			
			%>
			</select>
		</td></tr>
	<tr><td> User Name </td>
		<%if(user!=null){ %>
		<td> <input type="text" name="userName" id="cname" onblur="chkAvailability()" value="<%=user.getUserName() %>"/>  <input name="chkAvail" type="button" onclick="chkAvailability()" value="Check Availability" id="chkAvail"/><div id="avail"></div></td></tr>
		<%}else{%>
		<td> <input type="text" name="userName" id="cname" onblur="chkAvailability()"/>  <input name="chkAvail" type="button" onclick="chkAvailability()" value="Check Availability" id="chkAvail"/><div id="avail"></div></td></tr>
		<%} %>
	<tr><td> Password </td>
		<td> <input type="password"  name="password"  id="pwd"/></td></tr>
		<%if(user!=null){ %>
	<tr><td> Mobile </td>
		<td> <input type="text" name="mobileNo" value=<%=user.getMobileNo() %>"> </td></tr>
		<%}else {%>
		<tr><td> Mobile </td>
		<td> <input type="text" name="mobileNo" /> </td></tr>
		<%} %>
	<tr><td> Status </td>
	<td> <input type="checkbox" value="A" name="status" /> </td></tr>
</table>

<script type="text/javascript">
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
	var urlStr = "checkUserAvail.htm?cname="+cname;
		$.ajax({
		type: "POST",
		url: urlStr,
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

</script>
