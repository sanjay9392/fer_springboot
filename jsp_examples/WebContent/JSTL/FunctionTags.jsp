<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
   <head>
      <title>Using JSTL Functions</title>
   </head>

   <body>
      <c:set var = "fruits" value = "Apple,Mango,Banana,Grapes"/>

      <c:if test = "${fn:contains(fruits, 'apple')}">
         <p>Found the string using contains<p>
      </c:if>

      <c:if test = "${fn:containsIgnoreCase(fruits, 'apple')}">
         <p>Found the string using containsIgnoreCase<p>
      </c:if>
      
      Convert to UpperCase :${fn:toUpperCase(fruits)}
      <br>
      Convert to LowerCase :${fn:toLowerCase(fruits)}
      <br>
      
      Replace:${fn:replace(fruits,"a","e") }
      <br>
      
      StartsWith: ${fn:startsWith(fruits,"apple") }
      <br>
      EndsWith: ${fn:endsWith(fruits,"pes") }
      <br>
      
      <c:set var="string1" value="It is first String."/>  
	  <c:set var="string2" value="It is <xyz>second String.</xyz>"/>  
		  
		<p>With escapeXml() Function:</p>  
		<p>string-1 : ${fn:escapeXml(string1)}</p>  
		<p>string-2 : ${fn:escapeXml(string2)}</p>  
		  
		<p>Without escapeXml() Function:</p>  
		<p>string-1 : ${string1}</p>  
		<p>string-2 : ${string2}</p>  
		
		<p>Index-1 : ${fn:indexOf(string1, "first")}</p>  
		
		<c:set var="str1" value="Welcome to JSP        programming         "/>  
		<p> ${fn:trim(str1)} </p>
		
		<c:set var="myString" value="apple.banana_cherry-orange" />
		<p> ${fn:split(myString, '[._-]')} </p>
		
		<c:set var="string" value="This is the first string."/>  
		${fn:substring(string, 5, 17)}<br>  
		
		<c:set var="string" value="Nakul Jain"/>  
        ${fn:substringAfter(string, "Nakul")}<br>
        ${fn:substringBefore(string, "Jain")} 
      
</body>
</html>