<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.Permission"%><html>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<table>
	<tr><th >Available Permisssions</th><th></th><th> Assign Permisssions </th></tr>
	<tr>
		<td>
		<select name="pid" multiple class="select-list available"  >							
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
	</td>
	<td><input type="button" value=">>" onclick="addToAssignList(1)"> <br>
		<input type="button" value="<<" onclick="removeFromAssignList(1)"> </td>
	<td>
		<select name="apid" multiple="true" class="select-list assign">
		<!-- <?php
		$pids = "";
		$x = 0;
		if(count($rolePerms)>0) {
		foreach($rolePerms as $rp) {
			++$x;
			if($x>1) $pids .= ",";
			$pids .= $rp->pid;
			echo "<option value='".$rp->pid."' >".$rp->pname."</option>";
		}
		}
		?> -->
		<%
			StringBuffer pids=new StringBuffer();
			int  x=0;
			Set<Permission> rolePermissions=(Set)request.getAttribute("rolePermissions");
		if(rolePermissions!=null && rolePermissions.size()>0){
		for(Permission permission:rolePermissions){
				++x;
				if(x>1)
					pids.append(",");
				pids.append(permission.getPid());	
				%>
				<option value="<%=permission.getPid() %>" > <%=permission.getPname() %></option>
			<%}
		}
		%>
		</select>
	</td></tr>
	<tr><td colspan=2></td><td><input type="hidden" name="assignIds" class="assignIds" value="<%=pids.toString() %>" / ></td></tr>
</table>