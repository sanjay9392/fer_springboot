<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Executive"%>
<form  name="frm" >
<input type="button" value="Add Executives" onclick="addExecutive()"/>


<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="submit" value="Search" onclick="searchExecutive()"></td></tr>
</table>
</div>

<table  cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left">
<jsp:include page="../../common/pagination.jsp"/>
</td></tr>
<tr class="tableHead">
<th width="25">&nbsp;</th>
<th>Sl.No.</th>
<th>Executive Name</th>
<th>Mobile</th>
<th>Email</th>
<th>Status</th>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="exid" value=""/></th>
<th width="150">Actions</th>
</tr>
</td></tr>
<%
List l=(List)request.getAttribute("executive");
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
	
	Executive id=(Executive)i.next();
	++cc;	
int exid=id.getExid();
String name=id.getExname();
String mobile=id.getMobile();
String email=id.getEmail();
String status=id.getStatus();
if(status.equals("A"))
	status="Active";
if(status.equals("I"))
	status="In Active";
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="10"><input type="checkbox" name="chckbox" value="<%=exid%>" id="<%=exid %>" /></td>
<td><b><%=cc %></b></td>
<td width="100"><b><a href="javascript:editExecutive('<%=exid%>')"><%=name%></a></b></td>
<td width="100"><b><%=mobile%></b></td>
<td width="100"><b><%=email%></b></td>
<td width="100"><b><%=status%></b></td>

<td > <a href="javascript:editExecutive('<%=exid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:delExecutive('<%=exid %>')"><img src="images/del-icon.png" title="Delete"/></a> </td>
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
function addExecutive(){
	
	document.frm.action="addExecutive.htm";
	document.frm.exid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="executive.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="executive.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="executive.htm";
	document.frm.submit();
}
function searchExecutive(){
	document.frm.action="searchExecutive.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="executive.htm";
	document.frm.submit();
}
function editExecutive(id)
{
	document.frm.action="addExecutive.htm";
	document.frm.exid.value=""+id;
	document.frm.submit();
}

function delExecutive(id)
{
	if(confirm("Are you sure want to delete this")){
	document.frm.action="deleteExecutive.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
	}
}

</script>