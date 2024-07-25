<script src="js/jqueryRotate.js" type="text/javascript"></script>
<%@page import="com.zedapp.eauction.model.Customer"%>
<%@page import="java.util.Set"%>
<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.eauction.model.Auction"%>
<%@page import="com.zedapp.eauction.model.BankProjects"%>
<script src="./js/jqueryRotate.js" type="text/javascript"></script>
<style type="text/css">
#closeAucButton { display: none; }
</style>
<%
User user=null;
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
if(status.equals("CL"))
	status="Cancel";


String uType="";
String uname = "Guest";
int userId=user.getUserId();
int aoId=auction.getAoid();
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
//Set<Customer> custList=(Set)request.getAttribute("customerList");
%>
<div id="wrapper">
	<div id="header">
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
	</div><!--header-->
	<div class="clear"></div>
	<div id="admin-content">
<div class='current-time'>Date</div>
<div class='network-status'>Processing...</div>
<div class="clear"></div>
<div class="my-info"></div>
<div class="alertDiv">
	<div class="section-title"></div>
	<div class="section-body"></div>
	<div class="section-footer">
		<input type="button" class="button2" value="OK" onclick="alertOK()">
		<input type="button" class="button2" value="Cancel" onclick="alertCancel()">
	</div>
</div>
<div class="alertDiv2" id="messageDiv">
	<div class="section-title"></div>
	<div class="section-body"></div>
	<div class="section-footer">
		<input type="button" class="button3" value="OK" onclick="msgOK()">
	</div>
</div>
<table border="0" cellspacing="0" cellpadding="0">
<tr><td valign="top">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr><td rowspan="2" valign="top">
	<jsp:include page="currentBid.jsp" />
	</td><td>
	<%if(user.getUserType().equals("AO") && (userId==aoId) ){%>
		<jsp:include page="increaseBidDiffForm.jsp"/>
	<%} %>
	</td></tr>
	<tr><td>
	<%if(user.getUserType().equals("AO") && (userId==aoId)) {%>
	<jsp:include page="broadcastmessage.jsp"/>
	<%} %>
	</td></tr>
	</table>
<div class='clear'></div>
<div class='live-bid'>
	<div class="custname"></div>
	<div class="running-bid"></div>
</div>
<jsp:include page="allBids.jsp"/>
</td>
<td valign="top">
<%if(user.getUserType().equals("AO") && (userId==aoId)){
	if( auction.getStatus().equals("P")){ 
%>
	<input type="button" class="button2" id="button2" value="Start Auction" onclick="startAuction();">
	<%} %>
	<div class="auction-timer-div">
		<div class="section-title">Closing Timer</div>
		<div class="section-body">
			<br>Enter timer (in minutes) <br>
			<input type="text" name="closingTimer" size="5" id="closingTimer"> in Minutes <br><br>
			<input type="hidden" name="oldTimer" id="oldTimer" value="0">
			<input type="button" class="button2" value="Start Timer" onclick="startTimer(1)">
			<input type="button" class="button2" value="Stop Timer" onclick="stopTimer()">
			<input type="button" class="button2" value="Reverse Timer" onclick="startReverseTimer(1)">
		</div>
	</div>
<%} %>
<table>
<tr><td>
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
	    
    </div>
</td></tr>
<tr><td> <div class='timerOption'></div><div class="timer-run">00:00</div> </td></tr>
</table>
	
	<%if(user.getUserType().equals("AO") && (userId==aoId) ) {%>
		
		<input type="button" class="button2" id="closeAucButton" value="Close Auction" onclick="closeAuction();">
	<%} %>
	<jsp:include page="participantsList.jsp"/>
</td></tr>
</table>
<div id="footer">
		<div id="footer-top"></div>
		<div id="footer-bottom"></div>
