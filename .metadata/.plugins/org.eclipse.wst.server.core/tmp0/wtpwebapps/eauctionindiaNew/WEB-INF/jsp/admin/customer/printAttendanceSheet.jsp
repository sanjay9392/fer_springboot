<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.zedapp.eauction.model.LoginHistory"%>



<%@page import="com.zedapp.eauction.model.User"%>
<%@page import="com.zedapp.common.util.DatesUtil"%>
<%@page import="com.zedapp.eauction.model.Payment"%>
<%@page import="com.zedapp.common.util.MoneyUtil"%>
<%
List<LoginHistory> loginHistory=(List) request.getAttribute("loginHistory");
User parcipant=(User) request.getAttribute("parcipant");
Payment payment=(Payment) request.getAttribute("payment");
Payment custPay=(Payment) request.getAttribute("custPay");
String uname=parcipant.getUserName();
%>
<center>
<table border=" 0" class="maincontent-table">
	<tr>
		<td width="650" valign="top" id="center-content">
		<div class="content">
		<div>
		
		</div>
		<!--view page-->
			
		<div id="a">
			<div class="msg"></div>
			
		<table border="">
		<tr><td valign="top">
			<div class="table">
			<table border="">		
			  <tr><td><input type="hidden" value="<%=payment.getCid() %>" name="cid" id="cid"/></td></tr>
				<h3><center> Attendance Sheet </center></h3>
				<!-- <tr><th colspan=2>Attendance Sheet</th></tr> -->
				<tr><th>Bidder name </th><th> Last Login(IST) </th><th>Last Logout(IST)</th><th> IP Address</th></tr>
				<%
					
					for(LoginHistory l:loginHistory){
				%>
				
				<tr> <td> <%=uname %> </td><td>
				<%
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss a");
					try {
					Date bcdt = l.getLoginDtTime();
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.DAY_OF_MONTH, bcdt.getDate());
					cal.set(Calendar.MONTH, bcdt.getMonth());
					cal.set(Calendar.YEAR, 1900+bcdt.getYear());
					cal.set(Calendar.HOUR_OF_DAY, bcdt.getHours()+5);
					cal.set(Calendar.MINUTE, bcdt.getMinutes()+30);
					cal.set(Calendar.SECOND, bcdt.getSeconds());
					cal.set(Calendar.MILLISECOND, 0);
					out.println(sdf.format(cal.getTime()));
					} catch(Exception ex) {ex.printStackTrace();}
					//DatesUtil.getFormatDMYHMSA(l.getLoginDtTime())
					%>
				</td>
				<td>
				<%
					try {
					Date bcdt = l.getLogoutDtTime();
					Calendar cal = Calendar.getInstance();
					cal.set(Calendar.DAY_OF_MONTH, bcdt.getDate());
					cal.set(Calendar.MONTH, bcdt.getMonth());
					cal.set(Calendar.YEAR, 1900+bcdt.getYear());
					cal.set(Calendar.HOUR_OF_DAY, bcdt.getHours()+5);
					cal.set(Calendar.MINUTE, bcdt.getMinutes()+30);
					cal.set(Calendar.SECOND, bcdt.getSeconds());
					cal.set(Calendar.MILLISECOND, 0);
					out.println(sdf.format(cal.getTime()));
					} catch(Exception ex) {ex.printStackTrace();}
					//DatesUtil.getFormatDMYHMSA(l.getLogoutDtTime())
					
					%>
				</td>
				<td><%=l.getIpaddress() %> </td></tr>
				<% }
				%>
				<tr><td><table border=''>
				<tr><td><b>Received DD NO</b></td><td> <%=payment.getDdNo() %></td></tr>
				<tr><td><b>Of</b></td><td><%=(custPay.getBankName()!=null)? custPay.getBankName():"NA" %></td></tr>
				<tr><td><b>For</b></td><td>Rs.<%=MoneyUtil.displayMoney(payment.getDdAmt()) %></td></tr>
				</table></td></tr>
			

			

			</table>
</div>			
		</td></tr>
		</table>

			</div>
			
			<!--edit page-->
		</div>
		
		</td>
		</tr>
</table>

</center>
