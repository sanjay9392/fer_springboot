<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.Role"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<table>
	<tr><th> Available Roles </th><th></th><th> Assign Roles </th></tr>
	<tr><td>
		<select path="rid" multiple class="select-list available" size="10">
		
		<!--<?php	
		foreach($roles as $r) {
			$found = false;
			foreach($userRoles as $ur) {
				if($ur->rid.""===$r->rid."") {
					$found = true;
					break;
				}
			}
			if(!$found) {
				echo "<option value='".$r->rid."' >".$r->rname."</option>";
			}
		}
		?>
		-->
		<%
			//RoleService roleService= new RoleServiceImpl();
			List<Role> roleList=(List)request.getAttribute("roleList");
			if(roleList!=null && roleList.size()>0){
				for(Role role:roleList){%>
					<option value="<%=role.getRid() %>" ><%= role.getRname()%></option>
				<%}
			}
			
			%>
		</select>
	</td><td><input type="button" value=">>" onclick="addToAssignList(1)"> <br>
		<input type="button" value="<<" onclick="removeFromAssignList(1)"></td>
		
		<td> <select name="arid" multiple class="select-list assign" size="10">
			<%
			StringBuffer rids=new StringBuffer();
			int  x=0;
			Set<Role> userRoles=(Set)request.getAttribute("userRoles");
			if(userRoles!=null && userRoles.size()>0){
			for(Role role:userRoles){
				if(!role.getRcode().equals("C")){
					++x;
					if(x>1)
						rids.append(",");
					rids.append(role.getRid());	
		%>
			
				<option value="<%=role.getRid() %>" selected><%=role.getRname() %></option>
			<%}}
		}
			String ridsList=rids.toString();
			System.out.println("RIDS+++++++++++++++"+ridsList);
		%>
			</select>
	</td>
	</tr>
	<tr><td colspan=2></td><td><input type="hidden" name="assignIds" class="assignIds" value="<%=rids.toString() %>"/></td></tr>
</table>
