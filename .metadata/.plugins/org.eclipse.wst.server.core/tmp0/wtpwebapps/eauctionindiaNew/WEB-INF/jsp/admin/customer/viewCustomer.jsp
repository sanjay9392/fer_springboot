<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.common.util.PermissionUtil"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<form  name="frm" >
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="cid" value=""/>

 <%//if(PermissionUtil.hasUserPermission(request,"VIEW_AUCTION")){ 
	%> 
<input type="button" value="Show All Participants" onclick="showAll()"/>
 <%//} if(PermissionUtil.hasUserPermission(request,"VIEW_AUCTION")){
	%> 
<input type="button" value="Show Inactive Participants" onclick="showInactive()"/>
 <%if(PermissionUtil.hasUserPermission(request,"ADD_AUCTION")){ %>
<input type="button" value="Add Participants" onclick="addCustomer()"/>
<%} %>
<%if(PermissionUtil.hasUserPermission(request,"DELETE_AUCTION")){ %>
<input type="button" value="Delete All " onclick="delAllCustomer()"/>
<%} %> 

<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="submit" value="Search" onclick="searchParticipants()"></td>
		<th>Select Auction :</th>
		<td>
		<%
		List<Auction> projectList=(List)request.getAttribute("auctionList");
		%>
			<select id="aid" onchange="showAuctionDetails()" class="MultiSelectOpt">
			<option value="<%= projectList%>" >All</option>
			<%
			    
				
			    System.out.println("projectList===>"+projectList);
				if(projectList!=null && projectList.size()>0){
					for(Auction auction:projectList){
						System.out.println(auction.getStatus());
						System.out.println(auction.getAid());
						System.out.println(auction.getProject().getProjName());
					if(auction.getStatus().equals("P")){
					%>
						<option value="<%=auction.getAid() %>"><%= auction.getProject().getProjName() %></option>
					<%}}
				}
				
				%>
   			</select>
			</td>
		
		
		</tr>
</table>
</div>

<table cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left">
<jsp:include page="../../common/pagination.jsp"/>

<tr class="tableHead">
<th width="25" onclick="checkAll()">All<input type="checkbox" name="checkall" value="">&nbsp;</th>
<th>Sl.No.</th>
<th>Participants</th>
<th>Photo</th>
<th>Address</th>
<th>Tender Amount</th>
<th>Auction</th>
<th>User Status</th>

<%if(PermissionUtil.hasUserPermission(request,"UPDATE_AUCTION") || PermissionUtil.hasUserPermission(request,"DELETE_AUCTION")){ %>
<th width="150">Actions</th>
</tr>
<%} %>
<%
Set l=(Set)request.getAttribute("customer");
int cc=0;
String currentPage = request.getParameter("page");
int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
int curPage = 1;
try {
	curPage = Integer.parseInt(currentPage);
	
} catch(Exception ex) {}

cc=(curPage-1)*rowsPerPage+cc;

if(l!=null &&l.size()>0){
Iterator i=l.iterator(); 
//int cc=0;
while(i.hasNext())
{
	
	Customer id=(Customer)i.next();
	++cc;	
int cid=id.getCid();
String name=id.getCname();
String photo=id.getPhoto();
String addr=id.getAddr();
String quotation=id.getQuotation();
String auctionName="";
if(id.getAuction()!=null && id.getAuction().getProject()!=null) {
	auctionName = id.getAuction().getProject().getProjName();
}
String status=(id.getUser()!=null)?(id.getUser().getStatus()):"";
if(status==null) status="I";
if(status.equals("A"))
	status="Active";
else
	status="InActive";
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="10"><input type="checkbox" name="chckbox" value="<%=cid%>" id="<%=cid %>" /></td>
<td><b><%=cc %></b></td>
<%//if(PermissionUtil.hasUserPermission(request,"VIEW_AUCTION")){ %>
<td><b><a href="javascript:viewCustomerDetails('<%=cid%>')"><%=name%></a></b></td>
<%//} %>
<td><img src='./uploads/<%=photo%>' width='40' ></td>
<td><b><%=addr%></b></td>
<td><b><%=MoneyUtil.displayMoney(quotation)%></b></td>
<td><b><%=auctionName%></b></td>
<td><b><%=status%></b></td>
<td >
<%if(PermissionUtil.hasUserPermission(request,"UPDATE_AUCTION")){ %>
 <a href="javascript:editCustomer('<%=cid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
<%} if(PermissionUtil.hasUserPermission(request,"DELETE_AUCTION")){ %>	/
 <a href="javascript:delCustomer('<%=cid %>')"><img src="images/del-icon.png" title="Delete"/></a>
 <%} %> </td>
</tr>
<%
}
}
else {
	out.println("<tr><td colspan='4'><b>No Record found</b></td></tr>");
}
%>

