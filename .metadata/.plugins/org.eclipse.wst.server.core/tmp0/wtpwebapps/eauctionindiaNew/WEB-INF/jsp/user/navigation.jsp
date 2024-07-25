<%@page import="com.zedapp.eauction.common.util.PortalUtil"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%
User user=PortalUtil.getUser(request);
%>
<head>
<script type="text/javascript" src="js/menujs.js"></script>
</head>
<%-- <ul class="menu">
				<%if(user!=null){ %>
				<li> <a href="userHome.htm">Home</a> </li>
				<li><a href="userProfile.htm">My Profile</a></li>
				<%}else{ %>
				<li> <a href="index.htm">Home</a> </li>
				<%} %>
				<li> <a href="live-auctions.htm">Live Auctions</a></li>
				<li> <a href="future-auctions.htm">Future Auctions</a> </li>
				<li> <a href="contact-us.htm">Contact Us</a> </li>
				<li> <a href="faq.htm">FAQ</a> </li>
				
</ul>  --%>
<div id="sse3">
  <div id="sses3" >
<ul >
				<%if(user!=null){ %>
				<li> <a href="userHome.htm">Home</a> </li>
				<li><a href="userProfile.htm">My Profile</a></li>
				<%}else{ %>
				<li> <a href="index.htm">Home</a> </li>
				<%} %>
				<li> <a href="live-auctions.htm">Live Auctions</a></li>
				<li> <a href="future-auctions.htm">Future Auctions</a> </li>
				<li> <a href="contact-us.htm">Contact Us</a> </li>
				<li> <a href="faq.htm">FAQ</a> </li>
				
</ul> 
</div>
</div>