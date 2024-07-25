<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>  
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="com.zedapp.eauction.model.User"%>
<form  name="frm" >
<input type="button" value="Add User" onclick="addUser()"/>
<input type="submit" value="View All" onclick="viewAll()">


<div class="searchDiv">

<table>
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"/></td>
		<td><input type="submit" value="Search" onclick="searchUser()"></td>
		</tr>
</table>
</div>

<table border="0"  cellpadding="0" cellspacing="0" class="viewTable">
<tr><td colspan="4" align="left"><jsp:include page="../../common/pagination.jsp"/>
</td></tr>
</table>
<table border="0"  cellpadding="0" cellspacing="1" class="outerTable">
<tr >
<th width="25">&nbsp;</th>
<th>Sl.No.</th>
<th>User Name</th>
<th>Unique Id</th>
<th>Mobile</th>
<th>User Type</th>
<th>Last Login</th>
<th>Otp code</th>
<th>Status</th><input type="hidden" name="cmd" value=""/>
<input type="hidden" name="userId" value=""/></th>
<th width="150">Actions</th>
</tr>
<%
List l=(List)request.getAttribute("users");
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
	
	User id=(User)i.next();
	++cc;	
int userId=id.getUserId();
String name=id.getUserName();
String uniqueId=id.getUuid();
String mobile=id.getMobileNo();
String otp = id.getOtpCode();
String type=id.getUserType();

if(type.equals("B"))
	type="Banker";
if(type.equals("C"))
	type="Customer";
if(type.equals("AO"))
	type="AO-Banker";
if(type.equals("A"))
	type="Admin";
Date lastLogin=id.getLastLoginDate();
String status=id.getStatus();
if(status==null) status="I";
if(status.equals("A"))
	status="Active";
if(status.equals("I"))
	status="In Active";
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="5"><input type="checkbox" name="chckbox" value="<%=userId%>" id="<%=userId %>" /></td>
<td><b><%=cc %></b></td>
<td width="95"><b><a href="javascript:editUser('<%=userId%>')"><%=name%></a></b></td>
<td width="100"><b><%=uniqueId %></b></td>
<td width="100"><b><%=mobile %></b></td>
<td width="100"><b><%=type %></b></td>
<td width="100"><b><%=lastLogin %></b></td>
<td width="100"><b><%=otp %></b></td>
<td width="100"><b><%=status %></b></td>
<td > <a href="javascript:editUser('<%=userId %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:delUser('<%=userId %>')"><img src="images/del-icon.png" title="Delete"/></a> </td>
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
function addUser(){
	document.frm.action="addUser.htm";
	document.frm.userId.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="users.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="users.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="users.htm";
	document.frm.submit();
}
function searchUser(){
	document.frm.action="searchUser.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="users.htm";
	document.frm.submit();
}
function editUser(id)
{
	document.frm.action="addUser.htm";
	document.frm.userId.value=""+id;
	document.frm.submit();
}

function delUser(id)
{
	document.frm.action="deleteUser.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
}


</script>