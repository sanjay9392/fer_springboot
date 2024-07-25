<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.zedapp.eauction.model.User"%><html>
 <head>
	<title>EAuction</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

<script src="./js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script type="text/javascript">

function showUrl(urlStr) {
	window.location.href = urlStr;
}
</script>


</head>

<body>
<%
User user = null;
String uType="";
String uname = "Guest";
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
if(user!=null) {
	uname = user.getUserName();
uType=user.getUserType();
if(uType.equals("A"))
	uType="Admin";
if(uType.equals("AO"))
	uType="AO-Banker";
if(uType.equals("B"))
	uType="Banker";
if(uType.equals("C"))
	uType="Participant";
}
//if(uname.equals("Guest" || uType.equals("")){
	
%>

<div id="wrapper">
	<div id="header"> 
		<%-- <div id="top-navigation">
			<%@ include file="topNavigation.jsp"%>
		</div> --%>
		
		<div id="header-top" >
		 <a href="homePage.htm"><span ><img src="images/header2.jpg" width="320px" height="59px" class="mainhead"></span></a>
		</div><!--end of header-top -->
		<div class="logout">
			<h4><span >
				<%=uname %>(<%= uType%>)
			</span> &nbsp;  &nbsp;  &nbsp; 
			<span>
					<a href="logout.htm">logout</a>
			</span></h4>
		</div>
		<div id="navigation">
			<%@ include file="navigation.jsp"%>
		</div> 
		
		<!--navigation-->
	</div><!--header-->
	</div>
	</body>
	</html>

