<script src="js/jqueryRotate.js" type="text/javascript"></script>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>

<%
//User user=(User)request.getAttribute("user");
User user=null;
if(request.getSession().getAttribute("loginUser")!=null)
	user = (User)request.getSession().getAttribute("loginUser");
Auction auction= (Auction) request.getAttribute("auction");
System.out.println("Auction Id===  is ===========>>>>"+auction.getAid());
BankProjects project=auction.getProject();
String status=auction.getStatus();
if(status.equals("S"))
		status="Running";
if(status.equals("P"))
		status="Pending";
if(status.equals("C"))
	status="Closed";

//Set<Customer> custList=auction.getCutomerList();
Set<Customer> custList=(Set)request.getAttribute("customerList");
%>
<div id="messageDiv">
	<div class="section-title"></div>
	<div class="section-body"></div>
	<div class="section-footer">
		<input type="button" class="button2" value="OK" onclick="closeMessageDiv()">
	</div>
</div>

<div class="my-info"></div>
<div class="network-status"></div>
<div class="clear"></div>
<table>
<tr><td valign='top'>
<table border='0' cellspacing='0' cellpadding='0' style='line-height:12px; min-height: 10px;'>
<tr><td valign='top' style='line-height:12px; min-height: 10px;'>

<jsp:include page="currentBid.jsp"></jsp:include>
</td><td valign='top' style='line-height:12px; min-height: 10px;'>
	<jsp:include page="userBidForm.jsp"></jsp:include>

</td></tr>
</table>

<div class='clear'></div>
<div class='live-bid'>
	<div class="custname"></div>
	<div class="running-bid"></div>
</div>
<jsp:include page="allBids.jsp"></jsp:include>
</td><td valign='top'>
<jsp:include page="timerInfo.jsp"></jsp:include>

<table border="0" cellspacing="0" cellpadding="0">
<tr><td valign="top" style="min-height: 20px;">
	<div id="clockHolder">
		<div class="clock-bg">
			<img id="clock" src="images/clock1.png" >
			
		</div>
	    <div class="rotatingWrapper" id="hoursDiv">
			<span class="" id="hour" style="width: 198px; height: 198px;">
				<img id="hours" src="images/hours2.png">
			</span>
		</div>
        <div class="rotatingWrapper" id="minutesDiv">
			<span class="" id="min" style="display: inline-block; width: 200px; height: 200px;">
				<img id="minutes" src="images/minutes2.png">
			</span>
		</div>
	    <div class="rotatingWrapper" id="secondsDiv">
			<span class="" id="sec" style="display: inline-block; width: 200px; height: 200px;">
				<img id="seconds" src="images/seconds2.png">
			</span>
		</div>
	    </div> <div class='timer-option'></div>
</td></tr>
</table>
</td></tr>
</table>


