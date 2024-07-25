<%@page import="com.zedapp.common.util.ValuesUtil"%>
<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="com.zedapp.eauction.service.ProjectService"%>
<%@page import="com.zedapp.eauction.service.ProjectServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.eauction.model.Payment"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.service.CustomerService"%>
<%@page import="com.zedapp.eauction.service.CustomerServiceImpl"%>
<%@page import="java.util.List"%>
<%
//int aid=(Integer)(request.getAttribute("aid"));
User user=PortalUtil.getUser(request);
if(user!=null){
	if(!user.getUserType().equals("C")){%>
		
<c:url var="viewCustomerUrl" value="/customer.htm" />
<span style="float: right; padding-top: 10px; padding-right: 10px; font-weight: normal">
			<span style="color: black; font-weight: normal; font-size: small;">
			<span style="color: #ff0000;"> *</span>
			Marked fields are Mandatory
			</span>
			</span>
<a href="customer.htm">Back</a> 
<%--  <a href="${viewCustomerUrl}">Back</a> --%>
<%}
}
%>
<br></br>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		</div>
		<!--edit page-->
			
		<div id="a">
			<div class="msg"></div>
				<c:url var="saveCustomerUrl" value="/saveCustomer.htm" />
				<form:form modelAttribute="customer" name="CustomerForm" method="POST" onsubmit="return validateForm()" action="${saveCustomerUrl}" enctype="multipart/form-data" id="custfrm">
		<table border="0">
		<tr><td valign="top">
			<div class="table">
			<table border="0">
			<tr><th colspan=2>Enter Participant Details <form:hidden  path="cid"/></th></tr>
			<%
			BankProjects bankProjects=(BankProjects)request.getAttribute("bankProjects");
			//String  emd = bankProjects.getEmd();
			//Auction custAuction = (Auction)request.getAttribute("custAuction");
			//Customer customer=(Customer)request.getAttribute("customer");
			//if(customer.getCid()==0){
				int selAid = 0;
				selAid = ValuesUtil.intVal(request.getAttribute("selectedAid"));

				System.out.println("selAid---2"+selAid);
			if(user!=null ){
				if(!user.getUserType().equals("C")  ) {
					
			%> 
					<tr><td>Select Property For Auction</td><td>
					<%-- <%= ((bankProjects!=null)? bankProjects.getProjName() : "") %>
					<%
					if(custAuction!=null && custAuction.getStatus()!=null && !custAuction.getStatus().equals("C")) {
					%> --%>
						<form:select path="aid" onchange="showAuctionDetails()" class="MultiSelectOpt">
						<form:option value="0" >None</form:option>
						<%
						List<Auction> projectList=(List<Auction>)request.getAttribute("auctionList");
						if(projectList!=null && projectList.size()>0){
							for(Auction auction:projectList){
								if(auction.getStatus().equals("P") || auction.getStatus().equals("CL") || auction.getStatus().equals("S")) {
								%>
								<form:option value="<%=auction.getAid() %>" label="<%= auction.getProject().getProjName() %>"/>
								<%
								}
							}
						}
						%>
		   				</form:select>
		   		<%-- 	<%
		   			} else {
		   				%>
		   				<form:hidden path="aid" />
		   			<% } --%>
			<%} 	}
			else if(selAid == 0){
				%> 
				<tr><td>Select Property For Auction</td><td>
				<%-- <%= ((bankProjects!=null)? bankProjects.getProjName() : "") %>
				<%
				if(custAuction!=null && custAuction.getStatus()!=null && !custAuction.getStatus().equals("C")) {
				%> --%>
					<form:select path="aid" onchange="showAuctionDetails()" class="MultiSelectOpt">
					<form:option value="0" >None</form:option>
					<%
					List<Auction> projectList=(List<Auction>)request.getAttribute("auctionList");
					if(projectList!=null && projectList.size()>0){
						for(Auction auction:projectList){
							if(auction.getStatus().equals("P") || auction.getStatus().equals("CL") || auction.getStatus().equals("S")) {
							%>
							<form:option value="<%=auction.getAid() %>" label="<%= auction.getProject().getProjName() %>"/>
							<%
							}
						}
					}
					%>
	   				</form:select>
	   		<%-- 	<%
	   			} else {
	   				%>
	   				<form:hidden path="aid" />
	   			<% } --%>
		<%
			}
			else {
			%>
		   			<form:hidden path="aid" />
		   			
		   		<% }
			
	   		%>
				</td></tr>
				<tr><td align='left'>Bidder name <strong class="red">*</strong> </td><td align='left'> <form:input   path="cname"/> </td></tr>
				<tr><td align='left'>Address </td><td align='left'> <form:textarea rows="3" cols="25" path="addr"/> </td></tr>
				<tr><td align='left'>City <strong class="red">*</strong></td><td align='left'> <form:input  path="city"/> </td></tr>
				<tr><td align='left'>PIN Code<strong class="red">*</strong> </td><td align='left'> <form:input path="pincode"/> </td></tr>
				<tr><td align='left'>State<strong class="red">*</strong> </td><td align='left'> <form:input path="state"/> </td></tr>
				<tr><td align='left'>Country<strong class="red">*</strong> </td><td align='left'> <form:input path="country"/> </td></tr>
				<tr><td align='left'>EMail<strong class="red">*</strong> </td><td align='left'> <form:input path="email"/> </td></tr>
				<tr><td align='left'>Mobile<strong class="red">*</strong> </td><td align='left'> <form:input path="mobile"/> </td></tr>
				
				<tr><th colspan=2>Know Your Customer(Self Attested)</th></tr>
				<tr><td align='left'>Bidder Photo</td><td align='left'> <form:input type="file"  path="uploadfile1"/> 
				<tr><td align='left'>Bidder Pan Card</td><td align='left'> <form:input type="file" path="uploadfile2"/>
				<tr><td align='left'>Bidder Proof</td><td align='left'> <form:input type="file" path="uploadfile3"/>
				<tr><td align='left'>Tender Amount </td><td align='left'>
				<%if(bankProjects!=null){ %>
				<form:input path="quotation"  onblur="checkProjQuatation(${bankProjects.minBid})"/></td></tr>
				<%}else{
					%> 
				<form:input path="quotation"  onblur="checkQuatation()"/></td></tr>
				<%} %>				
				<tr><th colspan=2>Enter Users Details <form:input type="hidden"  path="userId"/> </th></tr>
				
				<tr><td align='left'> User Name<strong class="red">*</strong> </td>
				<td align='left'> <form:input  path="uname" id="uname" onblur="chkAvailability()"/>  
				<input  type="button" onclick="chkAvailability()" value="checkAvailability" id="chkAvail"/>
				<div id="avail"></div></td></tr>
				<%-- <tr><td align='left'> Password<strong class="red">*</strong> </td>
				<td align='left'><form:input type="password" path="pwd"/></td></tr> --%>
				
				<tr><td align='left'>
				<label for="pass">Password</label><strong class="red">*</strong> </td>
				<td align='left'><form:input type="password" path="pwd" id="pwd"/></td></tr>
				
				<tr><td align='left'>
				<label for="c_pass">Confirm Password</label><strong class="red">*</strong> </td>
				<td align='left'><input type="password" class="text" name="confirm"  id="confirm" onblur="confirmPass()"/></td></tr>

				
				<%if(user!=null){
					if(!user.getUserType().equals("C")){%>	
				<tr><td align='left'> Status </td>
				<td align='left'> <form:checkbox  value="A" path="status" /> </td></tr>
				<tr><td align='left'> Role </td>
				<td align='left'> Participant</td></tr>
				<%}} %>
				
				<td align="center" colspan="2"> 
				<input type="submit" id="save" value="Save" onClick="Confirm(this.form)" > &nbsp;&nbsp;</td>
				<tr><td align='left'> Select Attorney</td><td align='left'>
				<form:select path="custtype" onchange="showPowerOfAttorneyForm()">
				<form:option value="S" label="Self"/>
				<form:option value="PA" label="Power Of Attorney"/>
				</form:select>
				</td></tr>
			</table>
			</div>
			
		</td><td valign="top">
			<div class="auctionDetails"> 
			<%
			 
			 if(bankProjects!=null){
			%>
				<%=bankProjects.getAuctionDetails() %>
				<%} %>
				<input type='hidden' name='emdAmt' value='0' id='eid'>
			</div>
			<table border="0">
				<tr><th colspan=2>Enter Payment Details<form:hidden  path="cpid"/> </th></tr>
				
				<tr><td align='left'> EMD Payment </td>
				<td align='left'> 
				<%if(bankProjects!=null){ %>
				<form:input path="payAmt" value="<%=(bankProjects!=null ? bankProjects.getEmd() : 0) %>" readonly="true"/>
				<%}else{
					%>  <form:input path="payAmt"  readonly="true"/>
				<%} %>
				<form:label  path="payAmt" id="payAmt"/>
				<tr><td align='left'> EMD Pay Date <strong class="red">*</strong></td>
				<td align='left'> <form:input path="payDt" id="payDt"/> </td></tr>
				<tr><td align='left'> DD PO NO<strong class="red">*</strong> </td>
				<td align='left'> <form:input path="ddNo" id="ddNo"/> </td></tr>
				<tr><td align='left'> DD PO Amt<strong class="red">*</strong></td>
				<td align='left'> <form:input path="ddAmt" id="ddAmt"/> </td></tr>
				<tr><td align='left'> DD PO Date<strong class="red">*</strong></td>
				<td align='left'> <form:input path="ddDt" id="ddDt"/> </td></tr>
				<tr><td align='left'> DD BankName<strong class="red">*</strong></td>
				<td align='left'> <form:input type="text" path="ddBank" id="bankName"/> </td></tr>
				<tr><td align='left'> In Favour Of</td>
				<td align='left'> <form:input path="infavour" id="infavour"/> </td></tr>

				<tr><td align='left'>Bidder Type</td><td align='left'>
				<form:select path="joinId" ><!--onchange="showCustomerJoinForm()">
				--><form:option value="0" label="Single"/>
				<form:option value="1" label="Joint"/>
				</form:select>
				
			<!--<div id="joinDiv" style="display:none">
			<div class="table">
			<table border="0">
			--><tr><th colspan=2>Enter  Co-bidder Details <form:hidden  path="cid3"/></th></tr>
			<tr><td align='left'>Co-bidder name  </td><td align='left'> 
			<form:input path="cname3"/> </td></tr>
			<tr><td align='left'>Address </td><td align='left'> <form:textarea rows="3" cols="25" path="addr3"/> </td></tr>
			<tr><td align='left'>City </td><td align='left'> <form:input path="city3"/> </td></tr>
			<tr><td align='left'>PIN Code</td><td align='left'> <form:input path="pincode3"/> </td></tr>
			<tr><td align='left'>State </td><td align='left'> <form:input  path="state3"/> </td></tr>
			<tr><td align='left'>Country </td><td align='left'> <form:input path="country3"/> </td></tr>
			<tr><td align='left'>EMail </td><td align='left'> <form:input path="email3"/> </td></tr>
			<tr><td align='left'>Mobile</td><td align='left'> <form:input path="mobile3"/> </td></tr>
			<tr><th colspan=2>Know Your Customer(Self Attested) </th></tr>
			<tr><td align='left'>Co-bidder Photo</td><td align='left'> <form:input type="file" path="uploadfile4" />
			<tr><td align='left'>Co-bidder PAN CARD</td><td align='left'> <form:input type="file" path="uploadfile5" />
			<tr><td align='left'>Co-bidder Proof</td><td align='left'> <form:input type="file" path="uploadfile6" />
				
			</table>
			</div>
			       
		</td></tr>
		</table>
			<div id="powerDiv" style="display:none;">


			<table border='0'>
			<tr><th colspan="2">Power Of Atterny Details<form:hidden path="atid"/></th></tr>
			<tr><td align='left'>Participant name <strong class="red">*</strong> </td><td align='left'> <form:input path="cname2"/> </td></tr>

			<tr><td align='left'>Address </td><td align='left'> <form:textarea rows="3" cols="25" path="addr2"/> </td></tr>
			<tr><td align='left'>City </td><td align='left'> <form:input  path="city2"/> </td></tr>
			<tr><td align='left'>PIN Code </td><td align='left'> <form:input path="pincode2"/> </td></tr>
			<tr><td align='left'>State </td><td align='left'> <form:input path="state2"/> </td></tr>
			<tr><td align='left'>Country </td><td align='left'> <form:input path="country2"/> </td></tr>
			<tr><td align='left'>EMail </td><td align='left'> <form:input path="email2"/> </td></tr>
			<tr><td align='left'>Mobile </td><td align='left'> <form:input path="mobile2"/> </td></tr>
			<tr><th colspan=2>Know Your Customer </th></tr>
			<tr><td align='left'>Customer Photo-1</td><td align='left'> <input type="hidden" name="oldfile6"  />
				<form:input type="file" path="uploadfile7"/>
				</td></tr>
			<tr><td align='left'>Customer Photo-2</td><td align='left'> <input type="hidden" name="oldfile7"  />
				<form:input type="file" path="uploadfile8"/>
				 </td></tr>
			<tr><td align='left'>Customer Proof-1</td><td align='left'> <input type="hidden" name="oldfile8"  />
				<form:input type="file" path="uploadfile9"/>
				 </td></tr>
				<tr><td align='left'>Customer Proof-2</td><td align='left'> <input type="hidden" name="oldfile9"  />
				<form:input type="file" path="uploadfile10"/>
				 </td></tr>
				
				</table>
			</div>
			</form:form>
			</div>
			<!--edit page-->
		</div>
		</td>
		</tr>
