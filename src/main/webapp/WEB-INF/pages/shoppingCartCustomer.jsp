<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart Customer</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

	<jsp:include page="_header.jsp" />
	<jsp:include page="_menu.jsp" />

	<div class="page-title">Enter Customer Information</div>

	<form:form method="POST" modelAttribute="customerForm"
		action="${pageContext.request.contextPath }">

		<table>
			<tr>
				<td>Name *</td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" class="error-message" /></td>
			</tr>
			<tr>
				<td>Email *</td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" class="error-message" /></td>
			</tr>
			<tr>
				<td>Phone *</td>
				<td><form:input path="phone" /></td>
				<td><form:errors path="phone" class="error-message" /></td>
			</tr>
			<tr>
				<td>Address *</td>
				<td><input type="submit" value="Submit"><input
					type="reset" value="Reset"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><form:input path="address" /></td>
				<td><form:errors path="address" class="error-message" /></td>
			</tr>
		</table>
	</form:form>

	<jsp:include page="_footer.jsp" />

</body>
</html>