<%@page import="com.zedapp.eauction.model.Executive"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Enquiry"%>

<%@page import="java.util.*"%>

<%@page import="com.zedapp.common.util.PermissionUtil"%>

<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%><form  name="frm" >
<%if(PermissionUtil.hasUserPermission(request,"ADD_ENQUIRY")){ %>
<input type="button" value="Add Enquiries" onclick="addEnquiries()"/>
<%} %>

<div class="searchDiv">

<table>
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"/></td>
		<td><input type="submit" value="Search" onclick="searchEnquiry()"></td></tr>
</table>
</div>

<table border="0"  cellpadding="0" cellspacing="0" class="outerTable">
<tr><td colspan="6" align="left"><jsp:include page="../../common/pagination.jsp"/>
</td></tr>
</table>
<table border="0"  cellpadding="0" cellspacing="1" class="viewTable">
<tr >
<th width="25">&nbsp;</th>
<th>Sl.No.</th>
<th>Enquiry Date</th>
<th>Name</th>
<th>Contact No</th>
<th>Email</th>
<th>Type Of Enquiry </th>
<th>Response Given</th>
<th>Intrested In Property/Locaction</th>
<th>Executive Name</th>
<th>Remarks</th>
<%User user=PortalUtil.getUser(request);
if(user.getUserType().equals("A")){
%>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="eid" value=""/></th>
<th width="150">Actions</th>
<%} %>
</tr>
<%
List l=(List)request.getAttribute("enquiries");
if(l!=null){
Iterator i=l.iterator();
int cc=0;
while(i.hasNext())
{
	
	Enquiry id=(Enquiry)i.next();
	++cc;	
int eid=id.getEid();
Date enquiryDt=id.getEnquiryDt();
String name=id.getName();
String mobile=id.getMobile();
String email=id.getEmail();
String exname = id.getExecutiveName();
String remarks =id.getRemarks();
String enquiryType=id.getEnquiryType();
String responseGiven=id.getResponseGiven();
String propertyIntrested=id.getPropertyIntrested();
String locationIntrested=id.getLocationIntrested();
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="10"><input type="checkbox" name="chckbox" value="<%=eid%>" id="<%=eid %>" /></td>
<td><b><%=cc %></b></td>
<td width="100"><b><%=enquiryDt%></b></td>
<td width="95"><b><%=name%></b></td>
<td width="100"><b><%=mobile %></b></td>
<td width="100"><b><%=email %></b></td>
<td width="100"><b><%=enquiryType%></b></td>
<td width="100"><b><%=responseGiven%></b></td>
<td width="100"><b><%=propertyIntrested%>/<%=locationIntrested%></b></td>

<td width="100"><b><%=exname%>
<td width="100"><b><%=remarks%></b></td>
<%if(user.getUserType().equals("A")){ %>
<td > <a href="javascript:editEnquiry('<%=eid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:delEnquiry('<%=eid %>')"><img src="images/del-icon.png" title="Delete"/></a> </td>
<%} %>	
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
function addEnquiries(){
	document.frm.action="addEnquiry.htm";
	document.frm.eid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="enquiries.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="enquiries.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="enquiries.htm";
	document.frm.submit();
}
function searchEnquiry(){
	document.frm.action="searchEnquiry.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="enquiries.htm";
	document.frm.submit();
}
function editEnquiry(id)
{
	document.frm.action="addEnquiry.htm";
	document.frm.eid.value=""+id;
	document.frm.submit();
}

function delEnquiry(id)
{
	if(confirm("Are you sure want to delete this")){
	document.frm.action="deleteEnquiry.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
	}
}

</script>