<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Page</title>
</head>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<center>
		<br /> <br /> <br />
		<h2>User | You are now logged in</h2>
		<h3>
			<a href="${logoutUrl}">Logout</a>
		</h3>
	</center>
</body>
</html>