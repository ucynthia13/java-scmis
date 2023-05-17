<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<jsp:include page="headerlogin.jsp">
	<jsp:param value="Login page" name="title" />
</jsp:include>
<div id="middle" class="form-group">
		<form action="login.php" method="post">
					<label for="username">Name: </label>
					<input type="text" size="25" maxlength="50"
						name="username" id="username" class="form-control" />
					<label for="password">Password: </label>
					<input type="password" size="25"
						maxlength="50" name="password" id="password" class="form-control" />

                    <input type="submit" value="Login" class="btn btn-primary" />
		</form>
		<c:if test="${authenticatedUser ==null}">
                    <a href="createuser.php?page=createuser">  New User Registration</a>
		</c:if>
</div>
<%@ include file="footerlogin.jsp"%>