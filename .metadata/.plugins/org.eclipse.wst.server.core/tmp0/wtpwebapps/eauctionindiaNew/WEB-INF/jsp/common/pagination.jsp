
<div class="pagesDiv">
	<div class="left">
	<%
	String currentPage = request.getParameter("page");
	int curPage = 1;
	try {
		curPage = Integer.parseInt(currentPage);
	} catch(Exception ex) {}
	int pages = 0;
	try {
		pages = (Integer)request.getAttribute("noOfPages");
	} catch(Exception ex) {}
	int totalRecs = 0;
	try {
		totalRecs = (Integer)request.getAttribute("noOfRows");
	} catch(Exception ex) {}
	out.print("Total: "+totalRecs+".");
	%>
	</div>
	<div class="center">
	<%
	int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
	%>
	Show per Page <input type="text" name="rowsPerPage" size="1" value="<%=rowsPerPage %>" />
	<a href="javascript:;" onclick="refresh()">Refresh</a> &nbsp; 
	</div>
	<div class="right">
<%

if(curPage>1) out.print("<a href='?rowsPerPage="+rowsPerPage+"&page="+(curPage-1)+"'>Previous</a> &nbsp;");
out.print("Page <select name='page' onchange='selectPage()'>");
String selStr = "";
for(int x=0;x<pages;x++) {
	selStr = "";
	if(x==(curPage-1)) selStr = "selected";
	//out.print("<a href='?page="+(x+1)+"'>"+(x+1)+"</a> &nbsp;");
	out.print("<option value='"+(x+1)+"' "+selStr+">"+(x+1)+"</option>");
}
out.print("</select> of "+pages+" &nbsp;");
if(curPage<pages) out.print("<a href='?rowsPerPage="+rowsPerPage+"&page="+(curPage+1)+"'>Next</a> &nbsp;");
%>
	</div>
</div> 
<div class="clear"></div>
