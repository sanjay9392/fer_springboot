<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.Role"%>
<%@page import="java.util.List"%>
<center>
	<table border="0" class="maincontent-table">
		<tr>
			<td width="880" valign="top" id="center-content">
			<div class="content">
			<div>
			</div>
			<!--edit page-->
				
			<div id="a">
				<div class="msg"></div>
					
				<div class="table">
				<table border="0">
				<tr><th colspan=2>Enter Role Details <form:hidden path="rid" /></th></tr>
				<tr><td>Role name <strong class="red">*</strong> </td><td> 
				<form:input path="rname" /> </td></tr>
				<tr><td>Role Code <strong class="red">*</strong> </td><td> 
				<form:input path="rcode" /> </td></tr>
				<tr><td>Description </td><td> <form:textarea path="rdescr" cols="20" rows="4" /> </td></tr>
				
				</table>
				</div>
	               
				</div>
				<!--edit page-->
			</div>
			</td>
			</tr>
	</table>
	
	</center>