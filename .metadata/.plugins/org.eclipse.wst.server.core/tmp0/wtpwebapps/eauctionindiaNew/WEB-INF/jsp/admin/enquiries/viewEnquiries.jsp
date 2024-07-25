<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.common.util.DatesUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.zedapp.eauction.model.Executive"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.zedapp.eauction.model.Enquiry"%>

<%@page import="java.util.*"%>

<%@page import="com.zedapp.common.util.PermissionUtil"%>

<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>
<form name="listform" >
<%if(PermissionUtil.hasUserPermission(request,"ADD_ENQUIRY")){ %>
<input type="button" value="Add Enquiries" onclick="addEnquiries()"/>
<%} %>

<div class="searchDiv">

<table>
	<tr><th>Search Keyword : </th><td><input type="text" name="keyword"/></td>
		<td><input type="button" value="Search" onclick="searchEnquiry()"></td>
		<th>Select Enquiry :</th>
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
					/* if(auction.getStatus().equals("P")){ */
					%>
						<option value="<%=auction.getAid() %>"><%= auction.getProject().getProjName() %></option>
					<%}
				}
				
				%>
   			</select>
			</td></tr>
			<tr><td>
		
		
		</tr>
</table>
</div>
<input type="hidden" name="cmd" value=""/>
<input type="hidden" name="eid" value=""/>


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
<th>Contacts</th>
<!-- <th>Email</th> -->
<th>Type Of Enquiry </th>
<th>Response Given</th>
<th>Interested In Property/Location</th>
<th>Executive Name</th>
<th>Remarks</th>
<%User user=PortalUtil.getUser(request);
if(user.getUserType().equals("A")){
%>
</th>
<th width="150">Actions</th>
<%} %>
</tr>

<%
List l=(List)request.getAttribute("enquiries");
int cc=0;
String currentPage = request.getParameter("page");
int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
int curPage = 1;
try {
	curPage = Integer.parseInt(currentPage);
	
} catch(Exception ex) {}

cc=(curPage-1)*rowsPerPage+cc;

System.out.println("List===>"+l);
if(l!=null && l.size()>0){
Iterator i=l.iterator();


while(i.hasNext())
{
	++cc;
	Enquiry id=(Enquiry)i.next();
	
int eid=id.getEid();

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
<td width="10"><input type="checkbox" name="Delcheck" value="<%=eid%>" id="<%=eid %>" /></td>
<td><b><%=cc %></b></td> 
<td width="100"><b><%=DatesUtil.getFormatDMY(id.getEnquiryDt()) %></b></td>
<td width="95"><b><%=name%></b></td>
<td width="100"><b><%=mobile %></b><br><b><%=email %></b></td>
<%-- <td width="100"><b><%=email %></b></td> --%>
<td width="100"><b><%=enquiryType%></b></td>
<td width="100"><b><%=responseGiven%></b></td>
<td width="100"><b><%=propertyIntrested%>/<%=locationIntrested%></b></td>

<td width="100"><b><%=exname%>
<td width="100"><b><%=remarks%></b></td>
<%if(user.getUserType().equals("A")){ %>
<td > <a href="javascript:editEnquiry('<%=eid %>')"><img  src="images/edit-icon.png" title="Edit"/></a> 
	/ <a href="javascript:delEnquiry('<%=eid %>')"><img  src="images/del-icon.png" title="Delete"/></a> </td>
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
<script type="text/javascript">
var f = document.forms["listform"];
function addEnquiries(){
	
	f.action="addEnquiry.htm";
	f.eid.value=""+0;
	f.submit();
}
function refresh()
{
	f.action="enquiries.htm";
	f.submit();
}
function showPage(pageNo)
{
	f.action="enquiries.htm";
	f.page.value = pageNo;
	f.submit();
}
function selectPage()
{
	f.action="enquiries.htm";
	f.submit();
}
function searchEnquiry(){
	f.action="searchEnquiry.htm";
	f.submit();
}
function viewAll()
{
	f.action="enquiries.htm";
	f.submit();
}
function editEnquiry(id)
{
	f.action="addEnquiry.htm";
	f.eid.value=""+id;
	f.submit();
}

function delEnquiry(id)
{
	if(confirm("Are you sure want to delete this")){
		//alert(id);
		f.action="deleteEnquiry.htm";
		var obj = document.getElementById(id);
		obj.checked = true;
		f.submit();
	}
}
function showAuctionDetails(){
	
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
					$("#quotation").val($("#minBid").val()); */
		}
	}); 
}

</script>