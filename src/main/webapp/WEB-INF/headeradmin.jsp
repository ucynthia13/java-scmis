<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet"
    href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script
    src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
     integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
     crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<title>${param.title}</title>
</head>
<body>
	<div id="layout" class="container">
		<div id="banner">
			<div class="bannerlogo"></div>
			<h4 class="text_header"><b>RCA Management Information System</b></h4>
			<div class="right" style="text-align: right;">
				<c:if test="${authenticatedUser !=null}">
					<b><a href="listuser.php?page=profile&&id=${authenticatedUser.id}"><button>Profile
						</button></a> | ${authenticatedUser.fullName}</font>
						| <a href="login.php?logout=logout">Logout</font></a>
					</b>
				</c:if>
				<c:if test="${authenticatedUser ==null}">
					<div class="menu" align="left">
						| <a href="login.php?"><font color="#ffffff">Login</font></a> |
					</div>
				</c:if>
			</div>

		</div>

		<%@ include file="menu.jsp"%>