
<div id="wrapper">
	<div id="header">
		<div id="top-navigation">
			<jsp:include page="topNavigation.jsp"/>
		</div>
		<div id="header-top"> 
			 <span> <img src="images/header2.jpg" width="320px" height="59px" class="mainhead"/> </span>
		</div>
		<div id="navigation">
			<jsp:include page="navigation.jsp"/>
		</div>
	</div>
	<div id="user-content">
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr><td valign="top">
		<div id="content-left">
			
			<!-- <div class="welcome">
				<p>Welcome to E-Auction !! </p>
			</div> -->
			<div class="auctions-list">
				
			</div>
		</div>
		</td><td valign="top">
		<div id="content-right">
			<jsp:include page="userLogin.jsp"/>
		</div>
		</td></tr>
	</table>
	</div>
	<div id="footer">
		<div id="footer-top"></div>
		<div id="footer-bottom">
			<div class="copyright">
			Copyright &copy; eauction.com All Rights Reserved.
			</div>
			<div class="hits-counter">
				<span>Hits : </span>
				<!-- Start of StatCounter Code for Default Guide -->
				<script type="text/javascript">
				var sc_project=8463032; 
				var sc_invisible=0; 
				var sc_security="305bbac1"; 
				var scJsHost = (("https:" == document.location.protocol) ? "https://secure." : "http://www.");
				document.write("<sc"+"ript type='text/javascript' src='" + scJsHost + "statcounter.com/counter/counter.js'></"+"script>");
				</script>
				<noscript>
				<div class="statcounter">
					<!-- <a title="web counter" href="http://statcounter.com/free-hit-counter/" target="_blank"> -->
					<img class="statcounter" src="https://c.statcounter.com/8463032/0/305bbac1/0/" alt="web counter">
					<!-- </a> -->
				</div></noscript>
				<!-- End of StatCounter Code for Default Guide -->
			</div>
			<div class="powered">
			Powered by <a href="http://www.virtutechsolutions.com/" target="_blank"> Virtu Tech Solutions Pvt. Ltd</a>
			</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
var $ = jQuery;
$(document).ready(function() {
	var runId = setInterval(getAuctionsList, 10000);
	$("span.statcounter").html($("a.statcounter").html());
});
function getAuctionsList() {
	//$(".auctions-list").html("refreshing");
	var urlStr = "<?php echo base_url(); ?>Pages/ajaxAuctionsList";
	//alert(urlStr);
	$.ajax({
		type: "POST",
		url: urlStr,
		error: function(req,error) { /*alert("error="+error);*/ },
		success: function(data) {
					$(".auctions-list").html(data);
				}
	});
}
function bidNow() {
	alert("Login to Bid");
	var f = document.forms["loginForm"];
	f.uname.focus();
}
function ViewDetails(pid) {
	window.location.href = "<?php echo base_url(); ?>Pages/ajaxViewDetails/"+pid;
}
</script>