</table>

</form>

<script>
function checkAll(){

	var Checkbox = document.frm.checkall;
	var delsize = document.frm["chckbox"];
	if(Checkbox.checked == true){
		if(delsize.length){
			
			for(var i=0; i<delsize.length; i++){
				document.frm.chckbox[i].checked = true;
			}
		}else if(!delsize.length){
			document.frm.chckbox.checked=true; 
		}
	}else {
		if(delsize.length){
			for(var i=0; i<delsize.length; i++){
				document.frm.chckbox[i].checked = false;
			}
		}else if(!delsize.length){
			document.frm.chckbox.checked=false;
		}
	}
}


function addCustomer(){
	document.frm.action="addCustomer.htm";
	document.frm.cid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="customer.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="customer.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="customer.htm";
	document.frm.submit();
}
function searchCustomer()
{	
	document.frm.action="searchCustomer.htm";
	document.frm.submit();
}
function showInactive()
{
	document.frm.action="customer.htm";
	document.frm.cmd.value="inActive";
	document.frm.submit();
}
function showAll()
{
	document.frm.action="customer.htm";
	document.frm.submit();
}
function editCustomer(id)
{
	document.frm.action="addCustomer.htm";
	document.frm.cid.value=""+id;
	document.frm.submit();
}

function delCustomer(id)
{
	document.frm.action="deleteCustomer.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
}

function viewCustomerDetails(id)
{
	document.frm.action="addCustomer.htm";
	document.frm.cid.value=""+id;
	document.frm.cmd.value="view";
	document.frm.submit();
}
function searchParticipants(){
	document.frm.action="searchCustomer.htm";
	document.frm.submit();
}



function delAllCustomer(){
	var flag=0;
	   var f=document.frm;
	   if(f.chckbox.length>0){
	
	     for(var i=0;i<document.frm.chckbox.length;i++)
	     {
	        if(document.frm.chckbox[i].checked)
	        {
	           flag=1;
	         }
	      }
	   }	
	   else if(f.chckbox.value>0){
	     if(f.chckbox.checked)
	     {
	         flag=1;
	     }
	   }	  
	   if(flag==0)
	   {
		   alert("Please Select Record");
		   return false;
	   }
	   else
		   
	   {   if(confirm("Are you sure want to delete")){
		   
		   document.frm.action="deleteCustomer.htm";
		 
		   document.frm.submit();
	    }else{
		    
	    	var Checkbox = document.frm.checkall;
	    	var delsize = document.frm["chckbox"];
	    	if(Checkbox.checked){
	    		Checkbox.checked=false;
	    		for(var i=0; i<delsize.length; i++){
	    			document.frm.chckbox[i].checked = false;
	    		}
	       } 
	    }
	 }
}

/* function showAuctionDetails(){
	alert("Hello");
	var f = document.forms["listform"];
	var aid = f.aid.options[f.aid.options.selectedIndex].value;
	//alert(aid);
	 var urlStr = "/eauction/ajaxDisplayAuctionEnquirers.htm";
	//alert(aid);
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid,
		//dataType: "json",
		error: function(req,error) {// alert("error="+error); 
			},
		success: function(data) {
			//alert(data);
			$(".viewTable tr").remove(); 
			$(".viewTable").html(data);
			/*		
					$("#payAmt").val($("#emd").val());
					$("#quotation").val($("#minBid").val()); 
		}
	}); 
} */

</script> 