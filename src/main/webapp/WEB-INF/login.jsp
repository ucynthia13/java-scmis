<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div id="middle" class="form-group">
<jsp:include page="headerlogin.jsp">
	<jsp:param value="Login page" name="title" />
</jsp:include>

    <style>
        #header{
            display: none;
        }
        #middle {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 63vh;
            width: 63vh;
            flex-direction: column;
            border: 0.3px solid gray;
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            margin-left: 320px;
            margin-top: 128px;
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
            -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
            background-color: rgba(0, 0, 0, 0.5);
        }
        .form-group{

        }
    </style>

		<form action="login.php" method="post">
					<label for="username">Name: </label>
					<input type="text" size="25" maxlength="50"
						name="username" id="username" class="form-control"  style="margin-bottom: 16px;"/>
					<label for="password">Password: </label>
					<input type="password" size="25"
						maxlength="50" name="password" id="password" class="form-control"  style="margin-bottom: 16px;" />
                    <input type="submit" value="Login" class="btn btn-primary"style="margin-top: 12px; " />
                    <a href="createuser.php?page=createuser" style="margin-left: 260px;">| Register |</a>
		</form>
    <%@ include file="footerlogin.jsp"%>
</div>
