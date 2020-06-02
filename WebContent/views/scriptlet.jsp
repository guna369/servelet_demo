<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A date-showing scriplet</title>
</head>
<body>

	<!-- This is an HTML comment. It is sent to the browser -->
	<%-- This is a JSP comment. It is not sent to the browser --%>

	<% 
	DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
	String s = dateFormat.format(new Date());
	out.println("Today is "+s);
	%>
</body>
</html>