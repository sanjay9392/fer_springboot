<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Core Tag(s) Example</title>
</head>

<body>
	  <c:set var="salary" scope="session" value="${2000*2}" />
	  <p>
		Before Remove Value:
	  <c:out value="${salary}" />
	  </p>
	
	  <c:if test = "${salary > 2000}">
         <p>My salary is:  <c:out value = "${salary}"/><p>
      </c:if>
      
      <c:catch var ="exceptionObject">
         <% int x = 5/0;%>
      </c:catch>

      <c:if test = "${exceptionObject != null}">
         <p>The exception is : ${exceptionObject} <br />
         There is an exception: ${exceptionObject.message}</p>
      </c:if>
      
      <c:forEach var = "i" begin = "1" end = "5">
         Item <c:out value = "${i}"/><p>
      </c:forEach>
      
      <%
      List<String> fruits = new ArrayList<String>();
      fruits.add("Apple");
      fruits.add("Banana");
      fruits.add("Mango");
      
      session.setAttribute("fruitsObject", fruits);
     %>
      <c:forEach var = "fruits" items ="${fruitsObject}">
      ${fruits }<br>
      </c:forEach>
      
      <c:forTokens items = "Apple,Banana,Mango,Grapes" delims = "," var = "name">
         ${name}<br>
      </c:forTokens>
     
      <br>
      <c:choose>
         
      <c:when test = "${salary <= 0}">
            Salary is very low to survive.
      </c:when>
         
      <c:when test = "${salary > 1000}">
            Salary is very good.
      </c:when>
         
      <c:otherwise>
            No comment sir...
      </c:otherwise>
      </c:choose><br>
      
      <c:import var = "data" url = "http://localhost:8080/pagination_ex/"/>
      <c:out value = "${data}"/>
      
      <c:redirect url = "https://www.google.com/photos/about/"/>
      
	  <c:remove var="salary" />
	  <p>
		After Remove Value:
	  <c:out value="${salary}" />
	  </p>
</body>
</html>