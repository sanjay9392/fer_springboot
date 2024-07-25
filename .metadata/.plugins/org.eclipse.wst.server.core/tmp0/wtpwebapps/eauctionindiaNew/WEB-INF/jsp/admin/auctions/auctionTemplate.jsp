<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.services.UserService"%>
<%@page import="com.zedapp.eauction.common.services.UserServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<html>
 <head>
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link  rel ="stylesheet" href="./css/timepicker.css" type="text/css" />
<link rel="stylesheet" href="./css/admin/css/auctionstyles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/jquery-ui-1.8.9.custom.css" type="text/css" media="screen" />
<script src="./js/jquery-1.7.min.js" type="text/javascript"></script>

</head>

<body>
	<table border="0" bgcolor="white" cellpadding="2" cellspacing="2" align="center">
	<tr>
		<td colspan="2"><tiles:insertAttribute name="header" />
		</td>
	</tr>
	<tr>
		<td valign="top" width="150" hieght="700"><tiles:insertAttribute name="menu" /></td>
		<td valign="top">
		<div id="main-content">
			<tiles:insertAttribute name="body" />
			</div>
		</td>
	</tr>
	<tr></tr>
	<tr>
	<td  align="center" colspan="2"><tiles:insertAttribute name="footer" />
	</td>
</tr>
	
</table>
	
		
<script src="./js/dateformat.js" type="text/javascript"></script>
<script src="./js/jquery-ui-1.8.8.custom.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="./js/jquery.countdown.js" type="text/javascript"></script>

<script type="text/javascript" src=".../js/jquery.validate.min.js" ></script>

<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	$("#aucDate").datetimepicker({ dateFormat : 'yy-mm-dd' });
	$("#inspDate").datetimepicker({ dateFormat : 'yy-mm-dd' });
	$("#payDt").datepicker({ dateFormat : 'yy-mm-dd' });
	$("#enquiryDt").datepicker({ dateFormat : 'yy-mm-dd' });
	$("#ddDt").datepicker({ dateFormat : 'yy-mm-dd' });
	setInterval(ajaxCheckLogin, 5000);
});
function showInstanceLogout() {
	alert("You are logged into other browser, so you are logged out from here.");
	//window.location.href = "<?php echo base_url(); ?>admin/verifylogin/logout";
	window.location.href = "logout.htm"; //"eauction/logout.htm";
}
function ajaxCheckLogin(){
	//alert("check login");
	//var urlStr = "<?php echo base_url(); ?>admin/verifylogin/AjaxIslogIn";
	$.ajax({
			type: "POST",
			url: "/eauction/ajaxIsLogin.htm",
			dataType: "json",
			error: function(req, status, error) { },
			success: function(data) {
				//alert(data);
						if(data.isLogin && data.isLogin=="N") {
							showInstanceLogout();
						}
					}
				
		});
}
</script>

</body>
</html>
