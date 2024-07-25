<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.SmsTemplate"%>
<form  name="frm" >
<input type="button" value="Show All Sms Template" onclick="showSmsTemplate()"/>
<input type="button" value="Add Sms Template" onclick="addSmsTemplate()"/>
<input type="button" value="Delete Sms Template" onclick="delAllTemplate()"/>



<div class="searchDiv">

<table border="0">
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"></td>
		<td><input type="submit" value="Search" onclick="searchSmsTemplate()"></td></tr>
</table>
</div>

<table  cellpadding="0" cellspacing="1" class="viewTable">
<tr><td colspan="6" align="left"><jsp:include page="../../common/pagination.jsp"/>
</td></tr>

<tr class="tableHead">
<th width="25" onclick="checkAll()">All<input type="checkbox" name="checkall" value="">&nbsp;</th>
<th>Sl.No.</th>
<th>Template</th>
<th>For</th>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="tid" value=""/></th>
<th width="150">Actions</th>
</tr>

<%
List l=(List)request.getAttribute("smsTemplate");
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
	
	SmsTemplate id=(SmsTemplate)i.next();
	++cc;	
int tid=id.getTid();
String type=id.getType();
if(type.equals("B"))
	type="Banker";
if(type.equals("C"))
	type="Customer";
if(type.equals("AO"))
	type="AO-Banker";
if(type.equals("A"))
	type="Admin";	
String template=id.getTemplates();
String clasStr="odd";
if(cc%2==0) clasStr="even";
%>
<tr class="<%=clasStr %>">
<td width="10"><input type="checkbox" name="chckbox" value="<%=tid%>" id="<%=tid %>" /></td>
<td><b><%=cc %></b></td>
<td width="1000"><b><a href="javascript:editSmsTemplate('<%=tid%>')"><%=template%></a></b></td>
<td width="100"><b><%=type%></b></td>

<td > <a href="javascript:editSmsTemplate('<%=tid %>')"><img src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:deletesmstemplate('<%=tid %>')"><img src="images/del-icon.png" title="Delete"/></a> </td>
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



function addSmsTemplate(){
	document.frm.action="addSmsTemplate.htm";
	document.frm.tid.value=""+0;
	document.frm.submit();
}
function refresh()
{
	document.frm.action="smsTemplate.htm";
	document.frm.submit();
}
function showPage(pageNo)
{
	document.frm.action="smsTemplate.htm";
	document.frm.page.value = pageNo;
	document.frm.submit();
}
function selectPage()
{
	document.frm.action="smsTemplate.htm";
	document.frm.submit();
}
function searchSmsTemplate(){
	document.frm.action="searchSmsTemplate.htm";
	document.frm.submit();
}
function viewAll()
{
	document.frm.action="smsTemplate.htm";
	document.frm.submit();
}
function editSmsTemplate(id)
{
	document.frm.action="addSmsTemplate.htm";
	document.frm.tid.value=""+id;
	document.frm.submit();
}

function deletesmstemplate(id)
{

	

	if(confirm("Are you sure want to delete this!")){
	document.frm.action="deleteSmsTemplate.htm";
	var obj = document.getElementById(id);
	obj.checked = true;
	document.frm.submit();
	}
}

function delAllTemplate(){
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
		   document.frm.action="deleteSmsTemplate.htm";
		 
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




</script>