</table>
<script type="text/javascript">
var $ = jQuery;

 	  
$(document).ready(function() {
	
	$.validator.addMethod("MultiSelectOpt", function(value, element) {
        if(element.selectedIndex <= 0) return element.selectedIndex;
                else return value;
    }, "<br/> You must select any Option.");

});	

$(document).ready(function() {	
	
	    $("#custfrm").validate({
	    	
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
        	
        cname: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        city: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        pincode: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        state: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        country: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        email: {required:true, email: true},
        mobile: {required:true, minlength:10, maxlength:10, accept:"[0-9-]+"},
        uname:{required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        pwd: {required:true, minlength:6, maxlength:100, accept:"[a-zA-Z0-9~!@#$%^&*_ ]+"},
        payDt: {required:true, minlength:6},
        ddDt: {required:true, minlength:6},
        ddNo: {required:true,  maxlength:100},
        ddAmt: {required:true,  maxlength:100},
        ddBank: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
        /* cname3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        city3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        pincode3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        state3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        country3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        email3: {required:true, email: true},
        mobile3: {required:true, minlength:10, maxlength:100, accept:"[0-9-]+"} */
       /*  country3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        ddBank: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        city3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        cname3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        pincode3: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        payDt: {required:true, dpDate:true},
        ddno: {required:true,  maxlength:100},
        ddDt: {required:true, dpDate:true},
        ddAmt: {required:true,  maxlength:100},
        email: {required:true, email: true},
        email3: {required:true, email: true},
        mobile: {required:true, minlength:10, maxlength:100, accept:"[0-9-]+"},
        mobile3: {required:true, minlength:10, maxlength:100, accept:"[0-9-]+"},
        uname:{required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"},
        pwd: {required:true, minlength:6, maxlength:100, accept:"[a-zA-Z0-9~!@#$%^&*_ ]+"}  */
        },
        messages: {
            cname: {required:"<br/>Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	city: {required:"<br/> City is required", minlength:"City must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"City is not valid"},
        	pincode: {required:"<br/> Pincode is required", minlength:"Pincode must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Pincode  is not valid"},
        	state: {required:"<br/> State is required", minlength:"State must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"State is not valid"},
        	country: {required:"<br/> Country is required", minlength:"Country must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Country is not valid"},
        	email: {required:"<br/> Email is required", email: "Your email address must be in the format of name@domain.com"},
        	mobile: {required:"<br/> Mobile is required", minlength:"Mobile must be of atleast 10 digits", maxlength:"max 10 chars is allowed", accept:"Number is not valid"},
        	uname: {required:"<br/> User Name is required", minlength:"User Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	pwd: {required:"<br/> Password is required", minlength:"Password must be of atleast 6 chars", maxlength:"max 100 chars is allowed", accept:"Password is not valid"},
        	payDt: {required:"<br/> EMD Pay Date is required", minlength:"EMD Pay Date is required"},
        	ddDt: {required:"<br/> DD Date is required", minlength:"DD Date is required"},
        	ddNo: {required:"<br/> DDNO is required",  maxlength:"max 100 chars is allowed"},
        	ddAmt: {required:"<br/> DDAmt is required",  maxlength:"max 100 Digits is allowed"},
        	ddBank: {required:"<br/> Bank Name is required", minlength:"State must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"}
        	/* cname3: {required:"<br/> Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	city3: {required:"<br/> City is required", minlength:"City must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"City is not valid"},
        	pincode3: {required:"<br/> Pincode is required", minlength:"Pincode must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Pincode  is not valid"},
        	state3: {required:"<br/> State is required", minlength:"State must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"State is not valid"},
        	country3: {required:"<br/> Country is required", minlength:"Country must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Country is not valid"},
        	email3: {required:"<br/> Email is required", email: "Your email address must be in the format of name@domain.com"},
        	mobile3: {required:"<br/> Mobile is required", minlength:"Mobile must be of atleast 10 digits", maxlength:"max 100 chars is allowed", accept:"Number is not valid"}
        	 */
        	
        	/* country3: {required:"<br/> Country is required", minlength:"Country must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Country is not valid"},
        	ddBank: {required:"<br/> Bank Name is required", minlength:"State must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	city3: {required:"<br/> City is required", minlength:"City must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"City is not valid"},
        	cname3: {required:"<br/> Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	pincode3: {required:"<br/> Pincode is required", minlength:"Pincode must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Pincode  is not valid"},
        	payDt: {required:"<br/> EMD Pay Date is required"},
        	ddno: {required:"<br/> DDNO is required",  maxlength:"max 100 chars is allowed"},
        	ddDt: {required:"<br/> DD Date is required"},
        	ddAmt: {required:"<br/> DDAmt is required",  maxlength:"max 100 Digits is allowed"},
        	email: {required:"<br/> Email is required", email: "Your email address must be in the format of name@domain.com"},
        	email3: {required:"<br/> Email is required", email: "Your email address must be in the format of name@domain.com"},
        	mobile: {required:"<br/> Mobile is required", minlength:"Mobile must be of atleast 10 digits", maxlength:"max 100 chars is allowed", accept:"Number is not valid"},
        	mobile3: {required:"<br/> Mobile is required", minlength:"Mobile must be of atleast 10 digits", maxlength:"max 100 chars is allowed", accept:"Number is not valid"},
        	uname: {required:"<br/> User Name is required", minlength:"User Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"},
        	pwd: {required:"<br/> Password is required", minlength:"Password must be of atleast 6 chars", maxlength:"max 100 chars is allowed", accept:"Password is not valid"} */ 
        }
    });

});


function validateForm() {
	if($("#custfrm").valid()) {
		var pwd = document.getElementById("pwd").value;
		var confirm = document.getElementById("confirm").value;
		if(pwd != confirm) {
			alert("Password mismatched");
			document.CustomerForm.pwd.focus();
			return false;
			
		}	
		document.CustomerForm.submit();
		alert("Record insert successfully!");
		return true;
	}
		return false;
}
/* jQuery(document).ready(function() {
	var f = document.forms["CustomerForm"];
	f.cname.focus();
	validateForm();
});*/
jQuery(document).ready(function() {
	document.CustomerForm.cname.focus();
	
});





</script>
<script type="text/javascript">
var $ = jQuery;
var f = document.forms["CustomerForm"];
var aid = f.aid.value;
var quot=0;

$(document).ready(function() {
	//showAuctionDetails();
	
	//showRegistrationAuctionDetails();
});
function confirmPass() {
	var pwd = document.getElementById("pwd").value;
	var confirm = document.getElementById("confirm").value;
	if(pwd != confirm) {
		alert("Pass word mismatched");
		document.CustomerForm.pwd.focus();
	}
}
function showAuctionDetails() {
					
	$(".auctionDetails").html("refreshing");
	var f = document.forms["CustomerForm"];
	var aid = f.aid.options[f.aid.options.selectedIndex].value;
	var urlStr = "/eauction/ajaxAuctionDetails.htm";
	alert(aid);
	alert($);
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid,
		dataType: "json",
		error: function(req,error) { alert("error="+error); 
			},
		success: function(data) {
			//alert(data.projName);
					$(".auctionDetails").html(data.auctionDetails);
					$("#payAmt").val(data.emd);
					$("#quotation").val(data.minBid);
					quot=data.minBid;
				},
				complete:function(xhr,status){
					console.log(xhr);
				}
	});
}
function  checkQuatation(){
	//alert("checkQuatation");
	var f = document.forms["CustomerForm"];
	var givenQuot=f.quotation.value;
	
	//alert(quot);
	if(givenQuot<quot){
		alert("TenderAmount Should be Greater than "+quot);
		$("#quotation").val(quot);
		//return false;
	}
	
	 validateForm();	
}
function checkProjQuatation(minBid){
	var f = document.forms["CustomerForm"];
	var givenQuot=f.quotation.value;
	//alert(givenQuot);
	if(quot==0){
			quot=minBid;
	}
	
	//alert(quot);
	if(givenQuot<quot){
		alert("TenderAmount Should be Greater than "+quot);
		$("#quotation").val(quot);
		//return false;
	}
}

function selectPaid() {
	var f = document.forms["CustomerForm"];
	var isPaid = 0;
	$("#payAmt").val(0);
	for(var x=0;x<f.paid.length;x++) {
		if(f.paid[x].checked) {
			isPaid = f.paid[x].value;
		}
	}
	if(isPaid>0) {
		$("#payAmt").val($("#emdAmt").val());
	}
}
function viewBigger(obj) {
	$("#"+obj).show();
}
function closePopupImg(obj) {
	$("#"+obj).hide();
}

function showPowerOfAttorneyForm() {
var f=document.forms["CustomerForm"];
if(f.custtype.options[f.custtype.options.selectedIndex].value==="PA"){
	$("#powerDiv").show();
}
else{
	$("#powerDiv").hide();
}
}
</script>
<script type="text/javascript">
var $ = jQuery;
function chkAvailability(){
	//alert("function called");
	var f = document.forms["CustomerForm"];
	
	var cname = $("#uname").val();
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


 


