<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.zedapp.eauction.model.Permission"%><html>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.model.Role"%>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<table border="0" class="maincontent-table">
	<tr>
		<td width="880" valign="top" id="center-content">
		<div class="content">
		<div>
		
		</div>
		<!--edit page-->
			
			<div id="a">
			<div class="msg"></div>
			<c:url var="saveRoleUrl" value="/saveRole.htm" />
			<form:form modelAttribute="role" method="POST" action="${saveRoleUrl}" onsubmit="return validateForm()" id="roleForm">
			
			<div class="editTable">
			<table border="0">
			<tr><td valign='top'>
			<div class="sliderkit tabs-standard">
					<div class="sliderkit-nav">
						<div class="sliderkit-nav-clip">
							<ul>							
								<li><a href="#" title="[link title]">Roles</a></li>
								<li><a href="#" title="[link title]">Permissions</a></li>
							</ul>
						</div>
					</div>
					<div class="sliderkit-panels">
						<div class="sliderkit-panel">
							<div class="sliderkit-news">
								<br></br>
								<jsp:include page="roleTab.jsp"></jsp:include>
							</div>
						</div>
						<div class="sliderkit-panel">
							<div class="sliderkit-news">
								<jsp:include page="rolePermTab.jsp"/>
							</div>
						</div>
					</div>
			</div>
			</td></tr>
			<div class="table">
			<table border="0">
			
				<tr>
				<td align="center" colspan="2"><input type="submit" id="save" value="Save"> &nbsp;&nbsp;
				<input type="button" id="cancel" value="Cancel" onclick="cancelRole()"></td>
				</tr>
			</table>
			</div>
			</div>
			
			<!--edit page-->
		</div>
		</td>
		</tr>
</table>

<!-- </center> -->
<style type="text/css">
.tabs-standard {
	height: 300px;
}
.tabs-standard .sliderkit-panels, .tabs-standard .sliderkit-panel {
	height: 260px;
}
</style>

<script src="js/external/jquery.easing.1.3.min.js" type="text/javascript"></script>
<script src="js/external/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="js/sliderkit/jquery.sliderkit.1.9.pack.js" type="text/javascript"></script>

<script type="text/javascript">

function cancelRole(){
	window.location.href = "roles.htm";
}
	var $ = jQuery;
	/*$(document).ready(function(){			
		$(".available option:selected").each(function(){
			var values += $(this).val()+",";
		});
		$(".assignIds").val(values);
		$(".available2 option:selected").each(function() {
			var values2 += $(this).val()+",";
		});
		$(".assignIds2").val(values2);
	});*/
	$(window).load(function(){ //$(window).load() must be used instead of $(document).ready() because of Webkit compatibility				
	 
				// Tabs > Standard
				$(".tabs-standard").sliderkit({
					auto:false,
					tabs:true,
					mousewheel:true,
					circular:true,
					panelfx:"none"
				});
	});

		function addToAssignList(sid) {			
			var s = "";
			if(sid && sid==2) s="2";
			$(".assign"+s).append($(".available"+s+" option:selected"));
			$(".available"+s+" option:selected").remove();
			var v = "";
			$(".assign"+s+" option").each(function() {
				v += $(this).val()+",";
			});
			$(".assignIds"+s).val(v);
		}
		function removeFromAssignList(sid) {
			var s = "";
			if(sid && sid==2) s="2";
			$(".available"+s).append($(".assign"+s+" option:selected"));
			$(".assign"+s+" option:selected").remove();
			var v = "";
			$(".assign"+s+" option").each(function() {
				v += $(this).val()+",";
			});
			$(".assignIds"+s).val(v);
		}
	</script>
</form:form>
<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	
    $("#roleForm").validate({
        onsubmit: false,
        onfocusout: false,
        onkeyup: false,
        onclick:false,
        rules: {
    	rname: {required:true, minlength:3, maxlength:100, accept:"[a-zA-Z0-9 ]+"}
        },
        messages: {
        	rname: {required:"Name is required", minlength:"Name must be of atleast 3 chars", maxlength:"max 100 chars is allowed", accept:"Name is not valid"}
        }
    });

});
function validateForm() {
	if($("#roleForm").valid()) {
		document.frm.submit();
		return true;
	}
	return false;
}

jQuery(document).ready(function() {
	document.frm.rname.focus();
	validateForm();
});

</script>


