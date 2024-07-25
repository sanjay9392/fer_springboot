/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.107
 * Generated at: 2024-03-14 06:26:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.admin.auctions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.zedapp.common.util.MoneyUtil;
import java.util.Collections;
import com.zedapp.eauction.model.Borrower;
import java.util.List;
import java.util.Set;
import com.zedapp.eauction.model.BankProjects;
import com.zedapp.eauction.model.Auction;
import com.zedapp.eauction.model.User;
import java.util.HashSet;
import com.zedapp.common.util.DatesUtil;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"../js/jquery-1.4.4.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<div class=\"welcome\">\r\n");
      out.write("\r\n");
      out.write("<div class='current-time'>Date</div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"auctions-list\">\r\n");
      out.write("<div class=\"running-auctions\">\r\n");
      out.write("\t<div class=\"section-title\">Live Online Auctions</div>\r\n");
      out.write("\t");

	String uType="C";
	User user=null;
	
	if(request.getSession().getAttribute("loginUser")!=null)
		user = (User)request.getSession().getAttribute("loginUser");
	if(user!=null)
		uType=user.getUserType();
			Set<Auction> viewAuction=(Set)request.getAttribute("project");
			Collections.synchronizedCollection(viewAuction);
			
			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("S")){
				BankProjects p=auction.getProject();
				String minBid=p.getMinBid();
			
      out.write("\r\n");
      out.write("\t\t\t<div class='auction-project'>\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t");
      out.write("\r\n");
      out.write("\t\t\t<tr><td width=\"150\" class='auction-image' >\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t<a href=\"javascript:viewImg('");
      out.print(p.getPropertyImage() );
      out.write("')\"> <img src='./uploads/");
      out.print(p.getPropertyImage() );
      out.write("' width='100' height='100' alt='Auction Image'></a>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td width='150' class='auction-image'> \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t <a href=\"javascript:viewImg('");
      out.print(p.getAdvImage() );
      out.write("')\">  <img src='./uploads/");
      out.print(p.getAdvImage());
      out.write("' width='100' height='100' alt='Auction Image'></a></td> \r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<td width='400'>\r\n");
      out.write("\t\t\t<div class='bank'>");
      out.print(auction.getBankName() );
      out.write("</div>\r\n");
      out.write("\t\t\t<div class='project-title'>");
      out.print(p.getProjName() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div class='auction-date'>Auction Date: ");
      out.print(DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>Reserve Price  Rs.");
      out.print(MoneyUtil.displayMoney(minBid) );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t");
if(!uType.equals("C") ){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>No of Registrations =");
      out.print(auction.getCutomerList().size() );
      out.write(" </div>\r\n");
      out.write("\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>For Help Contact AO <br>\r\n");
      out.write("\t\t\t\t\tContactNo:");
      out.print(auction.getContactsNos() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</td><td width='200'>\r\n");
      out.write("\t\t\t\t\t");
if(uType.equals("C")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(");
      out.print(auction.getAid() );
      out.write(")'>\r\n");
      out.write("\t\t\t\t\t");
} else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(");
      out.print(auction.getAid() );
      out.write(")'>\r\n");
      out.write("\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t</td></tr> \r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t");

					}
			}
		
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"auctions\">\r\n");
      out.write("\t<div class=\"section-title\">Future Auctions (Or Pending Auctions)</div>\r\n");
      out.write("\t");

		String canc = "CL";
		if(uType.equals("C"))
	  	canc = "CLS";
			for(Auction auction:viewAuction){
				
				if(auction.getStatus().equals("P") || auction.getStatus().equals(canc)){
				BankProjects p=auction.getProject();
				String minBid = p.getMinBid();		
			
      out.write("\r\n");
      out.write("\t\t\t<div class='auction-project'>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t <table><tr>\r\n");
      out.write("\t\t <td  width='150' class='auction-image'>\r\n");
      out.write("\t\t ");
      out.write("\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t <a href=\"javascript:viewImg('");
      out.print(p.getPropertyImage() );
      out.write("')\"> <img src='./uploads/");
      out.print(p.getPropertyImage() );
      out.write("' width='100' height='100' alt='Auction Image'></a>\r\n");
      out.write("\t\t </td>\r\n");
      out.write("\t\t <td width='150' class='auction-image'>\r\n");
      out.write("\t\t <div >\r\n");
      out.write("\t\t <a href=\"javascript:viewImg('");
      out.print(p.getAdvImage() );
      out.write("')\"> <img src='./uploads/");
      out.print(p.getAdvImage() );
      out.write("'  width='100' height='100' alt='Auction Image'></a>\r\n");
      out.write("\t\t </div>\r\n");
      out.write("\t\t  </td>\r\n");
      out.write("\t\t\t<td width='400'>\r\n");
      out.write("\t\t\t<div class='bank'>");
      out.print(auction.getBankName() );
      out.write("</div>\r\n");
      out.write("\t\t\t<div class='project-title'>");
      out.print(p.getProjName() );
      out.write("</div>\r\n");
      out.write("\t\t\t");
 if(auction.getStatus().equals("P")) { 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='auction-date'>Auction Date: ");
      out.print(DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) );
      out.write("</div>\r\n");
      out.write("\t\t\t");
 } 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>Reserve Price  Rs.");
      out.print(MoneyUtil.displayMoney(minBid) );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t");
if(!uType.equals("C") ){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>No of Registrations =");
      out.print(auction.getCutomerList().size() );
      out.write(" </div>\r\n");
      out.write("\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>For Help Contact AO  <br>\r\n");
      out.write("\t\t\t\t\tContactNo:");
      out.print(auction.getContactsNos() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</td><td width='200'>\r\n");
      out.write("\t\t\t\t\t");
if(uType.equals("C")){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\t\t<br> <input type='button' class='button2' value='View Auction' onclick='viewProject(");
      out.print(auction.getAid() );
      out.write(")'>\r\n");
      out.write("\t\t\t\t\t");
} else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t<br> <input type='button' class='button2' value='View Auction' onclick='viewAuction(");
      out.print(auction.getAid() );
      out.write(")'>\r\n");
      out.write("\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t</td></tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");

			}
			}

      out.write("\r\n");
      out.write("</div>\r\n");
 if(user!=null ){
	if(!user.getUserType().equals("C")){
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"auction-results\">\r\n");
      out.write("\t<div class=\"section-title\">Auction Results</div>\r\n");
      out.write("\t");

			for(Auction auction:viewAuction){
				if(auction.getStatus().equals("C")){
				BankProjects p=auction.getProject();
				String minBid = p.getMinBid();
				String winBidAmt = auction.getWinBidAmt();
			
      out.write("\r\n");
      out.write("\t\t\t<div class='auction-project'>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t<table><tr><td width=\"150\" class='auction-image' >\r\n");
      out.write("\t\t\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:viewImg('");
      out.print(p.getPropertyImage() );
      out.write("')\"> <img src='./uploads/");
      out.print(p.getPropertyImage() );
      out.write("' width='100' height='100' alt='Auction Image'></a>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td width='150' class='auction-image'>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:viewImg('");
      out.print(p.getAdvImage() );
      out.write("')\"> <img  src='./uploads/");
      out.print(p.getAdvImage() );
      out.write("' width='100' height='100' alt='Auction Image'></a>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td width='400'>\r\n");
      out.write("\t\t\t\t\t<div class='bank'>");
      out.print(auction.getBankName() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div class='project-title'>");
      out.print(p.getProjName() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div class='auction-date'>Auction Date: ");
      out.print(DatesUtil.getFormatDMYHMSA(auction.getAuctionDate()) );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<div class='start-bid'>Reserve Price  Rs. ");
      out.print(MoneyUtil.displayMoney(minBid) );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t</td><td width='200'>\r\n");
      out.write("\t\t\t\t\t<div class='winner'>Winner is :");
      out.print(auction.getWinnerName() );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t");
System.out.println("Winner Name :"+auction.getWinnerName()); 
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class='win-bid-amt'>Winning Bid :");
      out.print(MoneyUtil.displayMoney(winBidAmt) );
      out.write("</div>\r\n");
      out.write("\t\t\t\t\t<input type='button' class='button2' value='View Auction' onclick='viewAuction(");
      out.print(auction.getAid() );
      out.write(")'>\r\n");
      out.write("\t\t\t\t\t\t<br> <input type='button' class='button' value='View Report / Print Report' onclick='openWindow(");
      out.print(auction.getAid() );
      out.write(")'>\r\n");
      out.write("\t\t\t\t\t</td></tr></table>\r\n");
      out.write("\t\t\t\t\t</div> \r\n");
      out.write("\t\t\t\t\t");

					}
			}
		
      out.write("</div>\r\n");
      out.write("</div>\r\n");
}} 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var $ = jQuery;\r\n");
      out.write("var timeId = 0;\r\n");
      out.write("$(document).ready(function() {\r\n");
      out.write("\tvar today = new Date();\r\n");
      out.write("\t$(\".current-time\").html(\"\"+today);\r\n");
      out.write("\tvar runId = setInterval(getAuctionsList, 10000);\r\n");
      out.write("\ttimeId = setInterval(showDateTime, 2000);\r\n");
      out.write("\t\r\n");
      out.write("\t$('.img:gt(0)').hide();\r\n");
      out.write("    setInterval(function() {\r\n");
      out.write("        $(\".img:first-child\").fadeOut(3000).next(\".img\").fadeIn(3000).end().appendTo(\"#show-case\")\r\n");
      out.write("}, 4000);\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("function showDateTime() {\r\n");
      out.write("\tvar today = new Date();\r\n");
      out.write("\t$(\".current-time\").html(\"\"+today);\r\n");
      out.write("}\r\n");
      out.write("function getAuctionsList() {\r\n");
      out.write("\t//$(\".auctions-list\").html(\"refreshing\");\r\n");
      out.write("\tvar urlStr = \"project.htm\";\r\n");
      out.write("\t//alert(urlStr);\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\ttype: \"POST\",\r\n");
      out.write("\t\turl: urlStr,\r\n");
      out.write("\t\terror: function(req,error) { /*alert(\"error=\"+error);*/ },\r\n");
      out.write("\t\tsuccess: function(data) {\r\n");
      out.write("\t\t\t\t\t$(\".auctions-list\").html(data);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("function startAuction(aid) {\r\n");
      out.write("\tvar urlStr = \"<?php echo base_url(); ?>admin/Pages/ajaxStartAuction/\"+aid;\r\n");
      out.write("\t//alert(urlStr);\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\ttype: \"POST\",\r\n");
      out.write("\t\turl: urlStr,\r\n");
      out.write("\t\terror: function(req,error) { alert(\"error=\"+error); },\r\n");
      out.write("\t\tsuccess: function(data) {\r\n");
      out.write("\t\t\t\t\t$(\".auctions-list\").html(data);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("function viewAuction(aid) {\r\n");
      out.write("\twindow.location.href = \"viewRunningAuction.htm?aid=\"+aid;\r\n");
      out.write("\t//window.open(\"viewRunningAuction.htm?aid=\"+aid,\"toolbar=no,location=no,menubar=no, scrollbars=1\");\r\n");
      out.write("}\r\n");
      out.write("function registration(aid){\r\n");
      out.write("\twindow.location.href =\"registration.htm?aid=\"+aid;\r\n");
      out.write("}\r\n");
      out.write("function viewProject(aid) {\r\n");
      out.write("\twindow.location.href = \"viewProjectDetails.htm?aid=\"+aid;\r\n");
      out.write("\t//window.open(\"viewRunningAuction.htm?aid=\"+aid,\"toolbar=no,location=no,menubar=no, scrollbars=1\");\r\n");
      out.write("}\r\n");
      out.write("function openWindow(aid) {\r\n");
      out.write("\t//window.open(\"<?php echo base_url(); ?>admin/BankProjects/viewPrintAuction/\"+aid);\r\n");
      out.write("\twindow.open(\"viewPrintAuction.htm?aid=\"+aid,\"toolbar=no,location=no,menubar=no, scrollbars=1\");\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function BigImage(){\r\n");
      out.write("\t $(document).ready(function(){\r\n");
      out.write("\t      $('.imgSmile').animate({width: \"500px\"}, 'slow');\r\n");
      out.write("\t      \r\n");
      out.write("\t       $(\".imgSmile\").toggle(function()\r\n");
      out.write("\t          {$(this).animate({width: \"100px\"}, 'slow');}, \r\n");
      out.write("\t          function()\r\n");
      out.write("\t          {$(this).animate({width: \"500px\"}, 'slow');\r\n");
      out.write("\t       });\r\n");
      out.write("\t    });\r\n");
      out.write("\t}\r\n");
      out.write("function viewImg(img) {\r\n");
      out.write("\t\r\n");
      out.write("\tvar img1=\"./uploads/\"+img;\r\n");
      out.write("\twindow.open(img1);\r\n");
      out.write("\t\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div class=\"hits-counter\">\r\n");
      out.write("<span>Hits : </span>\r\n");
      out.write("<!-- Start of StatCounter Code for Default Guide -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var sc_project=8463032; \r\n");
      out.write("var sc_invisible=0; \r\n");
      out.write("var sc_security=\"305bbac1\"; \r\n");
      out.write("var scJsHost = ((\"https:\" == document.location.protocol) ? \"https://secure.\" : \"http://www.\");\r\n");
      out.write("document.write(\"<sc\"+\"ript type='text/javascript' src='\" + scJsHost + \"statcounter.com/counter/counter.js'></\"+\"script>\");\r\n");
      out.write("</script>\r\n");
      out.write("<noscript>\r\n");
      out.write("<div class=\"statcounter\">\r\n");
      out.write("<!-- <a title=\"web counter\" href=\"http://statcounter.com/free-hit-counter/\" target=\"_blank\"> -->\r\n");
      out.write("<img class=\"statcounter\" src=\"https://c.statcounter.com/8463032/0/305bbac1/0/\" alt=\"web counter\">\r\n");
      out.write("<!-- </a> -->\r\n");
      out.write("</div></noscript>\r\n");
      out.write("<!-- End of StatCounter Code for Default Guide -->\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
