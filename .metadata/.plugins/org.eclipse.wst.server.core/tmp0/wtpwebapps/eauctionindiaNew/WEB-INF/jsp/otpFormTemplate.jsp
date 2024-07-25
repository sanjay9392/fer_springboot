<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title><tiles:insertAttribute name="title" ignore="true" /></title>
  <!-- link rel="stylesheet" type="text/css" href="css/mystyles.css" media="screen" / -->
  <link rel="stylesheet" href="css/admin/css/mystyles.css" type="text/css" media="screen" />
  <script src="./js/jquery-1.4.4.min.js" type="text/javascript"></script>
</head>

<body >

<div id="wrapper">
	<div id="header">
		<div id="header-top">
			<h1> <span> <img src="images/header2.jpg" width="320px" height="59px" class="mainhead"/> </span>
		 </h1>
		</div>
		<div id="navigation">
			<ul class="menu">
			</ul>
		</div>
	</div>
	<div id="admin-content">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr><td>
		<div id="content-left"></div>
		</td><td>
		<div id="content-right">
		<tiles:insertAttribute name="body" />
		</div>
		</td></tr>
	</table>
	</div>
	<div id="footer">
		<div id="footer-top"></div>
		<div id="footer-bottom"></div>
	</div>
</div>

</body>
</html>
