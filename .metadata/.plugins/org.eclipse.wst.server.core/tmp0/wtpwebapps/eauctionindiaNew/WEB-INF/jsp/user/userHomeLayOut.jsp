<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.common.services.UserService"%>
<%@page import="com.zedapp.eauction.common.services.UserServiceImpl"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<html>
 <head>
	<title>EAuction Web Portal</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
<link  rel ="stylesheet" href="./css/timepicker.css" type="text/css" />
<link rel="stylesheet" href="./css/sliderkit-core.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/sliderkit-demos.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/sliderkit-site.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/admin/css/mystyles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="./css/jquery-ui-1.8.9.custom.css" type="text/css" media="screen" />
<script src="../js/jquery-1.4.4.min.js" type="text/javascript"></script>
</head>

<body>
<%
UserService userService= new UserServiceImpl();
User user = null;
String uType="";
String uname = "Guest";
Auction auction= (Auction) request.getAttribute("auction");
//System.out.println("Auction Id==============>>>>"+auction.getAid());
BankProjects project=auction.getProject();
String status=auction.getStatus();
User aoUser=userService.getById(auction.getAoid());
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
if(user!=null) {
	uname = user.getUserName();
uType=user.getUserType();
if(uType.equals("A"))
	uType="Admin";
if(uType.equals("AO"))
	uType="AO-Baker";
if(uType.equals("B"))
	uType="Banker";
if(uType.equals("C"))
	uType="Participant";
if(uType.equals("E"))
	uType="Executive";

}


//if(uname.equals("Guest" || uType.equals("")){
	
%>
<div id="wrapper">
	<div id="header">
		<%-- <div id="top-navigation">
			<jsp:include page="topNavigation.jsp"></jsp:include>
		</div> --%>
		<div id="header-top">
			 <a href="homePage.htm"><span> <img src="images/header2.jpg" width="320px" height="59px" class="mainhead"/> </span>
		 </a>
		</div><!--end of header-top -->
		<div class="logout">
			<h4><span >Hi&nbsp;
				<%=uname %>(<%= uType%>)
			</span> &nbsp;  &nbsp;  &nbsp; 
			<span>
					<a href="logout.htm">logout</a>
			</span></h4>
		</div>
		<div id="navigation">
			<jsp:include page="navigation.jsp"></jsp:include>
		</div> <!--navigation-->
	</div><!--header-->
	<div class="clear"></div>
	<div id="admin-content">
		<table border="0" cellspacing="0" cellpadding="0">
		<tr><td valign="top">
		<div id="left-menu" >
		<!--<div class='contact-info'>Contact AO-Banker:<br/>
		<%=aoUser.getUserName() %>(<%=aoUser.getMobileNo() %>)</div>
		-->
		<div class='contacts-div'>
		<div class='section-title'>Contact Details</div>
	<div class='section-body'>
	<table><tr><td width='180' class='auction-image'> <img src='./uploads/<%=project.getPropertyImage() %>' width='100' height='100' alt='Auction Image'></td>
	</tr></table>
	
	<div class='proj-title'>Auction: <%=project.getProjName() %></div>
	<div class='ao-info'>Contact AO<br> 
	<%=aoUser.getUserName() %> (<%=auction.getContactsNos() %>) </div>
</div>
</div>
		
		</div>
		</td><td valign="top">
		<div id="main-content">

			<jsp:include page="userHome.jsp"></jsp:include>

		</div>
		</td></tr>
		</table>
	</div>
	<div id="footer">
		<div id="footer-top"></div>
		<div id="footer-bottom"></div>
	</div>
</div>
 
<script src="./js/dateformat.js" type="text/javascript"></script>

<script src="./js/jquery-ui-1.8.8.custom.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>

<script type="text/javascript" src="./js/jquery.validate.min.js" ></script>

<script type="text/javascript">
	var $ = jQuery;
	$(document).ready(function() {
		$("#aucDate").datetimepicker({ dateFormat : 'yy-mm-dd' });
		$("#messageDiv").draggable();
	});
</script>

</body>
</html>