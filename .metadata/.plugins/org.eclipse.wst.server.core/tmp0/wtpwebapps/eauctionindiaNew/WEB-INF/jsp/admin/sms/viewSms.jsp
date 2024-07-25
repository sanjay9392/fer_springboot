<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Sms"%>
<%@page import="java.util.Date"%>
<%@page import="com.zedapp.common.util.DatesUtil"%>
<form  name="frm" >
<input type="button" value="Show All Sms " onclick="showSms()"/>
<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="submit" value="Search" onclick="searchSms()"></td></tr>
</table>
</div>

<table  cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left">
<jsp:include page="../../common/pagination.jsp"/>

<tr class="tableHead">

<th width="25">Sl.No.</th>
<th>Send To</th>
<th>Send Date</th>
<th>Info From Provider</th>
<th>Result</th>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="sid" value=""/></th>
</tr>

<%  
List l=(List)request.getAttribute("sms");
if(l!=null &&l.size()>0){
Iterator i=l.iterator();
int cc=0;
String currentPage = request.getParameter("page");
int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
int curPage = 1;
try {
	curPage = Integer.parseInt(currentPage);
	
} catch(Exception ex) {}

cc=(curPage-1)*rowsPerPage+cc;

while(i.hasNext())
{
	
	Sms id=(Sms)i.next();
	++cc;	
int sid=id.getSid();
String  sendToId=id.getUname();
Date sendDt=id.getSendDt();
String sendToType=id.getSendToType();
String smsResult=id.getSmsResult();
String uType=sendToType;
if(uType.equals("A"))
	uType="Admin";
if(uType.equals("AO"))
	uType="AO-Banker";
if(uType.equals("B"))
	uType="Banker";
if(uType.equals("C"))
	uType="Participant";
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td><b><%=cc %></b></td>
<td width="100"><b><%=sendToId%></b></td>
<td width="100"><b><%=DatesUtil.getFormatDMYHMSA(sendDt)%></b></td>
<td width="200"><b><%=smsResult %></b></td>
<td width="100"><b><%=uType %></b></td>

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
function refresh()
{
	document.frm.action="sms.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="sms.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="sms.htm";
	document.frm.submit();
}
function searchSms()
{	
	document.frm.action="searchSms.htm";
	document.frm.submit();
}
function showSms()
{	
	document.frm.action="sms.htm";
	document.frm.submit();
}

</script>