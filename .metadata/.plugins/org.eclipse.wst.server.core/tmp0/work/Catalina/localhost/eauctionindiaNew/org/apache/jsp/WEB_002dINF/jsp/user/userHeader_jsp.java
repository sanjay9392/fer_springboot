/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.107
 * Generated at: 2024-03-14 06:26:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.zedapp.eauction.model.User;

public final class userHeader_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');

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

      out.write("\r\n");
      out.write("<div id=\"wrapper\">\r\n");
      out.write("\t<div id=\"header\">\r\n");
      out.write("\t\t<!--  <div id=\"top-navigation\">\r\n");
      out.write("\t\t\t<?php include \"topNavigation.php\"; ?>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t-->\r\n");
      out.write("\t\t<div id=\"header-top\"><!-- E-Auction -->\r\n");
      out.write("\t\t <a href=\"homePage.htm\"><span > <img src=\"images/header2.jpg\" width=\"320px\" height=\"59px\" class=\"mainhead\"> </span>\r\n");
      out.write("\t\t </a></div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!--end of header-top -->\r\n");
      out.write("\t\t");

			if (user != null) {
		
      out.write("\r\n");
      out.write("\t\t<div class=\"logout\">\r\n");
      out.write("\t\t\t<h4>\r\n");
      out.write("\t\t\t\t<span>Hi&nbsp; ");
      out.print(uname);
      out.write('(');
      out.print(uType);
      out.write(")\r\n");
      out.write("\t\t\t\t</span> &nbsp; &nbsp; &nbsp; <span> <a href=\"logout.htm\">logout</a>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t</h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t");

			} else {
		
      out.write("\r\n");
      out.write("\t\t<div class=\"logout\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<!-- <span><a href=\"faq.htm\">FAQ</a>\r\n");
      out.write("\t\t\t</span> -->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t");

			}
		
      out.write("\r\n");
      out.write("\t\t<div id=\"cityNavigation\">\r\n");
      out.write("\t\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navigation.jsp", out, false);
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!--navigation-->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"citiesNavigation\">\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "cityNavigation.jsp", out, false);
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<!--header-->");
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
