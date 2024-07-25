<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.Permission"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<table>
	<tr><th >Available Permisssions</th><th></th><th>Assign Permisssions</th></tr>
	<tr>
		<td>
		<select path="pid" multiple class="select-list available2" size="10">
		
		<!--<?php	
		foreach($permissions as $p) {
			$found = false;
			foreach($userPerms as $up) {
				if($up->pid.""===$p->pid."") {
					$found = true;
					break;
				}
			}
			if(!$found) {
				echo "<option value='".$p->pid."' >".$p->pname."</option>";
			}
		}
		?>
		-->
		<%
		//PermissionService permissionService= new PermissionServiceImpl();
		List<Permission> permissionList=(List)request.getAttribute("permissionList");
		
			if(permissionList!=null && permissionList.size()>0){
				for(Permission permission:permissionList){%>
					<option value="<%=permission.getPid() %>"><%= permission.getPname() %></option>
				<%}
			}
			
			%>
		</select>
	</td><td><input type="button" value=">>" onclick="addToAssignList(2)"> <br>
		<input type="button" value="<<" onclick="removeFromAssignList(2)"> </td>
		
	<td>
	<%
	StringBuffer pids = new StringBuffer();
	String pidsStr = "";
	%>
		<select name="apid" multiple class="select-list assign2" size="10">
		
		<%
			int x=0;
			Set<Permission> userPermissions = (Set)request.getAttribute("userPermissions");
			if(userPermissions!=null && userPermissions.size()>0) {
				for(Permission permission : userPermissions) {
					++x;
					if(x>1) pids.append(",");
					pids.append(permission.getPid());	
					%>
					<option value="<%=permission.getPid() %>" selected> <%=permission.getPname() %> </option>
					<%
				}
			}
			System.out.println("RIDS+++++++++++++++"+pids.toString());
			pidsStr = pids.toString();
		%>
		</select>
		</td></tr>
		<tr><td colspan=2></td><td><input type="hidden" name="assignIds2" class="assignIds2" value="<%=pidsStr %>" >
			
			</td></tr>
		<% System.out.println("RIDS============"+pids.toString()); %>
	</table>