<script type="text/javascript">
var $ = jQuery;
var cid = <%=user.getTypeId()%>;
var userId = <%=user.getUserId()%>;
var uid = "<%=user.getUserId()%>";
var cname = "<%=user.getUserName()%>";
var minBid = "<%=project.getMinBid()%>";
var currentBid = minBid;
var minBidDiff = <%=project.getMinBidDiff()%>;
var maxBidDiff = <%=project.getMaxBidDiff()%>;
var bidInterval = 0;
var utype = "<%=user.getUserType()%>";
var closeTimer = 0, closeTimerId = 0, timerDt = "", mm = 0, ss = 0;
var isTimerStarted = false, isFirstCall = true;
var myId = <%=user.getUserId()%>;
var aoId=<%=auction.getAoid()%>;
var isLastMsgDisplayed = false;
var lastMsg = ""; hasFirstTimerStarted = false;
var highestBidId = 0;
var isClosingTimer = "N";
var ajaxReqNo = 0;
var ajaxRespNo = 0;
var ieVersion = 0;
var firstBroadcastReq = true;
var ajaxTimeout = 10000;
var lastAucStatus = "P";
var lastHighestBidAmt = 0;
var prevBcid = 0;
var currBcPage = 0;
var totBcPages = 0;
var startedCommunicatingServer = false;
var secondsIntervalId = 0;
var secondsInterval = 0;
var secDiff = 2;
var lastSecInterval = 0;
var curSecInterval = 0;
var getAjaxMode = false;
var respTime = 0;
var auctionLogoutId = 0;
$(document).ready(function() {
	ieVersion = getIEVersion();
	//$(".my-info").html("ie:"+ieVersion);
	//showWelcomeMessage();
	getPrevBroadcast();
	//getCurrentBid();
	secondsIntervalId = setInterval(increaseSecondsInterval, 1000);
	//bidInterval = setInterval(getCurrentBid, 2000);
	setInterval(ajaxCheckLogin, 3000);
});
function getIEVersion() {
	var rv = -1; // Return value assumes failure.
	if (navigator.appName == 'Microsoft Internet Explorer') {
		var ua = navigator.userAgent;
		var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
		if (re.test(ua) != null)
			rv = parseFloat( RegExp.$1 );
	}
	return rv;
}
function increaseSecondsInterval() {
	++secondsInterval;
	if(startedCommunicatingServer && !getAjaxMode && (secondsInterval%(secDiff)==0)) {
		getCurrentBid();
	}
}
function auctionLogout() {
	clearInterval(auctionLogoutId);
	//alert("You are logging out");
	//window.location.href = "/eauction/auctionLogout.htm";
	window.location.href = "/eauction/logout.htm";
}
function logout() {
	window.location.href = "/eauction/logout.htm";
}
function showNetworkError() {
	$(".network-status").html("Network Problem").addClass("network-error");
}
function showWelcomeMessage() {
	showMessageDiv("Welcome !", "Welcome "+cname+" ! <br>You can bid online auction.");
}
function showMessageDiv(title, content, footer) {
	$("#messageDiv").find(".section-title").html(title);
	$("#messageDiv").find(".section-body").html(content);
	if(footer) $("#messageDiv").find(".section-footer").html(footer);
	$("#messageDiv").show();
}
function closeMessageDiv() {
	$("#messageDiv").find(".section-title").html("");
	$("#messageDiv").find(".section-body").html("");
	$("#messageDiv").find(".section-footer").html("<input type='button' class='button2' value='OK' onclick='closeMessageDiv()'>");
	$("#messageDiv").hide();
}
function showConfirm(content, okAction) {
	var str = "<input type='button' class='button2' value='OK' onclick='"+okAction+"'>";
	str += "<input type='button' class='button2' value='Cancel' onclick='closeMessageDiv()'>";
	showMessageDiv("Confirm", content, str);
}

