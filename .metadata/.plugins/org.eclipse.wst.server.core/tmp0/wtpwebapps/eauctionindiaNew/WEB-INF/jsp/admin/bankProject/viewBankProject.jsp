<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.common.util.DatesUtil"%>
<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%@page import="com.zedapp.common.util.PermissionUtil"%>

<form  name="frm" >
<%if(PermissionUtil.hasUserPermission(request,"VIEW_AUCTION")){ %>
<input type="button" value="Show All Projects" onclick="ShowAllProject()"/>
<input type="button" value="Show Live Projects" onclick="showLiveProject()"/>
<input type="button" value="Show Future Projects" onclick="showFutureProject()"/>
<input type="button" value="Show Closed Projects" onclick="closedProject()"/>
<%}if(PermissionUtil.hasUserPermission(request,"ADD_AUCTION")){ %>
<input type="button" value="Add BankProjects" onclick="addProject()"/>
<%} if(PermissionUtil.hasUserPermission(request,"DELETE_AUCTION")){%>
<input type="button" value="Delete All" onclick="deleteAllProject()"/>
<%} %>
<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="button" value="Search" onclick="searchProject()"></td></tr>
</table>

</div>
<table cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left"><jsp:include page="../../common/pagination.jsp"/>
</td></tr>

<tr class="tableHead">
<th width="25" onclick="checkAll()">All<input type="checkbox" name="checkall" value="">&nbsp;</th>
<th>Sl.No.</th>
<th>Bank</th>
<th>Project Name</th>
<th>No Of Participants</th>
<th>Auction Date</th>
<th>Reserve Price</th>
<th>EMD</th>
<th>Winner Details</th>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="pid" value=""/></th>
<%if(PermissionUtil.hasUserPermission(request,"UPDATE_AUCTION") || PermissionUtil.hasUserPermission(request,"DELETE_AUCTION")){ %>
<th width="150">Actions</th>
<%} %>
</tr>
<%
User loginUser=PortalUtil.getUser(request);
Set l=(Set)request.getAttribute("project");
int cc=0;
String currentPage = request.getParameter("page");
int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
int curPage = 1;
try {
	curPage = Integer.parseInt(currentPage);
	
} catch(Exception ex) {}

cc=(curPage-1)*rowsPerPage+cc;

if(l!=null && l.size()>0){
Iterator i=l.iterator();
//int cc=0;
while(i.hasNext())
{
	
	BankProjects id=(BankProjects)i.next();
	++cc;	
int pid=id.getPid();
String bankName=id.getBankers().getBankName();
Auction auction=id.getAuctionList().iterator().next();
Set<Customer> auctionCustomers=auction.getCutomerList();
String status=auction.getStatus();
String name=id.getProjName();
String minBid=id.getMinBid();
String emd=id.getEmd();
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="5"><input type="checkbox" name="chckbox" value="<%=pid%>" id="<%=pid %>" /></td>
<td><b><%=cc %></b></td>
<td width="100"><b><%=bankName %></b></td>
<td class='projName'><%=name %>
<%
	if(status.equals("C")){ %>
		<br> <a href='javascript:;' onclick='openWindow(<%=auction.getAid() %>)'>View/Print Details</a>
		<%} else {%> 
		<br> <a href='javascript:;' onclick='viewAuction(<%=auction.getAid() %>)' >View Auction</a>
	<%}%>
	</td>
	<td><%=auctionCustomers.size() %>
	<br> <a href='javascript:;' onclick='showParticipants(<%=auction.getAid() %>)'>View Participants</a>
	<div class='participantsList' id='p<%=auction.getAid() %>'>
	<div class='participant-title'>
	<div class='close-button'> <a href='javascript:' onclick='hideParticipants(<%=auction.getAid() %>)'>&nbsp; X &nbsp;</a></div>
	Participants List</div>
	<%
	if(auctionCustomers.size()>0 ) {
		for(Customer customer:auctionCustomers) {%>
			<div class='participant'><a style='color:#fff;text-decoration:none;' href='addCustomer.htm?cid=<%=customer.getCid() %>'><%=customer.getCname() %></a></div><div class='attendancesheet'><a href='attendanceSheet.htm?cid=<%=customer.getCid() %>'>viewAttendancesheet</a></div>
		<%}
	} else {%>
		<div class='participant'>No Participants</div>
	<%}%>
	</div>
	</td>
	<td><%=DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) %>
	<% String statStr = "Processing";
	if(status.equals("C")) statStr = "Closed";
	if(status.equals("S")) statStr = "Running";
	if(status.equals("CL")) statStr = "Canceled";
	%>
	<br><b><%=statStr %></b>
	</td>
	<td align='right'>Rs.<%=MoneyUtil.displayMoney(minBid) %></td>
	<td>Rs.<%=MoneyUtil.displayMoney(emd) %></td>
	<td>
	<%if(status.equals("C")) {%>
		<br><%=MoneyUtil.displayMoney(auction.getWinBidAmt()) %>
	<%} %>
	</td>

<td > 
<%
if(PermissionUtil.hasUserPermission(request,"UPDATE_AUCTION")) {
%>
<a href="javascript:editProject('<%=pid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
<%
}
if(PermissionUtil.hasUserPermission(request,"DELETE_AUCTION")) {
%> <a href="javascript:delProject('<%=pid %>')"><img src="images/del-icon.png" title="Delete"/></a> 
<%} %></td>
</tr>
<%
}
}
else {
	out.println("<tr><td colspan='4'>No Record found</td></tr>");
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

function addProject(){
	document.frm.action="addProject.htm";
	document.frm.pid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="project.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="project.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="project.htm";
	document.frm.submit();
}
function searchProject(){
	document.frm.action="searchProject.htm";
	document.frm.submit();
}
function ShowAllProject()
{
	document.frm.action="project.htm";
	document.frm.submit();
}
function showLiveProject(){
	document.frm.action="liveProjects.htm";
	document.frm.submit();
}
function showFutureProject(){
	document.frm.action="futureProjects.htm";
	document.frm.submit();
}
function closedProject(){
	document.frm.action="closedProjects.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="project.htm";
	document.frm.submit();
}
function editProject(id)
{
	document.frm.action="addProject.htm";
	document.frm.pid.value=""+id;
	document.frm.submit();
}

function delProject(id)
{
  if(confirm("Are you sure want to delete this")){
	document.frm.action="deleteProject.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
  }
	
}

function deleteAllProject(){
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
		   alert("Hi else...");
		   document.frm.action="deleteProject.htm";
		 
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
function viewAuction(aid) {
	window.location.href = "viewRunningAuction.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
function viewProject(aid) {
	window.location.href = "viewProjectDetails.htm?aid="+aid;
	//window.open("viewRunningAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
function openWindow(aid) {
	//window.open("<?php echo base_url(); ?>admin/BankProjects/viewPrintAuction/"+aid);
	window.open("viewPrintAuction.htm?aid="+aid,"","toolbar=no,location=no,menubar=no, scrollbars=1");
}
function showParticipants(aid) {
	//$(".participants").hide();
	$("#p"+aid).slideToggle();
}
function hideParticipants(aid) {
	$("#p"+aid).slideToggle();
}
</script>