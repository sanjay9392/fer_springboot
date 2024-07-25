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
<script src="./js/jquery-1.4.4.min.js" type="text/javascript"></script>
</head>
<body>
<script src=".js/dateformat.js" type="text/javascript"></script>

<script src="./js/jquery-ui-1.8.8.custom.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="./js/jquery.countdown.js" type="text/javascript"></script>

<script type="text/javascript" src="./js/jquery.validate.min.js" ></script>
<script type="text/javascript" src="./js/form_validate.js" ></script>
<% System.out.println("Session Timer====>>"+session.getId()); %>
<table   cellpadding="2" cellspacing="2" align="center">
	<tr>
		<td width="300"></td><td  bgcolor="white" align="center"><tiles:insertAttribute name="body" /></td><td width="300"></td>
	</tr>
	
</table>

</body>
</html>