function showThankYouMessage(content) {
	showMessageDiv("Thank You", "Thank You "+cname+" for participating the live auction of <%=project.getProjName()%> <br>"+content, "<input type='button' class='button2' value='OK' onclick='auctionLogout()'>");
	auctionLogoutId = setInterval(auctionLogout,30000);
}
function showCongratsMessage(content) {
	showMessageDiv("Congratulations !!", content + "<br>Thank You "+cname+" for participanting the live auction of <%=project.getProjName()%>", "<input type='button' class='button2' value='OK' onclick='auctionLogout()'>");
	auctionLogoutId = setInterval(auctionLogout,30000);
}
function showSessionOut() {
	showMessageDiv("Session Timeout", "Your session has been expired, you are logged out. Please relogin to bid.");
	setInterval(logout,10000);
}
function startCloseTimer() {
	isTimerStarted = true;
	hasFirstTimerStarted = true;
	clearInterval(closeTimerId);
	closeTimerId = 0;
	mm = parseInt(closeTimer / 60, 10);
	ss = closeTimer - (mm*60);
	if(ss<0) ss = 0;
	rotateHands(mm, ss);
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	//alert(closeTimer);
	$(".timer-run").html("st,"+dispTimer); //closeTimer);
	if(closeTimerId==0) {
		closeTimerId = setInterval(decreaseTime, 1000);
	}
	$(".timer-info .last-info").html("Timer Started");
	//$(".timer-info .timer-text").html("Seconds Left");
	$(".timer-info .section-body").css("background", "#ffff00");
}
function startTimerByValue(tv) {
	var ct = tv;
	isTimerStarted = true;
	hasFirstTimerStarted = true;
	clearInterval(closeTimerId);
	closeTimerId = 0;
	closeTimer = parseFloat(ct);
	mm = parseInt(closeTimer/60, 10);
	ss = closeTimer - (mm*60);
	if(ss<0) ss = 0;
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	rotateHands(mm,ss);
	//alert(closeTimer);
	//var aid = $("#aid").val();
	$(".timer-run").html(dispTimer); //closeTimer);
	if(closeTimerId==0) {
		closeTimerId = setInterval(decreaseTime, 1000);
	}
	$(".timer-info .last-info").html("Timer Started");
	//$(".timer-info .timer-text").html("Seconds Left");
	$(".timer-info .section-body").css("background", "#ffff00");
	timerOption("N");
}
function decreaseTime() {
	--closeTimer;
	mm = parseInt(closeTimer / 60, 10);
	ss = closeTimer - (mm*60);
	if(ss<0) ss = 0;
	rotateHands(mm, ss);
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	$(".timer-run").html(dispTimer); //closeTimer);
	if(closeTimer<=0) {
		clearInterval(closeTimerId);
		//closeAuction();
	}
}
function stopTimerToZero() {
	isTimerStarted = false;
	clearInterval(closeTimerId);
	closeTimerId = 0;
	closeTimer = 0;
	mm = parseInt(closeTimer/60, 10);
	ss = closeTimer - (mm*60);
	if(ss<0) ss = 0;
	rotateHands(mm, ss);
	$(".timer-run").html("00:00");
	$(".timer-info .last-info").html("Timer Stopped");
	$(".timer-info .timer-text").html("");
	$(".timer-info .section-body").css("background", "none");
	
	$(".timer-option").hide();
}
function rotateHands(mm, ss) {
	//if(ieVersion>=9) return;
	var amm = mm*6;
	var ass = ss*6;
	if($.browser.msie) {
		$('#minutes').css('cssText','-ms-transform: rotate('+amm+'deg)');
		$('#seconds').css('cssText','-ms-transform: rotate('+ass+'deg)');
	} else {
		$("#minutes").rotate(amm);
		$("#seconds").rotate(ass);
	}
}



