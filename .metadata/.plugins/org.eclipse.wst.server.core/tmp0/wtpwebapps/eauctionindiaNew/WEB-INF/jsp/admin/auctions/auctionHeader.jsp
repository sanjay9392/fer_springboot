<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<script src="./js/jqueryRotate.js" type="text/javascript"></script>
<%User user=null;
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
Auction auction= (Auction) request.getAttribute("auction");
BankProjects project=auction.getProject();
String status=auction.getStatus();
if(status.equals("S"))
		status="Running";
if(status.equals("P"))
		status="Pending";
if(status.equals("C"))
	status="Closed";


String uType="";
String uname = "Guest";
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

//Set<Customer> custList=auction.getCutomerList();
%>

	<div id="header">
		<div id="header-top">
			<a href="<?php echo $this->config->item('base_url') ?>admin/Pages/home"><span> <img src="images/header2.jpg" width="320px" height="59px" class="mainhead"/> </span>
		 </a>		</div><!--end of header-top -->
		<div class="logout">
			<h4><span >Hi&nbsp;
				<%=uname %>(<%= uType%>)
			</span> &nbsp;  &nbsp;  &nbsp; 
			<span>
					<a href="logout.htm">logout</a>
			</span></h4>
		</div>
	</div><!--header-->
	<div class="clear"></div>
	</div>