<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div class="container">
<jsp:include page="headeradmin.jsp"><jsp:param
		name="title" value="Create User" />
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
				</h3>
			</fieldset>
		</c:if>
		<c:forEach items="${users}" var="usr" varStatus="usrstatus">
		<form action="editemployee.php?page=editemployee" method="post" class="form-group">

                      <label for="id">Employee ID </label>
                     <input type="text" name="id" value=${usr.getId()} class="form-control"/>

					<label for="username">Username: </label>
					<input type="text" size="25" maxlength="50"
						name="username" id="username" class="form-control" value=${usr.getUsername()}/>

					<label for="fullname">User Full Name</label>
					<input type="text" size="50" maxlength="50"
						name="userfullname" id="userfullname" class="form-control" value=${usr.getFullName()}/>

					<label for="email">Email</label>
					<input type="text" size="50" maxlength="50"
						name="email" id="email" class="form-control" value=${usr.getEmail()}/>

					<input type="submit" name="saveEditedEmployee"
						value="Edit Employee" class="btn btn-primary" style="margin-top: 16px; " />

		</form>
		</c:forEach>
</div>
<%@ include file="footer.jsp"%>