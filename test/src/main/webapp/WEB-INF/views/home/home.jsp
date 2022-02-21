<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<ul id="ul" class="list-group list-group-flush">
		<li class="list-group-item">중분류
			<ul class="list-group list-group-flush">
				<li class="list-group-item">소분류</li>
				<li class="list-group-item">소분류</li>
				<li class="list-group-item">소분류</li>
				<li class="list-group-item">소분류</li>
			</ul>
		</li>
	</ul>
</body>
</html>
