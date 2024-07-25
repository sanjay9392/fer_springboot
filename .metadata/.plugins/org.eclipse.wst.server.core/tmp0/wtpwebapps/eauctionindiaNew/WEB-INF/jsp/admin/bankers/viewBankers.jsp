<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Bankers"%>

<%@page import="com.zedapp.common.util.PermissionUtil"%>
<form  name="frm" >
<%
if(PermissionUtil.hasUserPermission(request,"ADD_BANK")){ %>
<input type="button" value="Add Bankers" onclick="addBankers()"/>
<%} %>

<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="submit" value="Search" onclick="searchBankers()"></td></tr>
</table>
</div>

<table cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left">
<jsp:include page="../../common/pagination.jsp"/>

<tr class="tableHead">
<th width="25">&nbsp;</th>
<th>Sl.No.</th>
<th>Bank Name</th>
<th>Address</th>
<th>Street</th>
<th>City</th>
<th>State</th>
<th>Pincode</th>
<th>Country</th>
<th>Registered</th>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="bid" value=""/></th>
<%if(PermissionUtil.hasUserPermission(request,"UPDATE_BANK") || PermissionUtil.hasUserPermission(request,"DELETE_BANK")){ %>
<th width="150">Actions</th>
<%} %>
</tr>
</td></tr>
<%
List l=(List)request.getAttribute("bankers");
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
	
	Bankers id=(Bankers)i.next();
	++cc;	
int bid=id.getBid();
String name=id.getBankName();
String addr=id.getAddr();
String street=id.getStreet();
String city=id.getCity();
String state=id.getState();
String pincode=id.getPincode();
String country=id.getCountry();
String registered = (id.getRegistered()!=null)?(id.getRegistered()):"N";
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="10"><input type="checkbox" name="chckbox" value="<%=bid%>" id="<%=bid %>" /></td>
<td><b><%=cc %></b></td>
<td width="100"><b><%=name%></b></td>
<td width="100"><b><%=addr%></b></td>
<td width="100"><b><%=street%></b></td>
<td width="100"><b><%=city%></b></td>
<td width="100"><b><%=state%></b></td>
<td width="100"><b><%=pincode%></b></td>
<td width="100"><b><%=country%></b></td>
<td width="95"><b><%=registered%></b></td>
<td > 
<%
if(PermissionUtil.hasUserPermission(request,"UPDATE_BANK")) {
%>
<a href="javascript:editBankers('<%=bid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
<%
}
if(PermissionUtil.hasUserPermission(request,"DELETE_BANK")) {
%> <a href="javascript:delBankers('<%=bid %>')"><img src="images/del-icon.png" title="Delete"/></a> 
<%} %>
</td>
</tr>
<%
}
}
else {
	out.println("<tr><td colspan='4'><b>No Bank found</b></td></tr>");
}
%>

</table>

</form>

<script>
function addBankers()
{
	document.frm.action="addBankers.htm";
	document.frm.bid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="bankers.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="bankers.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="bankers.htm";
	document.frm.submit();
}
function searchBankers()
{
	document.frm.action="searchBankers.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="bankers.htm";
	document.frm.submit();
}
function editBankers(id)
{
	document.frm.action="addBankers.htm";
	document.frm.bid.value=""+id;
	document.frm.submit();
}

function delBankers(id)
{
	if(confirm("Are you sure want to delete this")){
	document.frm.action="deleteBankers.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
	}
}

</script>