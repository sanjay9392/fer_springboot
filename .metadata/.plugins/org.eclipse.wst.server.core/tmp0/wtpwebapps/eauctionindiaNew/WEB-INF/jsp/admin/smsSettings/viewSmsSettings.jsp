<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.SmsSettings"%>

<form  name="frm" >
<input type="button" value="Show All Sms Settings" onclick="showSmsSettings()"/>
<input type="button" value="Add Sms Settings" onclick="addSmsSettings()"/>



<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="submit" value="Search" onclick="searchSmsSettings()"></td></tr>
</table>
</div>

<table  cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left">
<jsp:include page="../../common/pagination.jsp"/>

<tr class="tableHead">
<th width="25">&nbsp;</th>
<th>Sl.No.</th>
<th>URL</th>
<th>Credentials</th>
<th>Status</th>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="sid" value=""/></th>
<th width="150">Actions</th>
</tr>

<%
List l=(List)request.getAttribute("smsSettings");
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
	
	SmsSettings id=(SmsSettings)i.next();
	++cc;	
int sid=id.getSid();
String smsUrl=id.getSmsUrl();
String uname=id.getUname();
String settingType=id.getStatus();
if(settingType.equals("I"))
	settingType="InActive";
if(settingType.equals("A"))
	settingType="Active";

	
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="10"><input type="checkbox" name="chckbox" value="<%=sid%>" id="<%=sid %>" /></td>
<td><b><%=cc %></b></td>
<td width="1000"><b><a href="javascript:editSmsSettings('<%=sid%>')"><%=smsUrl%></a></b></td>
<td width="100"><b><%=uname%></b></td>
<td width="100"><b><%=settingType%></b></td>

<td > <a href="javascript:editSmsSettings('<%=sid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:delSmsSettings('<%=sid %>')"><img src="images/del-icon.png" title=Delete"/></a> </td>
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
function addSmsSettings(){
	
	document.frm.action="addSmsSettings.htm";
	document.frm.sid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="smsSettings.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="smsSettings.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="smsSettings.htm";
	document.frm.submit();
}
function searchSmsSettings()
{	
	
	document.frm.action="searchSmsSettings.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="smsSettings.htm";
	document.frm.submit();
}
function editSmsSettings(id)
{
	document.frm.action="addSmsSettings.htm";
	document.frm.sid.value=""+id;
	document.frm.submit();
}

function delSmsSettings(id)
{
	if(confirm("Are you sure want to delete this")){
	document.frm.action="deleteSmsSettings.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
	}
}

</script>