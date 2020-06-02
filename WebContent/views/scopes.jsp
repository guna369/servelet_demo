<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scope demo</title>
</head>
<body>

	<%-- Set a session-scoped variable and increase it for each new request --%>
	<c:set var="counter" value="${counter+1}" scope="session"/>
	
	<%-- Set a request-scoped variable and use counter to set it every other request --%>
	<c:if test="${(counter % 2) == 0}">
		<c:set var="foo" value="request_value" scope="request"/>
	</c:if>

	<%-- Set two 'foo' variables with different scopes and values --%>
	<c:set var="foo" value="page_value" scope="page"/>
	<c:set var="foo" value="session_value" scope="session"/>

	<%-- Default scope is page --%>
	<c:set var="not_set_message" value="not set"/>


	Value of session-scoped counter: ${counter}<br/>	
		
	<br/> <%-- narrowest scope, inverted if to simulate else --%>
	Value of narrowest-scoped foo is <c:if test="${!empty(foo)}">${foo}</c:if>.
									 <c:if test="${empty(foo)}">not set</c:if>
									 
	<br/> <%-- c-style if..then..else --%>		
	Value of page-scoped foo is ${empty(pageScope.foo)?not_set_message:pageScope.foo}.
	
	<br/> <%-- c:out default value --%>	
	Value of request-scoped foo is <c:out value="${requestScope.foo}" default="${not_set_message}"/>.
	
	<br/>			
	Value of session-scoped foo is ${empty(sessionScope.foo)?not_set_message:sessionScope.foo}.
	<br/>	
	Value of application-scoped foo is ${empty(applicationScope.foo)?not_set_message:applicationScope.foo}.																				
	<br/>

</body>
</html>