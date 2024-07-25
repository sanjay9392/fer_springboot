<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>  
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Role"%>
<form  name="frm" >
<input type="button" value="Add Role" onclick="addRole()"/>
<input type="submit" value="View All" onclick="viewAll()">


<div class="searchDiv">

<table>
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"/></td>
		<td><input type="submit" value="Search" onclick="searchRole()"></td>
		</tr>
</table>
</div>

<table border="0"  cellpadding="0" cellspacing="0" class="viewTable">
<tr><td colspan="6" align="left"><jsp:include page="../../common/pagination.jsp"/>
</td></tr>
</table>
<table border="0"  cellpadding="0" cellspacing="1" class="outerTable">
<tr >
<th width="25">&nbsp;</th>
<th>Sl.No.</th>
<th>Role Name</th>
<th>Description</th><input type="hidden" name="cmd" value=""/>
<input type="hidden" name="rid" value=""/></th>
<th width="150">Actions</th>
</tr>
<%
List l=(List)request.getAttribute("roles");
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
	
	Role id=(Role)i.next();
	++cc;	
int rid=id.getRid();
String name=id.getRname();
String descr=id.getRdescr();
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="5"><input type="checkbox" name="chckbox" value="<%=rid%>" id="<%=rid %>" /></td>
<td><b><%=cc %></b></td>
<td width="95"><b><a href="javascript:editRole('<%=rid%>')"><%=name%></a></b></td>
<td width="100"><b><%=descr %></b></td>
<td > <a href="javascript:editRole('<%=rid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:delRole('<%=rid %>')"><img src="images/del-icon.png" title="Delete"/></a> </td>
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
function addRole(){
	document.frm.action="addRole.htm";
	document.frm.rid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="roles.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="roles.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="roles.htm";
	document.frm.submit();
}
function searchRole(){
	document.frm.action="searchRole.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="roles.htm";
	document.frm.submit();
}
function editRole(id)
{
	document.frm.action="addRole.htm";
	document.frm.rid.value=""+id;
	document.frm.submit();
}

function delRole(id)
{
	document.frm.action="deleteRole.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
}


</script>