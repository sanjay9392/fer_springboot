<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-ContactInfo</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/updateProfile?method=address">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>ContactInfo</td>
				</tr>
				<tr>
					<td nowrap="nowrap">Email <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="email" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Mobile <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="mobile" /></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><html:submit value="Next" />
						&nbsp;&nbsp;</td>
			</table>
		</html:form>
</body>
</html>