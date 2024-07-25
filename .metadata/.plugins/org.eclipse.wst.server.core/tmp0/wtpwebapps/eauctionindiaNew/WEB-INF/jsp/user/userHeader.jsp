<%@page import="com.zedapp.eauction.model.User"%>
<%
	User user = null;
	String uType = "";
	String uname = "Guest";
	if (request.getSession().getAttribute("loginUser") != null)
		user = (User) request.getSession().getAttribute("loginUser");
	if (user != null) {
		uname = user.getUserName();
		uType = user.getUserType();
		if (uType.equals("A"))
			uType = "Admin";
		if (uType.equals("AO"))
			uType = "AO-Banker";
		if (uType.equals("B"))
			uType = "Banker";
		if (uType.equals("C"))
			uType = "Participant";

	}
%>
<div id="wrapper">
	<div id="header">
		<!--  <div id="top-navigation">
			<?php include "topNavigation.php"; ?>
		</div>
		-->
		<div id="header-top"><!-- E-Auction -->
		 <a href="homePage.htm"><span > <img src="images/header2.jpg" width="320px" height="59px" class="mainhead"> </span>
		 </a></div>

		<!--end of header-top -->
		<%
			if (user != null) {
		%>
		<div class="logout">
			<h4>
				<span>Hi&nbsp; <%=uname%>(<%=uType%>)
				</span> &nbsp; &nbsp; &nbsp; <span> <a href="logout.htm">logout</a>
				</span>
			</h4>
		</div>
		<%
			} else {
		%>
		<div class="logout">

			<!-- <span><a href="faq.htm">FAQ</a>
			</span> -->
		</div>
		<%
			}
		%>
		<div id="cityNavigation">
			<jsp:include page="navigation.jsp"></jsp:include>
		</div>

		<!--navigation-->
	</div>
	<div id="citiesNavigation">
		<jsp:include page="cityNavigation.jsp"></jsp:include>
	</div>


</div>
<!--header-->