<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div class="container">
<jsp:include page="headeradmin.jsp"><jsp:param
		name="title" value="Edit Student" />
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
		<c:forEach items="${students}" var="std" varStatus="stdstatus">
		<form action="editstudent.php?page=editstudent" method="post" class="form-group">

                      <label for="id">Student ID </label>
                     <input type="text" name="id" value=${std.getId()} class="form-control"/>

					<label for="firstname">Firstname: </label>
					<input type="text" size="25" maxlength="50"
						name="firstname" id="firstname" class="form-control" value=${std.getFirstName()}/>

					<label for="lastname">Lastname: </label>
					<input type="text" size="50" maxlength="50"
						name="lastname" id="lastname" class="form-control" value=${std.getLastName()}/>

					<label for="email">Email: </label>
					<input type="text" size="50" maxlength="50"
						name="email" id="email" class="form-control" value=${std.getEmail()}/>

                <label>
                 <input type="radio" name="gender" value="male" <c:if test="${std.gender == 'male'}">checked</c:if>>
                 Male
                </label>

                <label>
                 <input type="radio" name="gender" value="female" <c:if test="${std.gender == 'female'}">checked</c:if>>
                 Female
                </label>
                <br>
                <label>
                 <input type="radio" name="isInternational" id="isInternational" value="1" <c:if test="${std.isInternational == 1}">checked</c:if>>
                 International
                </label>

                <label>
                 <input type="radio" name="isInternational" id="isInternational" value="0" <c:if test="${std.isInternational == 0}">checked</c:if>>
                 Local
                </label>
                <br>

                 <label for="address">Address: </label>
                  <input type="number" name="address" id="address" class="form-control" value=${std.getAddress()}/>

				    <input type="submit" name="saveEditedStudent"
						value="Edit Student" class="btn btn-primary" style="margin-top: 16px; " />

		</form>
		</c:forEach>
</div>
<%@ include file="footer.jsp"%>