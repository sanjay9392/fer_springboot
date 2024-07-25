<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link  rel ="stylesheet" href="./css/timepicker.css" type="text/css" />
<link rel="stylesheet" href="./css/sliderkit-core.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/sliderkit-demos.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/sliderkit-site.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/admin/css/adminstyles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/jquery-ui-1.8.9.custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/jquery.countdown.css" type="text/css" media="screen" />
<script type="text/javascript" src="./script/jquery00.js"></script>
<script type="text/javascript" src="./script/jquery01.js"></script>
<script type="text/javascript" src="js/menujs.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-44797294-1', 'eauctionindia.in');
  ga('send', 'pageview');

</script>

</head>
<body>
<table><tr><td width="300"></td><td>
	<table border="0" bgcolor="white" cellpadding="2" cellspacing="2" align="center">
	<tr>
		<td colspan="2"><tiles:insertAttribute name="header" />
		</td>
	</tr>
	<tr>
		<td valign="top">
		<div id="main-content">
			<tiles:insertAttribute name="body" />
			</div>
		</td>
		<td align="left" valign="top" width="400" hieght="700"><tiles:insertAttribute name="login" /></td>
	</tr>
	<tr></tr>
	<tr>
		<td  align="center" colspan="2"><tiles:insertAttribute name="footer" />
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
	$("#payDt").datepicker({ dateFormat : 'yy-mm-dd' });
	$("#enquiryDt").datepicker({ dateFormat : 'yy-mm-dd' });
	$("#ddDt").datepicker({ dateFormat : 'yy-mm-dd' });
});

</script>
</body>
</html>
