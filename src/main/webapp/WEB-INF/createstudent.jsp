<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div class="container">
<jsp:include page="headeradmin.jsp"><jsp:param
		name="title" value="Create Student" />
</jsp:include>
</div>

<div id="middle">
		<h3 style="text-align: center; padding-top: 32px; ">
			<b>Enter Student Details</b>
		</h3>
		<c:if test="${message != null}">
			<fieldset>
				<h3>
					<span style="color: red"> ${message}</span>
				</h3>
			</fieldset>
		</c:if>
		<form action="createstudent.php?page=createstudent" method="post" class="form-group">
					<label for="firstname">Firstname: </label>
					<input type="text" size="25" maxlength="50"
						name="firstname" id="firstname" class="form-control"/>

					<label for="lastname">Lastname: </label>
					<input type="text" size="50"
						maxlength="50" name="lastname" id="lastname" class="form-control" />

					<label for="dob">Date of Birth: </label>
					<input type="date" name="dob" id="dob" class="form-control"/>

					<label for="email">Email</label>
					<input type="text" size="50" maxlength="50"
						name="email" id="email" class="form-control"/>

					<label>
                      <input type="radio" name="gender" value="male">
                      Male
                    </label>

                    <label>
                      <input type="radio" name="gender" value="female">
                      Female
                    </label>
                    <br>
                    <label>
                      <input type="radio" name="isInternational" id="isInternational" value="1">
                      International
                    </label>

                    <label>
                      <input type="radio" name="isInternational" id="isInternational" value="0">
                      Local
                    </label>
                    <br>
                    <label for="address">Address: </label>
                    <input type="number" name="address" id="address" class="form-control" />

                    <input type="submit" name="saveStd"
						value="Register Student" class="btn btn-primary" style="margin-top: 16px; " />

		</form>
</div>
<%@ include file="footer.jsp"%>