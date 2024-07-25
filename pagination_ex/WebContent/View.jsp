<%@ page import="java.util.*,com.java.dao.*,com.javatpoint.beans.*"%>
<%

	int pageIndex = Integer.parseInt(request.getParameter("page"));
	int totalRecordsPerPage = 5;
	
	//To get the start index
	int startIndex = 1;
	if(pageIndex!=1){
	pageIndex=pageIndex-1;
	startIndex=pageIndex*totalRecordsPerPage+1;
	}
	
	//To get the employees based on the start index
	List<Emp> list=EmpDao.getRecords(startIndex,totalRecordsPerPage);
	
	//To display data in the tabular format
	out.print("<h1>Page No: "+request.getParameter("page")+"</h1>");
	out.print("<table border='1' cellpadding='4' width='60%'>");
	out.print("<tr><th>Id</th><th>Name</th><th>Salary</th>");
	for(Emp e:list){
		out.print("<tr><td>"+e.getId()+"</td><td>"
	+e.getName()+"</td><td>"+e.getSalary()+"</td></tr>");
	}
	out.print("</table>");
	
	//To get the total records count and pageNumberCount
	int totalRecordsCount = EmpDao.getRecordsCount();
	int pageNumbers = totalRecordsCount / totalRecordsPerPage;
	if(totalRecordsCount > pageNumbers*totalRecordsPerPage){
		pageNumbers++;
	}
	
	//To display page numbers dynamically
%>
<% 
	for(int index=1; index<=pageNumbers; index++){
		 if(index == Integer.parseInt(request.getParameter("page"))){
			  out.println(index);
		  }else{
			  String nextPageLink = "View.jsp?page="+ index;
			  out.print("<a href = '"+ nextPageLink + "'>"+index+"</a>");
		  }
	}
%>