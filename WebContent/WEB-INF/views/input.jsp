<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Input data</title>
</head>
<body>
	Please enter your name, or accept the pre-populated value:
	<form method="post" action="save_data">
		<table>
		<tr>
		<td>First name:</td>
		<td> <input type="text" name="first" value="${person.firstName}"/></td>
		</tr>
		<tr>
		<td>Last name:</td>
		<td><input type="text" name="last" value="${person.lastName}"/></td>
		</tr>
		</table>
		<input type="submit" value = "Save"/>
	</form>
</body>
</html>