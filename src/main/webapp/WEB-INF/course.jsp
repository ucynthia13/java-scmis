
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

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
    <title>Course Registrations</title>
</head>
<body>
<div id="layout" class="container" style="padding-top: 16px; ">
    <div id="banner">
        <div class="bannerlogo"></div>
        <div class="text_header">RCA Management Information System</div>
        <div class="right" style="text-align: right;">
                 <a href="createcourse.php?page=createcourse" class="btn btn-link">
                      Create New Course
                 </a>
            <c:if test="${authenticatedUser !=null}">
                 <a
                        href="listuser.php?page=profile&&id=${authenticatedUser.id}"><button>Profile
                </button></a> | <font color="#ffffff">${authenticatedUser.userRole}:
                        ${authenticatedUser.username}</font> | <a href="login.ap?page=logout"><font
                        color="#ffffff">Logout</font></a>

            </c:if>
            <c:if test="${authenticatedUser ==null}">
                <div class="menu" align="left">
                    | <a href="login.php?">Login</a> |
                </div>
            </c:if>
        </div>
    </div>
    <div>
        <%@ include file="menu.jsp"%>
    </div>
    <div id="middle">
        <c:if test="${authenticatedUser !=null}">
             <table class="table table-bordered">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>Name</td>
                            <td>code</td>
                            <td>minimum student</td>
                            <td>maximum student</td>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${courses}" var="csr" varStatus="csrstatus">
                            <tr>
                                <td>${csr.getId()}</td>
                                <td>${csr.getName()}</td>
                                <td>${csr.getCode()}</td>
                                <td>${csr.getMinStudent()}</td>
                                <td>${csr.getMaxStudent()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </table>

        </c:if>
    </div>
<%@ include file="footer.jsp"%>