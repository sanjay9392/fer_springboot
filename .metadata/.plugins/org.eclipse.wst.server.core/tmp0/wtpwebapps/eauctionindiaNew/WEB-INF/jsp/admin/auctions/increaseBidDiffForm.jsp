<%@page import="com.zedapp.eauction.model.Auction"%>
<%Auction auction= (Auction) request.getAttribute("auction"); %>

<div class="admin-bid-diff">
	<div class="section-title">Increase Bidding Rule</div>
	<div class="section-body">
	<div class="admin-bid-rule"> </div>
		<div class="start-bid"> Reserve Price: Rs.<%=auction.getProject().getMinBid() %> </div>
		<!-- <div class="min-bid"><span>Minimum</span>
			<span><input type="text" name="minBidDiff" id="minBidDiff" onkeyup="submitBidDiff(event);"></span>
		</div>
		<div class="max-bid"><span>Maximum</span>
			<span><input type="text" name="maxBidDiff" id="maxBidDiff" onkeyup="submitBidDiff(event);"></span>
		</div> -->
		<div class="max-bid"><span>Amount for Interse Bid</span>
			<span><input type="text" name="maxBidDiff" id="maxBidDiff" onkeyup="submitBidDiff(event);"></span>
		</div>
		
		<input type="submit" value="Submit Bidding Rule" onclick="sendBidDiff();">
		<!-- <table>
		<tr height="30"><th height="30" style="line-height:30px">Minimum</th>
			<td height="30" style="line-height:30px"> <input type="text" name="minBidDiff" id="minBidDiff" onkeyup="submitBidDiff(event);"> </td>
			</tr>
		<tr height="30"><th height="30" style="line-height:30px">Maximum</th><td> <input type="text" name="maxBidDiff" id="maxBidDiff" onkeyup="submitBidDiff(event);"> </td></tr>
		<tr height="30"><td colspan="2" height="30" style="line-height:30px"> <input type="button" class="button" value="Submit Bidding Rule" onclick="sendBidDiff();"> </td></tr>
		</table> -->
		<!-- <input type="button" class="button" value="Close Auction" onclick="closeAuction()"> -->
		<div class="my-last-bid"> </div>
	</div>
</div>
