<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Implicit objects demo</title>
</head>
<body>
	Hello, visitor from ${pageContext.request.remoteHost}.<br /><br /> 
	This is the current header information:<br />

	<c:forEach items="${header}" var="headerEntry">
		${headerEntry.key} : ${headerEntry.value } <br />
	</c:forEach>
	<br />
	These are the ${pageContext.request.method} parameters you sent me:
	<br />
	<c:forEach items="${paramValues}" var="mapEntry" varStatus="status">
		${mapEntry.key} = 
			<c:forEach items="${mapEntry.value}" var="entry" varStatus="status">
				${entry}
				<c:if test="${!status.last}">,</c:if>
		</c:forEach>
		<br />
	</c:forEach>
	<br/>
	Based on your operating system I detect that you are
	<%-- Must use the map["key"] syntax for property names which are not legal
	     Java variable names.
	--%>
	${ fn:containsIgnoreCase(header["user-agent"], "linux") ? "a penguin-lover" : "not a huge fan of Tux" }.
	<br />
	<br /> ${ fn:escapeXml("Use <br/> to change lines.") }
	<br />
	<%-- Alternatively, may use c:out for escaping xml text --%>
	<c:out value="Use <br/> to change lines." />
	<br /><br />
	<c:set var="pi" value="3.1415926535897932384"/>
	Pi with two decimals: <fmt:formatNumber maxFractionDigits="2" value="${pi}"/>

</body>
</html>