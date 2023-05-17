<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div class="container">
<jsp:include page="headeradmin.jsp"><jsp:param
		name="title" value="Delete User" />
</jsp:include>
</div>

<div id="middle">
		<h3 style="text-align: center; padding-top: 32px; ">
			<b>Enter User Details</b>
		</h3>
		<c:if test="${message != null}">
			<fieldset>
				<h3>
					<span style="color: red"> ${message}</span>
					<a href="employees.php?page=employee"> Employees </a>
				</h3>
			</fieldset>
		</c:if>
</div>
<%@ include file="footer.jsp"%>