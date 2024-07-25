<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head><title>Add Article</title></head>
<body>
<h1>Add Article</h1>

<c:url var="viewArticlesUrl" value="/articles.html" />
<a href="${viewArticlesUrl}">Show All Articles</a>
<br></br>
<c:url var="saveArticleUrl" value="/articles/save.html" />
<form:form modelAttribute="article" method="POST" action="${saveArticleUrl}">
	<form:label path="articleName">Article Name:</form:label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form:input path="articleName" size="46"/>
	<br></br>
	<form:label path="articleDesc">Article Description:</form:label>
	<form:textarea path="articleDesc" rows="3" cols="40"/>
	<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Save Article" onclick="getArticleList()"/>
</form:form>

<br></br>
<c:if test="${!empty articles}">
	<table border="5" width="600">
		<tr>
			<th>Article ID</th>
			<th>Article Name</th>
			<th>Article Desc</th>
			<th>Added Date</th>
		</tr>

		<c:forEach items="${articles}" var="article">
			<tr>
				<td><c:out value="${article.articleId}"/></td>
				<td><c:out value="${article.articleName}"/></td>
				<td><c:out value="${article.articleDesc}"/></td>
				<td><c:out value="${article.addedDate}"/></td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<script type="text/javascript">
var $ = jQuery;

function getArticleList() {
	//$(".auctions-list").html("refreshing");
	var urlStr = "/articles.html";

	$.ajax({
        datatype:"json",
        type: "POST",
        url: urlStr,

        success: function(response)
        {
			$('#articles').html(response);
           
        },
        error: function(e)
        {
            alert('Error: ' + e);
        }
    });
}
</script>
</body>
</html>