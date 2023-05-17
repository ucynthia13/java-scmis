<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<title>Student Registrations</title>
</head>
<body>
	<div id="layout" class="container" style="padding-top: 16px; ">
		<div id="banner">
			<div class="bannerlogo"></div>
				<div class="left" style="text-align: left; ">
            		<%@ include file="menu.jsp"%>
            	</div>

			<div class="right" style="text-align: right; ">
				<c:if test="${authenticatedUser !=null}">
					<a href="createstudent.php?page=createstudent"><button class="btn btn-link">
							New Student Registration
						</button></a>
					<b> <a
						href="liststudents.php?page=profile&&id=${authenticatedUser.id}"><button class="btn btn-link">Profile
							</button></a> | ${authenticatedUser.userRole}:
							${authenticatedUser.username}</font> | <a href="login.ap?page=logout">
							Logout</a>
					</b>
				</c:if>
				<c:if test="${authenticatedUser ==null}">
					<div class="menu" align="left">
						| <a href="login.php?">Login</a> |
					</div>
				</c:if>
			</div>

		</div>

		<div id="middle">
			<c:if test="${authenticatedUser !=null}">

				<form action="liststudents.php?page=statusapproval" method="post" class="form-group">
    				<div class="search" style="text-align: right; padding-top: 16px; ">
    					<form action="liststudents.php" method="get">
    								Enter Student ID
    								<input type="text" name="id" id="id" />
    								<input type='submit' name="studentregistrationsearch"
    									value='search' />

    					</form>
    				</div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<td>ID</td>
									<td>Firstname</td>
									<td>Lastname</td>
									<td>Gender </td>
									<td>Email</td>
									<td>isInternational</td>
									<td>Address Id</td>

									<td colspan="2" rowspan="1">Operation </td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${students}" var="std" varStatus="stdstatus">
									<tr>
										<td>${std.getId()}</td>
										<td>${std.getFirstName()}</td>
										<td>${std.getLastName()}</td>
										<td>${std.getGender()}</td>
										<td>${std.getEmail()}</td>
										<td>${std.getIsInternational()}</td>
										<td>${std.getAddress()}</td>
										<td><a href="editstudent.php?page=editstudent">Edit</a></td>
                                        <td><a href="deleteuser.php?page=deleteuser">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</form>
			</c:if>
		</div>
		<%@ include file="footer.jsp"%>