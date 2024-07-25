<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
 <head>
	<!-- link rel="stylesheet" type="text/css" href="css/mystyles.css" media="screen" / -->
	<link rel="stylesheet" href="css/admin/css/mystyles.css" type="text/css" media="screen" />
	
	<title> EAuction</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">


</head>

<body onload="document.forms[0].username.focus()">

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

			<div style = "color:red" >
			<h2>Login</h2>
			</div>
			<div id="fm_error"></div>
	<c:url var="loginUrl" value="/login/authenticate.htm" />
	<form:form modelAttribute="user" method="POST" action="${loginUrl}">
	UserName:
	<form:input path="userName" size="20"/>
	<br/>
	Password:&nbsp;&nbsp;
	<form:password path="password" size="20"/>
	<br/>
	<font color:red>${message}</font>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Login" class="button2"/>
</form:form>
			
			<p class="forgot_pwd" ><a href="">Forgot Password Click Here</a></p>

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