</div>
<script type="text/javascript">
var $ = jQuery;
var minBid = <%= project.getMinBid()%>;
var currentBid = minBid;
var minBidDiff = <%= project.getMinBidDiff()%>;
var maxBidDiff = <%=project.getMaxBidDiff()%>;
var initMinBidDiff = minBidDiff, initMaxBidDiff = maxBidDiff;
var tempMinBidDiff = minBidDiff, tempMaxBidDiff = maxBidDiff;
var bidInterval = 0;
var timeId = 0, closeTimer = 0, closeTimerId = 0, timerDt = "", mm = 0, ss = 0;
var isTimerStarted = false, isFirstCall = true;
var isAuctionStarted = <%=((status=="Running")?true:false)%>;
var utype = "AO";//"<?php echo $this->session->userdata('utype'); ?>";
var isAOBanker = (utype=="AO") ? true : false;
var isClosingTimer = "";
var curCloseTimer = 0;
//alert(isAOBanker);
var timerSync = 2000;
var ajaxReqNo = 0;
var ajaxRespNo = 0;
var optionTimerDisplay = false;
var optionReverseTimerDisplay = false;
var initTimer = 0;
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
var callQueue = [];
$(document).ready(function() {
	ieVersion = getIEVersion();
	var today = new Date();
	$(".current-time").html(""+today);
	getPrevBroadcast();
	//getCurrentBid();
	//bidInterval = setInterval(getCurrentBid, timerSync);
	timeId = setInterval(showDateTime, 2000);
	secondsIntervalId = setInterval(increaseSecondsInterval, 1000);
	$(".alertDiv").draggable({ handle: $(".alertDiv .section-title") });
	showHighestQuote();
	setInterval(ajaxCheckLogin, 5000);
});
$(window).unload(function() {
	clearInterval(closeTimerId);
	//clearInterval(bidInterval);
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
	if(!getAjaxMode && callQueue.length>0) {
		(callQueue.shift())();
		return;
	}
	if(startedCommunicatingServer && !getAjaxMode && (secondsInterval%(secDiff)==0)) {
		getCurrentBid();
	}
}
function showHighestQuote() {
	var hcid = "<?php echo $highestQuoteCid; ?>";
	//alert(hcid);
	$(".user").removeClass("highestBid");
	$(".user_"+hcid).addClass("highestBid");
	$(".cust_"+hcid).addClass("highestBid");
}
function showDateTime() {
	var today = new Date();
	$(".current-time").html(""+today);
}
function showNetworkError() {
	$(".network-status").html("Browser is Slow or Network Down").addClass("network-error");
}

function stopTimer() {
	if(isTimerStarted){
		//$(".my-info").append("istimerstarted=="+isTimerStarted);
		//$("#disp-timer").countdown.stop();
		if(isClosingTimer=="N") {
			//showConfirm("Are you sure, you want to stop the timer?", "stopTimerToZero()");
			showConfirm("Are you sure, you want to stop the timer?", "checkForStopTimer()");
		} else if(isClosingTimer && isClosingTimer=="Y") {
			//stopReverseTimerToZero();
			showMessage("TimerInfo","Reverse Timer Cannot be Stopped");
			return;
		} else {
			//stopTimerToZero();
			//stopTimerByAO();
			checkForStopTimer();
		}
	}
}
function checkForStopTimer() {
	if(startedCommunicatingServer && !getAjaxMode) {
		stopTimerByAO();
		$(".timerOption").hide();
		
	} else {
		msgOK();
		callQueue.push(stopTimerByAO);
	}
}
function stopReverseTimer() {
	//$("#disp-timer").countdown.stop();
	stopReverseTimerToZero();
}
function startTimer(isClicked) {
	var ct = $("#closingTimer").val();
	//alert("start Timer: "+$("#closingTimer").val());
	if(ct>0) {} else {
		showMessage("Alert","Enter timer");
		$("#closingTimer").focus();
		return; 
	}
	if( !(isClicked==2)) {
		if(isAuctionStarted){
		//if(!isClicked) return;
		/*var agree = confirm("Are you sure, you want to start the timer?");
		if(!agree) return;*/
		//showConfirm("Are you sure, you want to start the timer?", "startAOTimer()");
		showConfirm("Are you sure, you want to start the timer?", "checkForStartTimer()");
		
		}else{
				showMessage("Alert","Auction Not Started");
		}
	} else {
		//startAOTimer();
		checkForStartTimer();
	}
	/*$(".timer-run").html(closeTimer);
	if(closeTimerId==0) {
		closeTimerId = setInterval(decreaseTime, 1000);
	}*/
}
//var startTimerId = 0;
function checkForStartTimer() {
	if(startedCommunicatingServer && !getAjaxMode) {
		startAOTimer();
		timerOption("N");
	} else {
		msgOK();
		callQueue.push(startAOTimer);
	}
	
	
}
function timerOption(timer){
	
	if(timer === "N"){
		alert("Normal Timer: ");
		$(".timerOption").html("Normal Timer");	
	}if(timer === "R"){
		$(".timerOption").html("Reverse Timer");
	}
	//$(".button5").hide(); $("#button2").hide(); $("#closeAucButton").show();
	
	//$(".timer-run").html("00:00");
}
function startAOTimer() {
	msgOK();
	isTimerStarted = true;
	isClosingTimer = "N";
	clearInterval(closeTimerId);
	closeTimerId = 0;
	closeTimer = 60 * parseFloat($("#closingTimer").val());
	initTimer = closeTimer;
	if(closeTimer>180) optionTimerDisplay = false;
	mm = parseFloat($("#closingTimer").val());
	ss = 0;
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	//$(".my-info").append("st, "+dispTimer);
	rotateHands(mm,ss);
	//alert(closeTimer);
	var aid = $("#aid").val();
	var urlStr = "/eauction/ajaxStartTimer.htm";
	if(isAOBanker) {
		increaseAjaxReqNo();
		$.ajax({
			type: "POST",
			url: urlStr,
			data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&timerVal="+closeTimer+"&prevBcid="+prevBcid,
			timeout: ajaxTimeout,
			dataType: "json",
			error: function(req, status, error) {
					checkResponseTimeout(status);
				},
			success: function(data) {
				
				/*timerDt = data;
				//alert(data);
				//alert((data.found=="true")+","+(data.found || data.found=="true"));
				$(".timer-run").html(dispTimer); //closeTimer);
				if(closeTimerId==0) {
					closeTimerId = setInterval(decreaseTime, 1000);
				}*/
				updateCurrentBid(data);
			}
		});
	}
}
function startReverseTimer(isClicked) {
	var ct = $("#closingTimer").val();
	//alert("start Timer: "+$("#closingTimer").val());
	if(ct>0) {} else {
		showMessage("Alert","Enter timer");
		$("#closingTimer").focus();
		return; 
	}
	//if(!isClicked) return;
	/*var agree = confirm("Are you sure, you want to start the timer?");
	if(!agree) return;*/
	if(isAuctionStarted){
		//showConfirm("Are you sure, you want to start the Reverse timer?", "startAOReverseTimer()");
		showConfirm("Are you sure, you want to start the Reverse timer?", "checkForStartReverseTimer()");
		
	}else{
		showMessage("Alert","Auction Not Started");
	}
	
	//alert(closeTimer);
	/*$(".timer-run").html(closeTimer);
	if(closeTimerId==0) {
		closeTimerId = setInterval(decreaseTime, 1000);
	}*/
}
function checkForStartReverseTimer() {
	if(startedCommunicatingServer && !getAjaxMode) {
		startAOReverseTimer();
		timerOption("R");
	} else {
		msgOK();
		callQueue.push(startAOReverseTimer);
	}
}
function startAOReverseTimer() {
	msgOK();
	isTimerStarted = true;
	//$(".my-info").append("reverseTimer started, ");
	isClosingTimer = "Y";
	clearInterval(closeTimerId);
	closeTimerId = 0;
	closeTimer = 60 * parseFloat($("#closingTimer").val());
	initTimer = closeTimer;
	if(closeTimer>30) optionReverseTimerDisplay = false;
	mm = parseFloat($("#closingTimer").val());
	ss = 0;
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	rotateHands(mm,ss);
	//alert(closeTimer);
	var aid = $("#aid").val();
	var urlStr = "/eauction/ajaxStartReverseTimer.htm";
	increaseAjaxReqNo();
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&timerVal="+closeTimer+"&prevBcid="+prevBcid,
		timeout: ajaxTimeout,
		dataType: "json",
		error: function(req, status, error) {
				checkResponseTimeout(status);
			},
		success: function(data) {
			/*timerDt = data;
			//alert(data);
			//alert((data.found=="true")+","+(data.found || data.found=="true"));
			$(".timer-run").html(dispTimer); //closeTimer);
			if(closeTimerId==0) {
				closeTimerId = setInterval(decreaseReverseTimer, 1000);
			}*/
			updateCurrentBid(data);
		}
	});
}
function startTimerByValue(tv) {
	/*if(isClosingTimer == "Y"){
	}
	else if(tv > closeTimer) tv = closeTimer;*/
	var ct = tv;
	//$(".my-info").append("; stv-ict="+isClosingTimer+", ct="+ct);
	isTimerStarted = true;
	clearInterval(closeTimerId);
	closeTimerId = 0;
	closeTimer = parseFloat(ct);
	if(isClosingTimer=="Y") {
		if(closeTimer>30) optionReverseTimerDisplay = false;
	} else {
		if(closeTimer>180) optionTimerDisplay = false;
	}
	mm = parseInt(closeTimer/60, 10);
	ss = closeTimer - (mm * 60);
	if(ss<0) ss = 0;
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	rotateHands(mm,ss);
	//alert(closeTimer);
	//var aid = $("#aid").val();
	$(".timer-run").html(dispTimer); //closeTimer);
	if(closeTimerId==0) {
		if(isClosingTimer=="Y") {
			//$(".my-info").append("decrease reverseTimer, ");
			closeTimerId = setInterval(decreaseReverseTimer, 1000);
		} else {
			//$(".my-info").append("decrease timer, ");
			closeTimerId = setInterval(decreaseTime, 1000);
		}
	}
}
function stopTimerToZero() {
	if(isTimerStarted) {
		msgOK();
	isTimerStarted = false;
	clearInterval(closeTimerId);
	closeTimerId = 0;
	$(".timer-run").html("00:00");
	
	closeTimer = 0;
	mm = parseInt(closeTimer/60, 10);
	ss = 0;
	rotateHands(mm,ss);
	}
}
function stopTimerByAO() {
	if(isTimerStarted) {
		msgOK();
	isTimerStarted = false;
	clearInterval(closeTimerId);
	closeTimerId = 0;
	$(".timer-run").html("00:00");
	var aid = $("#aid").val();
	var urlStr = "/eauction/ajaxStopTimer.htm";
	if(isAOBanker) {
		increaseAjaxReqNo();
		//$(".my-info").append("timer stopped, ");
		$.ajax({
			type: "POST",
			url: urlStr,
			data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
			timeout: ajaxTimeout,
			dataType: "json",
			error: function(req, status, error) {
					checkResponseTimeout(status);
				},
			success: function(data) {
				/*if(data.length>0)  {
				timerDt = data;
				$(".timer-run").html("00:00"); //closeTimer);
				}*/
				updateCurrentBid(data);
			}
		});
	}
	closeTimer = 0;
	mm = parseInt(closeTimer/60, 10);
	ss = 0;
	rotateHands(mm,ss);
	}
}
function stopReverseTimerToZero() {
	if(isTimerStarted) {
		//showMessage("Alert", "Timer is getting stopped");
		/*isTimerStarted = false;
		isClosingTimer = "N";
		clearInterval(closeTimerId);
		closeTimerId = 0;
		$(".timer-run").html("00:00");*/
		//$(".my-info").append("is closingTimer"+isClosingTimer);
		var aid = $("#aid").val();
		var urlStr = "/eauction/ajaxStopReverseTimer.htm";
		if(isAOBanker) {
			//$(".my-info").append("reverseTimer STOPping, ");
			callAjaxCloseReverseTimer(urlStr, aid);
		}
		/*closeTimer = 0;
		mm = parseInt(closeTimer/60, 10);
		ss = 0;
		rotateHands(mm,ss);*/
	}
}
var cctime = 0;
function callAjaxCloseReverseTimer(urlStr, aid) {
	//$(".my-info").append(", urlStr="+urlStr+", aid="+aid);
	increaseAjaxReqNo();
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
		timeout: ajaxTimeout,
		dataType: "json",
		error: function(req, status, error) {
				checkResponseTimeout(status);
			},
		success: function(data) {
			//showMessage("Alert", cctime+","+data);
			++cctime;
			/*
			if(data.length>0)  {
				cctime = 0;
				timerDt = data;
				$(".timer-run").html("00:00"); //closeTimer);
			} else {
				callAjaxCloseReverseTimer(urlStr, aid);
			}*/
			//showMessage("Alert", cctime+", stopDt="+data.dt+", allow="+data.allow+", sec="+data.sec+", counter="+data.counter+", ict="+data.isClosingTimer+", mdt="+data.modDt+", ndt="+data.nowDt+", restarted="+data.counterRestarted);
			if(data.counterRestarted && data.counterRestarted=="Y") {
				var xtimer = data.counter - data.sec;
				if(xtimer>0) startTimerByValue(xtimer);
			} else if(data.dt && data.counterRestarted=="N")  {
				cctime = 0;
				timerDt = data.dt;
				$(".timer-run").html("00:00"); //closeTimer);
				isTimerStarted = false;
				isClosingTimer = "N";
				clearInterval(closeTimerId);
				closeTimerId = 0;
				$(".timer-run").html("00:00");
				closeTimer = 0;
				mm = parseInt(closeTimer/60, 10);
				ss = 0;
				rotateHands(mm,ss);
			} else {
				//callAjaxCloseReverseTimer(urlStr, aid);
			}
		}
	});
}
function decreaseTime() {
	--closeTimer;
	//alert(closeTimer);
	
	mm = parseInt(closeTimer / 60, 10);
	ss = closeTimer - (mm*60);
	if(ss<0) ss = 0;
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	//alert(dispTimer);
	rotateHands(mm,ss);
	$(".timer-run").html(dispTimer); //closeTimer);
	if(initTimer>180 && closeTimer<=180 && !optionTimerDisplay) {
		optionTimerDisplay = true;
		optionToIncreaseTimer();
	}
	if(closeTimer<=0) {
		clearInterval(closeTimerId);
		
		//closeAuction();
		stopTimerToZero();
		//showAlert("Auction Info", "Highest Bid is Rs."+displayMoney(currentBid), "<input type='button' class='button2' value='OK' onclick='alertCancel()'>");
		//clearInterval(bidInterval);
	}
}
function decreaseReverseTimer() {
	--closeTimer;
	if(closeTimer>0) curCloseTimer = closeTimer;
	--curCloseTimer;
	if(closeTimer<0) closeTimer = 0;
	//$(".my-info").append(", "+closeTimer+" "+curCloseTimer);
	mm = parseInt(closeTimer / 60, 10);
	ss = closeTimer - (mm*60);
	if(ss<0) ss = 0;
	var dispTimer = (mm<10 ? ("0"+mm) : mm) + ":" + (ss<10 ? ("0"+ss) : ss);
	//alert(dispTimer);
	rotateHands(mm,ss);
	$(".timer-run").html(dispTimer); //closeTimer);
	if(initTimer>30 && closeTimer<=30 && !optionReverseTimerDisplay) {
		optionReverseTimerDisplay = true;
		//optionToIncreaseTimer();
		optionToIncreaseReverseTimer();
	}
	if(curCloseTimer<-2) {
		clearInterval(closeTimerId);
		//closeAuction();
		//$(".my-info").append(", reverse time will be stopped now, ");
		stopReverseTimerToZero();
		//showAlert("Auction Info", "Highest Bid is Rs."+displayMoney(currentBid), "<input type='button' class='button2' value='OK' onclick='alertCancel()'>");
		//clearInterval(bidInterval);
	}
}
function rotateHands(mm, ss) {
	var amm = mm*6;
	var ass = ss*6;
	
	if($.browser.msie) {
		$('#minutes').css('cssText','-ms-transform: rotate('+amm+'deg)');
		$('#seconds').css('cssText','-ms-transform: rotate('+ass+'deg)');
	} else {
		$("#minutes").rotate(amm);
		$("#seconds").rotate(ass);
	}
	/* if(amm == 0 && ass == 0){
		$(".timerOption").hide();
	} */
}
function optionToIncreaseTimer() {
	var ct = initTimer/60; //parseFloat("0"+$("#closingTimer").val());
	if(ct==0) {
		ct = parseFloat("0"+$("#oldTimer").val());
		ct = parseFloat(ct/60);
	}
	showAlert("Increase Timer", "Do you want to increase "+ct+" more minute?");
	/*var ans = showAlert("Do you want to increase "+ct+" more minute?");
	if(ans) {
		//closeTimer = 60 * ct;
		startTimer();
	}*/
}
function optionToIncreaseReverseTimer() {
	var ct = initTimer/60; //parseFloat("0"+$("#closingTimer").val());
	if(ct==0) {
		ct = parseFloat("0"+$("#oldTimer").val());
		ct = parseFloat(ct/60);
	}
	showConfirm("Do you want to increase "+ct+" more minute?","IncreaseReverseTimer()");
	/*var ans = showAlert("Do you want to increase "+ct+" more minute?");
	if(ans) {
		//closeTimer = 60 * ct;
		startTimer();
	}*/
}
function IncreaseReverseTimer() {
	//$(".alertDiv").hide();
    msgOK();
	closeTimer = initTimer; //60 * parseFloat("0"+$("#closingTimer").val());
	startAOReverseTimer();
}
function alertOK() {
	$(".alertDiv").hide();
	closeTimer = initTimer; //60 * parseFloat("0"+$("#closingTimer").val());
	startTimer(2);
}
function alertCancel() {
	$(".alertDiv").hide();
}
function msgOK() {
	$("#messageDiv").find(".section-title").html("");
	$("#messageDiv").find(".section-body").html("");
	$("#messageDiv").find(".section-footer").html("<input type='button' class='button2' value='OK' onclick='msgOK()'>");
	$("#messageDiv").hide();
}
function getCurrentBid() {
	lastSecInterval = secondsInterval;
	//$(".my-info").append(", sl:"+lastSecInterval);
	//if(ajaxRespNo != ajaxReqNo) return;
	var aid = $("#aid").val();
	increaseAjaxReqNo();
	var urlStr = "/eauction/ajaxCurrentBid.htm";
	//var urlStr = "ajaxCurrentBid/"+aid;
	//alert(aid+","+urlStr);
	if(aid==0) return;
	getAjaxMode = true;
	$.ajax({
		type: "POST",
		url: urlStr,
		data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
		timeout: ajaxTimeout,
		dataType: "json",
		error: function(req, status, error) {
				//$(".my-info").append(", error:"+error);
				getAjaxMode = false;
				checkResponseTimeout(status);
			},
		success: function(data) {
			//alert(data);
			//showMessage("Info", data);
			//alert((data.found=="true")+","+(data.found || data.found=="true"));
			curSecInterval = secondsInterval;
			//$(".my-info").append(",rc:"+curSecInterval);
			respTime = (curSecInterval - lastSecInterval);
			updateCurrentBid(data);
			getAjaxMode = false;
			curSecInterval = secondsInterval;
			var respTime2 = (curSecInterval - lastSecInterval);
			if((respTime2-respTime)>0) {
				//$(".my-info").append(", ::::::::::::::::::::::::::::::::::::::::"+(respTime2-respTime));
			}
			/*if(respTime >= secDiff) {
				getCurrentBid();
			}*/
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
function increaseBidDiff() {
	tempDiff = parseFloat(bidDiff) + parseFloat(initBidDiff);
	$("#adminBid").val(tempDiff);
}
function sendBroadcast() {
	//var agree = confirm("Are you sure you want to send Broadcast Message?");
	//if(!agree) return;
	showConfirm("Are you sure you want to send Broadcast Message?", "sendBroadcastByAO()");
}
function sendBroadcastByAO() {
	msgOK();
	var aid = $("#aid").val();
	//var bid = $("#bid").val();
	//alert(bid);
	if(aid==0) return;
	var broadcast = $("#broadcast").val();
	increaseAjaxReqNo();
	$.ajax({
		type: "POST",
		url: "/eauction/ajaxSubmitBroadcast.htm",
		data: "broadcast="+broadcast+"&aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
		dataType: "json",
		error: function(req, status, error) { /*alert(status+","+error);*/ },
		success: function(data) {
			updateBroadcast(data);
		}
	});
	$("#broadcast").val("");
}
function updateBroadcast(data) {
	//alert(data.broadcast);
	if(data.broadcast) {
		var bc = data.broadcast;
		//$(".all-bids .section-body").html("");
		//$("#historyIds").prepend(";len="+bc.length+",bcid:"+data.sessbcid+";");
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
			//alert(bc[x].bcid+","+bc[x].createdDt+","+bc[x].createdDtStr+","+bc[x].created_dt);
			if(bc[x].userType=="Event") {
				msg = "<div class='user-quote "+str+"'>Event : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </div>";
			} else if(bc[x].userType=="B") {
				msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			} else if(bc[x].userType=="AO") {
				msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(AO-Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			} else if(bc[x].userType=="C") {
				msg = "<div class='user-quote "+str+"'><table border='0'><tr><td>"+bc[x].uname+" says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			}
			if(!firstBroadcastReq) {
				if(len==1) msgArr[0] = msg;
				else if(len>1) {
					msgArr[len-x-1] = msg;
				}
				//$(".all-bids .section-body").prepend(msg);
			} else {
				msgArr[len-x-1] = msg;
				//$(".all-bids .section-body").append(msg);
				//$(".all-bids .section-body").prepend(msg);
			}
			//if(ajaxRespNo>1) {
			/*if(!firstBroadcastReq) {
				$(".all-bids .section-body").prepend(msg);
			} else {
				$(".all-bids .section-body").append(msg);
				//$(".all-bids .section-body").prepend(msg);
			}*/
		}
		for(var x=0;x<msgArr.length;x++) {
		
			$(".all-bids .section-body").prepend(msgArr[x]);
		}
	}
}
function updatePrevBroadcast(data) {
	ajaxRespNo = data.ajaxRespNo;
	//$(".my-info").append(", rp"+ajaxRespNo);
	if(data.prevBcid) prevBcid = data.prevBcid;
	if(data.currBcPage) currBcPage = data.currBcPage;
	if(data.bcPages) totBcPages = data.bcPages;
	if(!startedCommunicatingServer) {
		//$(".my-info").append(", start communicating..");
		startedCommunicatingServer = true;
		getCurrentBid();
	}
	if(data.broadcast) {
		var bc = data.broadcast;
		//$(".all-bids .section-body").html("");
		//$("#historyIds").prepend(";len="+bc.length+",bcid:"+data.sessbcid+";");
		var msgArr = new Array();
		var len = bc.length;
		for(var x = 0; x<bc.length; x++) {
			/*var histIds = $("#historyIds").html();
			if(histIds.indexOf(" "+bc[x].bcid+",")>=0) continue;
			$("#historyIds").prepend(" "+bc[x].bcid+",");*/
			var str = "odd";
			if(x%2==1) str = "even";
			var msg = bc[x].message;
			if(bc[x].userType=="Event") {
				msg = "<div class='user-quote "+str+"'>Event : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </div>";
			} else if(bc[x].userType=="B") {
				msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			} else if(bc[x].userType=="AO") {
				msg = "<div class='banker-info "+str+"'><table border='0'><tr><td>"+bc[x].uname + "(AO-Banker) says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			} else if(bc[x].userType=="C") {
				msg = "<div class='user-quote "+str+"'><table border='0'><tr><td>"+bc[x].uname+" says : " + msg + " ( "+getDateStrByOffset(bc[x].createdDtStr)+" ) </td></tr></table></div>";
			}
			msgArr[x] = msg;
		}
		for(var x=0;x<msgArr.length;x++) {
			$(".all-bids .section-body-prev").append(msgArr[x]);
		}
	}
}
function submitBidDiff(event) {
	var keyCode = event.keyCode;
	if(keyCode==13) {
		sendBidDiff();
	}
}
function sendBidDiff() {
	if(closeTimer==0) {
		if(!isTimerStarted) {
			showMessage("Information", "You cannot change the bidding rule with out starting timer. You can change it only when timer starts.");
		} else {
			showMessage("Information", "You cannot change the bidding rule with out starting timer. You can change it only when timer starts.");
		}
		return;
	}
	var aid = $("#aid").val();
	if(aid==0) return;
	//var agree = confirm("Are you sure you want to change the BID Rule?");
	//if(!agree) return;
	showConfirm("Are you sure you want to change the BID Rule?", "sendBidIntervalToServer()");
}
function sendBidIntervalToServer() {
	msgOK();
	var aid = $("#aid").val();
	if(aid==0) return;
	//var minBidDiffAmt = $("#minBidDiff").val();
	//if(minBidDiffAmt.length==0) return;
	var maxBidDiffAmt = $("#maxBidDiff").val();
	var checkMax = true;
	if(maxBidDiffAmt.length==0) {
		checkMax = false;
		maxBidDiffAmt = 0;
		maxBidDiffAmt = minBidDiffAmt;
		$("#maxBidDiff").val(maxBidDiffAmt);
	}
	/*if(checkMax && (parseFloat(minBidDiffAmt) > parseFloat(maxBidDiffAmt) ) ) {
		alert("Invalid Bid Rule : "+minBidDiffAmt+"-"+maxBidDiffAmt);
		$("#minBidDiff").focus();
		return;
	}*/
	$("#minBidDiff").val("");
	$("#maxBidDiff").val("");
	//alert("submit");
	increaseAjaxReqNo();
	$.ajax({
		type: "POST",
		url: "/eauction/ajaxSubmitBidrule.htm",
		data: "minBidDiff=0&maxBidDiff="+maxBidDiffAmt+"&aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
		timeout: ajaxTimeout,
		dataType: "json",
		error: function(req, status, error) {
				checkResponseTimeout(status);
			},
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
	//$(".my-info").append(", rqNo="+ajaxReqNo);
}
function updateCurrentBid(data) {
	
	
	if(data.login && data.login=="N") {
		
		showInstanceLogout();
	}
	//alert(data.found);
	if(data.found || data.found=="true") {
		ajaxRespNo = data.ajaxRespNo;
		if(ajaxRespNo == ajaxReqNo) $(".network-status").html("Network Connected").removeClass("network-error");
		else showNetworkError();
		//if(ajaxRespNo < ajaxReqNo) return;
		//$(".my-info").append(", rp"+ajaxRespNo);
		updateAuctionStatus(data);
		updateBidRule(data);
		updateRunningBid(data);
		updateHighestBid(data);
		updateParticipants(data);
		if(data.isClosingTimer) {
			isClosingTimer = data.isClosingTimer;
		}
		if(data.currentBid && data.currentBid.isclosing_timer) {
			isClosingTimer = data.currentBid.isclosing_timer;
		}
		/*if(firstBroadcastReq) updateBroadcast(data);
		if(!firstBroadcastReq) updateBroadcast(data);
		firstBroadcastReq = false;*/
		updateBroadcast(data);
		//$(".my-info").append(", upcb:ict="+isClosingTimer+", "+data.timer+",ct:"+data.currentBid.isclosing_timer);
		if(ajaxRespNo < ajaxReqNo) return;
		//$(".my-info").append(", rp"+ajaxRespNo);
		
		updateTimer(data);
		/*var newTimer = data.timer;
		$("#oldTimer").val(newTimer);
		if(newTimer==0) stopTimerToZero();
		//$(".my-info").append("; nt="+newTimer+", ts="+isTimerStarted+", "+timerDt+","+data.timerDt);
		if(newTimer>0) {
			//$(".my-info").append(",timerDt="+timerDt+","+data.timerDt);
			timerDt = data.timerDt;
			var dt1 = getDateObjectByOffset(data.nowDt); //new Date();
			var dt2 = getDateObjectByOffset(timerDt);
			var clientDt = new Date();
			var xtimer = newTimer - parseInt((dt1.getTime()-dt2.getTime())/1000, 10); // - parseInt((clientDt.getTime()-dt1.getTime())/1000, 10);
			//$(".my-info").append(", xtimer = "+xtimer+", nt="+newTimer+", dt1="+dt1+", dt2="+dt2+", cdt="+clientDt);
			if(xtimer>0) startTimerByValue(xtimer);
		}*/
		//if(!firstBroadcastReq) updateBroadcast(data);
		//firstBroadcastReq = false;
	}
}
function updateAuctionStatus(data) {
	if(lastAucStatus==data.status) return;
	var statusStr = "Not Started";
	if(data.status=="S") { statusStr = "Running"; isAuctionStarted = true; $(".button5").hide(); $("#button2").hide(); $("#closeAucButton").show(); }
	if(data.status=="C") {
		statusStr = "Closed";
		showMessage("Auction Info", "Highest Bid is Rs."+displayMoney(data.currentBid.bidAmount), "<input type='button' class='button3' value='OK' onclick='msgOK()'> &nbsp; <input type='button' class='button' value='Print Report' onclick='openWindow("+data.aid+")'>");
		clearInterval(bidInterval);
		clearInterval(secondsIntervalId);
		$(".admin-bid-diff .section-body").html("Bid is closed, cannot change the bid rule interval.");
		$(".auction-timer-div .section-body").html("Bid is closed, timer cannot be started.");
		$(".button2").hide();
		$("#closeAucButton").hide();
	}
	lastAucStatus = data.status;
	$(".running-status").html("Auction Status: "+statusStr);
}
function updateBidRule(data) {
	//if(maxBidDiff==data.latestMaxBidDiff) return;
	if(data.latestMaxBidDiff) {
		maxBidDiff = data.latestMaxBidDiff;
		$(".admin-bid-rule").html("Bid Rule changed : Rs."+displayMoney(maxBidDiff)+" (multiples)");
	}
}
function updateRunningBid(data) {
	//$(".my-info").append(", hq="+data.isHighestQuote);
	if(data.currentBid && data.currentBid.cname) {
		$(".custname").html("Last Bid by "+data.currentBid.cname+" : ");
	}
	if(data.isHighestQuote || data.isHighestQuote=="true" || data.isHighestQuote==1) {
		$(".custname").html("Bidding starts at ");
	}
	if(data.currentBid && data.currentBid.bidAmount) {
		$(".running-bid").html("Rs."+displayMoney(data.currentBid.bidAmount));
		currentBid = parseFloat(data.currentBid.bidAmount);
	}
}
function updateHighestBid(data) {
	if(lastHighestBidAmt == data.highestBidAmt) return;
	lastHighestBidAmt = data.highestBidAmt;
	if(data.lastBid) {
		var lastBid = data.lastBid;
		var highestBidder = 0, highestBidAmt = 0;
		//$(".my-info").append(", lastBid="+lastBid.length);
		for(var x=0;x<lastBid.length;x++) {
			$(".cust_"+lastBid[x].cid).html("Rs."+displayMoney(lastBid[x].bidAmount));
			//$(".my-info").append(", cust_"+lastBid[x].cid+"="+lastBid[x].bidAmt);
			//if(parseFloat(lastBid[x].bidAmt)>highestBidAmt) {
			if(lastBid[x].bidAmount > highestBidAmt) {
				highestBidAmt = parseFloat(lastBid[x].bidAmount);
				highestBidder = lastBid[x].cid;
			}
		}
		//$(".my-info").append(", highestBidder="+highestBidder);
		if(highestBidder>0) {
			$(".user").removeClass("highestBid");
			$(".user_"+highestBidder).addClass("highestBid");
			$(".cust_"+highestBidder).addClass("highestBid");
		}
	}
}
function updateParticipants(data) {
	if(data.participants) {
		for(var x = 0; x<data.participants.length;x++) {
			var pp = data.participants[x];
			if(pp.isLogin=="Y") {
				$(".clogin_"+pp.userId).html("Online").removeClass("red").addClass("green");
			} else {
				$(".clogin_"+pp.userId).html("Offline").removeClass("green").addClass("red");
			}
		}
	}
}
function updateTimer(data) {
	var newTimer = data.timer;
	$("#oldTimer").val(newTimer);
	if(newTimer==0) stopTimerToZero();
	//$(".my-info").append("; nt="+newTimer+", ts="+isTimerStarted+", "+timerDt+","+data.timerDt);
	if(newTimer>0) {
		//$(".my-info").append(",timerDt="+timerDt+","+data.timerDt);
		timerDt = data.timerDt;
		var dt1 = getDateObjectByOffset(data.nowDt); //new Date();
		var dt2 = getDateObjectByOffset(timerDt);
		//var clientDt = new Date();
		var xtimer = newTimer - parseInt((dt1.getTime()-dt2.getTime())/1000, 10); // - parseInt((clientDt.getTime()-dt1.getTime())/1000, 10);
		//$(".my-info").append(", xtimer = "+xtimer+", nt="+newTimer+", dt1="+dt1+", dt2="+dt2); //+", cdt="+clientDt);
		if(xtimer>0) startTimerByValue(xtimer);
	}
}
function showAlert(title, abody, footer) {
	$(".alertDiv .section-title").html(title);
	$(".alertDiv .section-body").html(abody);
	if(footer) {
		$(".alertDiv .section-footer").html(footer);
	}
	$(".alertDiv").show();
}
function showConfirm(content, okAction) {
	var str = "<input type='button' class='button2' value='OK' onclick='"+okAction+"'>";
	str += "<input type='button' class='button2' value='Cancel' onclick='msgOK()'>";
	showMessage("Confirm", content, str);
}
function showMessage(title, abody, footer) {
	$("#messageDiv .section-title").html(title);
	$("#messageDiv .section-body").html(abody);
	if(footer) {
		$("#messageDiv .section-footer").html(footer);
	}
	$("#messageDiv").show();
}
function openWindow(aid) {
	//window.open("<?php echo base_url(); ?>admin/BankProjects/viewPrintAuction/"+aid);
	window.open("viewPrintAuction.htm?aid="+aid,"toolbar=no,location=no,menubar=no, scrollbars=1");
}
function startCounter() {

}
function startAuction() {
	if(isAuctionStarted) {
		$(".button5").hide();
		//showMessage("Alert", "Auction has already started");
		return;
	}
	var aid = $("#aid").val();
	if(aid==0) return;
	/*var agree=confirm("Are you sure you want to start the Auction?");
	if(agree) {		
	}*/
	showConfirm("Are you sure you want to start the Auction?", "startAuctionByAO()");
}
function startAuctionByAO() {
	msgOK();
	var aid = $("#aid").val();
	increaseAjaxReqNo();
	$.ajax({
			type: "POST",
			url: "/eauction/ajaxStartAuction.htm",
			data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo+"&prevBcid="+prevBcid,
			timeout: ajaxTimeout,
			dataType: "json",
			error: function(req, status, error) {
					checkResponseTimeout(status);
				},
			success: function(data) {
				//alert(data);
				updateCurrentBid(data);
			}
		});
}
function closeAuction() {
	var aid = $("#aid").val();
	if(aid==0) return;
	//alert(aid);
	/*var agree=confirm("Are you sure you want to close the Auction?");
	if(agree) {	
	}*/
	showConfirm("Are you sure you want to close the Auction?", "closeAuctionByAO()");
}
function closeAuctionByAO() {
	msgOK();
	var aid = $("#aid").val();
	increaseAjaxReqNo();
	$.ajax({
			type: "POST",
			url: "/eauction/ajaxCloseAuction.htm",
			data: "aid="+aid+"&ajaxReqNo="+ajaxReqNo,
			timeout: ajaxTimeout,
			dataType: "json",
			error: function(req, status, error) {
					checkResponseTimeout(status);
				},
			success: function(data) {
				//alert(data);
				updateCurrentBid(data);
			}
		});
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
	if(!dtStr) return "";
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
	//var dt2 = new Date(yy, mm-1, dd, hh+5, min+30, sec, 0);
	var dt2 = new Date(yy, mm-1, dd, hh, min, sec, 0);
//	var t = dtStr.split(/[- :]/); //server code
	//$(".my-info").append("dt="+dtStr+"; "+t[0]+","+t[1]+","+t[2]+","+t[3]+","+t[4]+","+t[5]);
	//var dt2 = new Date(t[0], t[1]-1, t[2], parseInt(t[3],10) + 5, parseInt(t[4], 10) + 30, t[5], 0);//servercode
	return dt2;
}
function getDateStrByOffset(dtStr) {
	if(!dtStr) return "";
	var dt = getDateObjectByOffset(dtStr);
	var yy = dt.getFullYear();
	var mm = (dt.getMonth()+1);
	var dd = dt.getDate();
	var hh = dt.getHours();
	var min = dt.getMinutes();
	var ss = dt.getSeconds();
	var dtStr2 = yy+"-"+(mm<10 ? ("0"+mm) : mm)+"-"+(dd<10 ? ("0"+dd) : dd)+" "+(hh<10 ? ("0"+hh) : hh)+":"+(min<10 ? ("0"+min) : min)+":"+(ss<10 ? ("0"+ss) : ss);
	//alert("getDateStrByOff"+dtStr2);
	return dtStr2;
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

//alert(displayMoney(500)+" - "+ displayMoney(5000) + " - " + displayMoney(99000) + " - " + displayMoney(200000) + " - " + displayMoney(4400000) + " - " + displayMoney(55000000));

</script>
