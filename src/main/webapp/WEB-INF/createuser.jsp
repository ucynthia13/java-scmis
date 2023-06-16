<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div class="container" >
<div id="header">
<jsp:include page="headeradmin.jsp"><jsp:param
		name="title" value="Create User" />
</jsp:include>
</div>
</div>
    <style>
        #header{
            display: none;
        }
        #middle {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            width: 65vh;
            flex-direction: column;
            border: 0.3px solid gray;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            margin-left: 320px;
            margin-top: 64px;
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
            -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
            background-color: rgba(0, 0, 0, 0.5);

        }
        .form-group{
            padding-top: 24px;
            padding-bottom: 16px;
        }
    </style>
<div id="middle">
		<h3 style="text-align: center;">
			<b>New Registration</b>
		</h3>
		<c:if test="${message != null}">
			<fieldset>
				<h3>
					<span style="color: red;"> ${message}</span>
				</h3>
			</fieldset>
		</c:if>
		<form action="createuser.php?page=createuser" method="post" class="form-group ">

					<label for="username">Username</label>
					<input type="text" size="25" maxlength="50"
						name="username" id="username" class="form-control mt-4"/>

					<label for="password">Password</label>
					<input type="password" size="25"
						maxlength="50" name="password" id="password" class="form-control" />

					<label for="fullname">User Full Name</label>
					<input type="text" size="50" maxlength="50"
						name="userfullname" id="userfullname" class="form-control"/>

					<label for="email">Email</label>
					<input type="text" size="50" maxlength="50"
						name="email" id="email" class="form-control"/>

					<label for="role">Role</label>
					<select name="userRole" id="userRole" class="form-control">
							<option value="">Select Role</option>
							<c:forEach items="${userRoles}" var="userrole"
								varStatus="userrolestatus">
								<option value="${userrole}">
									<c:out value="${userrole.getRoleDescription()}" />
								</option>
							</c:forEach>
					</select>

					<input type="submit" name="saveDataUser"
						value="Create User" class="btn btn-primary" style="margin-top: 16px; " />


                    <a href="login.php?" style="margin-left: 260px;">| Login |</font></a>


		</form>
		<%@ include file="footerlogin.jsp"%>
</div>