function timerOption(timer){
	if(timer === "N"){
		$(".timer-option").html("Normal Timer");	
	}if(timer === "R"){
		$(".timer-option").html("Reverse Timer");
	}
	//$(".button5").hide(); $("#button2").hide(); $("#closeAucButton").show();
	
	//$(".timer-run").html("00:00");
}
function getCurrentBid() {
	lastSecInterval = secondsInterval;
	var aid = $("#aid").val();
	//alert(aid);
	if(aid==0) return;
	getAjaxMode = true;
	increaseAjaxReqNo();
	$.ajax({
		type: "POST",
		url: "/eauction/ajaxCurrentBid.htm",
		data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
		timeout: ajaxTimeout,
		dataType: "json",
		error: function(req, status, error) {
				//alert("error = "+error);
				getAjaxMode = false;
				checkResponseTimeout(status);
			},
		success: function(data) {
			//alert(data);
			//alert(data.status);
			//alert((data.found=="true")+","+(data.found || data.found=="true"));
			curSecInterval = secondsInterval;
			//$(".my-info").append(",rc:"+curSecInterval);
			respTime = (curSecInterval - lastSecInterval);
			updateCurrentBid(data);
			getAjaxMode = false;
			curSecInterval = secondsInterval;
			var respTime2 = (curSecInterval - lastSecInterval);
			if((respTime2-respTime)>0) {
				$(".my-info").append(", ::::::::::::::::::::::::::::::::::::::::"+(respTime2-respTime));
			}
		}
	});
}
function showPrevBidProcess() {
	$(".prev-bid-loading").show();
}
function hidePrevBidProcess() {
	$(".prev-bid-loading").hide();
}
function getPrevBroadcast() {
	//if(ajaxRespNo != ajaxReqNo) return;
	$(".showMoreBroadcast").remove();
	showPrevBidProcess();
	var aid = $("#aid").val();
	increaseAjaxReqNo();
	var urlStr = "/eauction/ajaxPrevBroadcast.htm";
	//var urlStr = "ajaxCurrentBid/"+aid;
	//alert(aid+","+urlStr);
	if(aid==0) return;
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid+"&currBcPage="+currBcPage,
		timeout: ajaxTimeout,
		dataType: "json",
		error: function(req, status, error) {
				checkResponseTimeout(status);
				hidePrevBidProcess();
				//alert("error="+error);
			},
		success: function(data) {
				//alert(data);
			hidePrevBidProcess();
			//showMessage("Info", data);
			updatePrevBroadcast(data);
			//$(".all-bids .section-body-prev").append(data);
			//alert(currBcPage+","+totBcPages);
			if(currBcPage<=totBcPages) {
				showMoreBroadcast();
				//getPrevBroadcast();
			}
		}
	});
}
function showMoreBroadcast() {
	$(".all-bids .section-body-prev").append("<div class='showMoreBroadcast'><a href='javascript:;' onclick='getPrevBroadcast()'>Show More Previous Broadcast...</a></div>");
}
function increaseBid() {
	currentBid = parseFloat(currentBid) + parseFloat(bidDiff);
	$("#userBid").val(currentBid);
}
function submitBid(event) {
	var keyCode = event.keyCode;
	if(keyCode==13) {
		sendBid();
	}
}
function verifyBidAmt(bidAmt) {
	if(userId==highestBidId) {
		//alert("You are the highest bidder. You cannot bid.");
		showMessageDiv("Information", "You are the highest bidder. You cannot bid.");
		return false;
	}
	if(parseFloat(bidAmt) <= parseFloat(currentBid)) {
		//alert("Invalid Bid : "+bidAmt);
		showMessageDiv("Information", "Invalid Bid : "+bidAmt);
		$("#userBid").val("");
		return false;
	}
	//var min = parseFloat(currentBid) + parseFloat(minBidDiff);
	var max = parseFloat(currentBid) + parseFloat(maxBidDiff);
	/*if(parseFloat(bidAmt) < min ) {
		alert("Invalid Bid : "+bidAmt+", It should be within range of Rs."+min+" - Rs."+max);
		//$("#userBid").val("");
		return false;
	}*/
	var diff = bidAmt - currentBid;
	var ratio = diff/maxBidDiff;
	//if(parseFloat(bidAmt) > max ) {
	if(ratio != parseInt(ratio)) {
		//alert("Invalid Bid : "+bidAmt+", It should be multiple of Rs."+maxBidDiff);
		showMessageDiv("Information", "Invalid Bid : "+bidAmt+", It should be multiple of Rs."+maxBidDiff);
		//$("#userBid").val("");
		return false;
	}
	return true;
}
function sendBid() {
	if(closeTimer==0) {
		if(!hasFirstTimerStarted) {
			//alert("You cannot bid now. Authrorized officer has not yet started the timer.");
			showMessageDiv("Information", "You cannot bid now. Authorized officer has not yet started the timer.");
		} else {
			//alert("You cannot bid now. Authrorized officer has stopped the timer.");
			showMessageDiv("Information", "You cannot bid now. Authrorized officer has stopped the timer.");
		}
		return;
	}
	var aid = $("#aid").val();
	if(aid==0) return;
	var bidAmt = $("#userBid").val();
	if(bidAmt.length==0) return;
	if(!verifyBidAmt(bidAmt)) return;
	//var cc = confirm("Are you sure, You want to bid for Rs."+bidAmt+"?");
	//if(!cc) return;
	showConfirm("Are you sure, You want to bid for Rs."+bidAmt+"?", "submitBidToServer("+bidAmt+", "+aid+")");
}
function submitBidToServer(bidAmt, aid) {
	
	closeMessageDiv();
	if(!verifyBidAmt(bidAmt)) return;
	$("#userBid").val("");
	//alert("submit");
	increaseAjaxReqNo();
	$.ajax({
		type: "POST",
		url: "/eauction/ajaxSubmitBid.htm",
		data: "bidAmt="+bidAmt+"&aid="+aid+"&isClosingTimer="+isClosingTimer+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
		dataType: "json",
		error: function(req, status, error) {  },
		success: function(data) {
			updateCurrentBid(data);
		}
	});
}
function checkResponseTimeout(status) {
	++ajaxRespNo;
	if(status=="timeout") {
		showNetworkError();
	}
}
function increaseAjaxReqNo() {
	++ajaxReqNo;
	//$(".my-info").append(", rq"+ajaxReqNo);
}
function updateCurrentBid(data) {
	

	//$(".my-info").append(";"+data.found);
	//$(".my-info").append(" ;"+data.uid+","+data.lastActivity);
	if(data.login && data.login=="N") {
		showInstanceLogout();
	}
	
	if(!data.uid || data.uid==0) {
		showSessionOut();
	}
	if(data.found || data.found=="true") {
		ajaxRespNo = data.ajaxRespNo;
		//$(".my-info").append(";"+ajaxReqNo+", "+ajaxRespNo);
		if(ajaxRespNo == ajaxReqNo) $(".network-status").html("Network Connected").removeClass("network-error");
		else showNetworkError();
		var statusStr = "Auction Status: Not Started";
		if(data.status=="S") statusStr = "Auction Status: Running";
		if(data.status=="C") {
			statusStr = "Auction Status: Closed";
			if(utype=="B") {
				clearInterval(bidInterval);
				clearInterval(secondsIntervalId);
				//alert("Bid is finalized at Rs."+displayMoney(data.currentBid.bidAmt));
				showMessageDiv("Information", "Bid is finalized at Rs."+displayMoney(data.currentBid.bidAmount));
			} else {
				clearInterval(bidInterval);
				clearInterval(secondsIntervalId);
				//alert(data.currentBid.cid);
				if(data.currentBid.cid) {
					var cname = "";
					if(data.currentBid.cname) cname = data.currentBid.cname;
					if(myId+"" == ""+data.currentBid.cid) {
						showCongratsMessage("Congratulations "+cname+" ! <br>You Won this Auction <br> Bid is finalized at Rs."+displayMoney(data.currentBid.bidAmount));
					} else {
						showThankYouMessage("Sorry, You lost this Auction. <br>Bid is finalized at Rs."+displayMoney(data.currentBid.bidAmount)+"<br>Better Try for the next auction.");
					}
				} else {
					showThankYouMessage("Sorry, You lost this Auction. <br>Bid is finalized at Rs."+displayMoney(data.currentBid.bidAmount)+"<br>Better Try for the next auction.");
				}
				$(".user-bid .section-body").html("Bid is closed, you cannot bid now");
			}
		}
		if(data.latestMaxBidDiff) {
			maxBidDiff =  parseFloat(data.latestMaxBidDiff);
			$(".admin-bid-rule").html("Bid Rule changed : Rs."+displayMoney(maxBidDiff));
			$(".admin-bid-rule").css("background", "#ffff00").fadeIn("slow"); //, function() { $(".admin-bid-rule").css("background", "#00ff00"); });
		}
		$(".running-status").html(statusStr);
		if(data.bidResult==false || data.bidResult=="false") {
			showMessageDiv("Information",data.resultMsg);
		}
		//alert(data.currentBid);
		if(data.currentBid && data.currentBid.cname) {
			//$(".custname").html(data.currentBid.cname+" says");
			if(data.currentBid.cid) {
				highestBidId = data.currentBid.cid;
				if(userId==data.currentBid.cid) {
					$(".custname").html("Last Bid <span class='bidBy'>(by Self)</span>");
				} else {
					$(".custname").html("Last Bid <span class='bidBy'>(by Other)</span>");
				}
			} else {
				$(".custname").html("Last Bid ");
			}
		}
		if(data.isHighestQuote || data.isHighestQuote=="true") {
			//$(".custname").html("Bidding starts at ");
			$(".custname").html("Highest tender amount is ");
		}
		if(data.currentBid && data.currentBid.bidAmount) {
			$(".running-bid").html("Rs."+displayMoney(data.currentBid.bidAmount));
			currentBid = parseFloat(data.currentBid.bidAmount);
		}
		if(data.isClosingTimer) {
			isClosingTimer = data.isClosingTimer;
		}
		/*if(firstBroadcastReq) updateBroadcast(data);
		if(!firstBroadcastReq) updateBroadcast(data);
		firstBroadcastReq = false;*/
		updateBroadcast(data);
		updateBankerStatus(data);
		//alert(data.nowDt+","+data.timer);
		//if(data.timer) {
			var newTimer = data.timer;
			if(newTimer==0) stopTimerToZero();
			//$(".my-info").append("<br>"+newTimer+", "+ data.timerDt+", "+isTimerStarted);
			if(newTimer>0) {
				//startCloseTimer(1);
				timerDt = data.timerDt;
				var dt1 = getDateObj(data.nowDt); //new Date();
				var dt2 = getDateObj(timerDt);
				var clientDt = new Date();
				//$(".my-info").append(", "+dt2);
				var xtimer = newTimer - parseInt((dt1.getTime()-dt2.getTime())/1000); // - parseInt((clientDt.getTime()-dt1.getTime())/1000, 10);
				//$(".my-info").append(", xtimer = "+xtimer+", nt="+newTimer+", dt1="+dt1+", dt2="+dt2+", cdt="+clientDt);
				//alert(dt1+" , "+dt2+" , "+newTimer+", "+((dt1.getTime()-dt2.getTime())/1000));
				if(xtimer>0) startTimerByValue(xtimer);
			}
		//}
		//if(!firstBroadcastReq) updateBroadcast(data);
		//firstBroadcastReq = false;
	}
}
function getDateObj(dtStr) {
	var dtTmArr = dtStr.split(" ");
	var dtArr = dtTmArr[0].split("-");
	var tmArr = dtTmArr[1].split(":");
	
	var yy = (parseInt(dtArr[0], 10));
	var mm = (parseInt(dtArr[1], 10));
	var dd = (parseInt(dtArr[2], 10));
	var hh = (parseInt(tmArr[0], 10));
	var min = (parseInt(tmArr[1], 10));
	var sec = (parseInt(tmArr[2], 10));
	//var dt = new Date(yy, mm-1, dd, hh+5, min+30, sec, 0);
	var dt = new Date(yy, mm-1, dd, hh, min, sec, 0);
	return dt;
}
/*
function updateBroadcast(data) {
	if(data.broadcast) {
		var bc = data.broadcast;
		//$(".all-bids .section-body").html("");
		//$("#historyIds").prepend(";len="+bc.length+",bcid:"+data.sessbcid+";");
		for(var x = 0; x<bc.length; x++) {
			var histIds = $("#historyIds").html();
			if(histIds.indexOf(" "+bc[x].bcid+",")>=0) {
				continue;
			}
			$("#historyIds").prepend(" "+bc[x].bcid+",");
			var str = "odd";
			if(x%2==1) str = "even";
			var msg = bc[x].message;
			if(bc[x].userType=="Event") msg = "<div class='user-quote "+str+"'>Event : " + msg + " ( "+getDateStrByOffset(bc[x].created_dt)+" ) </div>";
			else if(bc[x].utype=="B") msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].created_dt)+" ) </td></tr></table></div>";
			else if(bc[x].utype=="AO") msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(AO-Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].created_dt)+" ) </td></tr></table></div>";
			else if(bc[x].utype=="C") msg = "<div class='user-quote "+str+"'><table border='0'><tr><td>"+bc[x].uname+" says : " + msg + " ( "+getDateStrByOffset(bc[x].created_dt)+" ) </td></tr></table></div>";
			if(ajaxRespNo>1) {
				$(".all-bids .section-body").prepend(msg);
			} else {
				$(".all-bids .section-body").append(msg);
			}
		}
	}
}
*/
function updateBroadcast(data) {
	if(data.broadcast) {
		var bc = data.broadcast;
		//$(".all-bids .section-body").html("");
		var currMsg = "";
		var msgArr = new Array();
		var len = bc.length;
		for(var x = 0; x<bc.length; x++) {
			var histIds = $("#historyIds").html();
			if(histIds.indexOf(" "+bc[x].bcid+",")>=0) {
				continue;
			}
			$("#historyIds").prepend(" "+bc[x].bcid+",");
			var str = "odd";
			if(x%2==1) str = "even";
			var msg = bc[x].message;
			var msg1 = msg;
			//$(".my-info").append(", aoId="+aoId+", crtBy="+bc[x].createdBy);
			//$(".my-info").append(uid+"" == ""+bc[x].createdBy);
			if(bc[x].userType=="Event" && ((uid+"" == ""+bc[x].createdBy) || (aoId+"" == ""+bc[x].createdBy)) ) {
				msg = "<div class='user-quote "+str+"'>Event : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </div>";
			}
			else if(bc[x].userType=="B" || bc[x].userType=="AO") {
				msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(AO-Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			}
			else if(bc[x].userType=="C" && (uid+"" == ""+bc[x].createdBy)) {
				msg = "<div class='user-quote "+str+"'><table border='0'><tr><td>"+bc[x].uname+" says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			}
			if((bc[x].userType=="Event" && ((uid+"" == ""+bc[x].createdBy) || (aoId+"" == ""+bc[x].createdBy))) || bc[x].userType=="B" || bc[x].userType=="AO" || (bc[x].userType=="C" && (uid+"" == ""+bc[x].createdBy))) {
				//$(".all-bids .section-body ").append(msg);
				//$(".my-info").append(", Inside msgArr aoId="+aoId+", Inside crtBy="+bc[x].createdBy);
				if(!firstBroadcastReq) {
					if(len==1) msgArr[0] = msg;
					else if(len>1) {
						msgArr[len-x-1] = msg;
					}
				} else {
					msgArr[len-x-1] = msg;
				}
			}
			if(x==0) {
				if(bc[x].utype=="B") currMsg = bc[x].uname + "(AO-Banker) says : " + msg1;
			}
		}
		for(var x=0;x<msgArr.length;x++) {
			$(".all-bids .section-body").prepend(msgArr[x]);
		}
		//alert(currMsg+","+(currMsg==lastMsg));
		if(currMsg.length>0 && !(currMsg==lastMsg)) {
			showMessageDiv("Broadcast", currMsg);
		}
		lastMsg = currMsg;
	}
}
function updatePrevBroadcast(data) {
	ajaxRespNo = data.ajaxRespNo;
	//$(".my-info").append(", rp"+ajaxRespNo);
	if(data.prevBcid) prevBcid = data.prevBcid;
	if(data.currBcPage) currBcPage = data.currBcPage;
	if(data.bcPages) totBcPages = data.bcPages;
	if(!startedCommunicatingServer) {
		startedCommunicatingServer = true;
		getCurrentBid();
	}
	//alert(data.broadcast);
	if(data.broadcast) {
		var bc = data.broadcast;
		//$(".all-bids .section-body").html("");
		//$("#historyIds").prepend(";len="+bc.length+",bcid:"+data.sessbcid+";");
		var msgArr = new Array();
		var len = bc.length;
		var xx = 0;
		//alert(len);
		for(var x = 0; x<bc.length; x++) {
			/*var histIds = $("#historyIds").html();
			if(histIds.indexOf(" "+bc[x].bcid+",")>=0) continue;
			$("#historyIds").prepend(" "+bc[x].bcid+",");*/
			var str = "odd";
			if(x%2==1) str = "even";
			var msg = bc[x].message;
			//$(".my-info").append(aoId+"" == ""+bc[x].createdBy);
			//$(".my-info").append(uid+"" == ""+bc[x].createdBy);
			//alert(aoId+"aoiD"+bc[x].createdBy);
			//alert(uid+"uid"+bc[x].createdBy);
			//alert(bc[x].userType=="Event" && ((uid+"" == ""+bc[x].createdBy) || (aoId+"" == ""+bc[x].createdBy)));
			if(bc[x].userType=="Event" && ((uid+"" == ""+bc[x].createdBy) || (aoId+"" == ""+bc[x].createdBy))) {
				msg = "<div class='user-quote "+str+"'>Event : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </div>";
			}else if(bc[x].userType=="B" || bc[x].userType=="AO") {
				msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(AO-Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			} else if(bc[x].userType=="C" && (uid+"" == ""+bc[x].createdBy)) {
				msg = "<div class='user-quote "+str+"'><table border='0'><tr><td>"+bc[x].uname+" says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			}
			if( (bc[x].userType=="Event" && ((uid+"" == ""+bc[x].createdBy) || (aoId+"" == ""+bc[x].createdBy))) || bc[x].userType=="B" || bc[x].userType=="AO" || (bc[x].userType=="C" && (uid+"" == ""+bc[x].createdBy))) {
				msgArr[xx] = msg;
				++xx;
			}
		}
		for(var x=0;x<msgArr.length;x++) {
			$(".all-bids .section-body-prev").append(msgArr[x]);
		}
	}
}
function displayMoney(money) {
	var str = ""+money;
	var digit = "", totStr = "";
	for (var x=str.length-1; x>=0; x--) {
		digit = str.substring(x,x+1);
		if(totStr.length==3) totStr = ","+totStr;
		else if(totStr.length>3 && (totStr.length%3==0)) totStr = ","+totStr;
		totStr = ""+digit+""+totStr;
	}
	return totStr;
}
function getDateObjectByOffset(dtStr) {
	var dtTmArr = dtStr.split(" ");
	var dtArr = dtTmArr[0].split("-");
	var tmArr = dtTmArr[1].split(":");
	
	var yy = (parseInt(dtArr[0], 10));
	var mm = (parseInt(dtArr[1], 10));
	var dd = (parseInt(dtArr[2], 10));
	var hh = (parseInt(tmArr[0], 10));
	var min = (parseInt(tmArr[1], 10));
	var sec = (parseInt(tmArr[2], 10));  
	//alert(timerDt+";"+yy+","+mm+","+dd+","+hh+","+min+","+sec);
	//var dt2 = new Date(yy, mm-1, dd, hh+5, min+30, sec, 0); //this is servercode
	var dt2 = new Date(yy, mm-1, dd, hh, min, sec, 0);
	return dt2;
}
function getDateStrByOffset(dtStr) {
	var dt = getDateObjectByOffset(dtStr);
	var yy = dt.getFullYear();
	var mm = (dt.getMonth()+1);
	var dd = dt.getDate();
	var hh = dt.getHours();
	var min = dt.getMinutes();
	var ss = dt.getSeconds();
	var dtStr2 = yy+"-"+(mm<10 ? ("0"+mm) : mm)+"-"+(dd<10 ? ("0"+dd) : dd)+" "+(hh<10 ? ("0"+hh) : hh)+":"+(min<10 ? ("0"+min) : min)+":"+(ss<10 ? ("0"+ss) : ss);
	return dtStr2;
}

function updateBankerStatus(data){
		//$(".my-info").append("len,"+data.participants.length);
	if(data.participants) {
		for(var x = 0; x<data.participants.length;x++) {
			var pp = data.participants[x];
			//$(".my-info").append("ppt,"+pp.userType);
			if(pp.userType=="AO") { 
                if(pp.isLogin=="Y") {
                        $(".ao-status").html("Online").removeClass("red").addClass("green");
                } else {
                        $(".ao-status").html("Offline").removeClass("green").addClass("red");
                }
      		 
        }


		}
	}
}

function showInstanceLogout() {
	alert("You are logged into other browser, so you are logged out from here.");
	//window.location.href = "<?php echo base_url(); ?>admin/verifylogin/logout";
	window.location.href = "logout.htm"; //"eauction/logout.htm";
}
function ajaxCheckLogin(){
//	alert("check login");
	//var urlStr = "<?php echo base_url(); ?>admin/verifylogin/AjaxIslogIn";
	$.ajax({
			type: "POST",
			url: "/eauction/ajaxIsLogin.htm",
			dataType: "json",
			error: function(req, status, error) { },
			success: function(data) {
				//alert(data);
						if(data.isLogin && data.isLogin=="N") {
							showInstanceLogout();
						}
					}
				
		});
}



</script>
