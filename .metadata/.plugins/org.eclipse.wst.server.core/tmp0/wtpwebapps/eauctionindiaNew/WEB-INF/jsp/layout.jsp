<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link  rel ="stylesheet" href="./css/timepicker.css" type="text/css" />
<link rel="stylesheet" href="./css/sliderkit-core.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/sliderkit-demos.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/sliderkit-site.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/admin/css/adminstyles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/jquery-ui-1.8.9.custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/jquery.countdown.css" type="text/css" media="screen" />
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
 <script type="text/javascript" src="js/menujs.js"> </script>
  <script type="text/javascript" src="js/leftMenu.js"> </script>
<script type="text/javascript">
    var timeoutHandle = null;
    function startTimer(timeoutCount) {
        if (timeoutCount == 0) {
           /*  alert("Your Session has been Expired \n Please Login Again");
           window.location.href = 'logout.htm'; */
        } else if (timeoutCount < 3) {
            document.getElementById('sessionTimer').innerHTML = 'You have ' + (timeoutCount * 3000)/1000 + 'seconds until timeout' ;
        }
        timeoutHandle = setTimeout(function () { startTimer(timeoutCount-1);}, '3000');
    }
    function refreshTimer() {
        killTimer(timeoutHandle);
        startTimer(3);
    }
  </script>
 </head>
<% int sessionTimer=session.getMaxInactiveInterval();
   System.out.println("Session Timer Layout====>>"+sessionTimer+", "+session.getId());
   if(null == request.getSession().getAttribute("loginUser")) {
	   response.sendRedirect("index.htm");
   }
%>
<body onload="startTimer(<%=sessionTimer %>)">
<%
User u = PortalUtil.getUser(request);
if(null==u) {
	//response.sendRedirect("index.htm");
	//response.setStatus(response.SC_MOVED_TEMPORARILY);
	//response.setHeader("Location", "index.htm");
	out.println("<script type='text/javascript'>");
	out.println("window.location.href = 'index.htm';");
	out.println("</script>");
	return;
}
%>
<div id="sessionTimer"></div>
<table><tr><td width="300"></td><td>
	<table border="0" bgcolor="white" cellpadding="2" cellspacing="2" align="center">
		<tr>
			<td colspan="2"><tiles:insertAttribute name="header" />
			</td>
		</tr> 
		<tr>
			<td valign="top"><tiles:insertAttribute name="menu" /></td>
			<td valign="top">
			<div id="main-content">
				<tiles:insertAttribute name="body" />
				</div>
			</td>
		</tr>
		<tr></tr>
		<tr>
			<td  align="center" colspan="2"><tiles:insertAttribute name="footer"  />
			</td>
		</tr>
	
	</table>
	
</td><td width="300">

</tr></table>
<script src=".js/dateformat.js" type="text/javascript"></script>

<script src="./js/jquery-ui-1.8.8.custom.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="./js/jquery.countdown.js" type="text/javascript"></script>

<script type="text/javascript" src="./js/jquery.validate.min.js" ></script>
<script type="text/javascript" src="./js/form_validate.js" ></script>


<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	$("#aucDate").datetimepicker({ dateFormat : 'yy-mm-dd' });
    $("#inspDate").datetimepicker({ dateFormat : 'yy-mm-dd' }); 
	$("#payDt").datepicker({ dateFormat : 'yy-mm-dd' });
	//$("#enquiryDt").datepicker({ dateFormat : 'yy-mm-dd' });
	$("#ddDt").datepicker({ dateFormat : 'yy-mm-dd' });
});

</script>

</body>
</html>
