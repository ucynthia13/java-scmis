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
        <b>Enter Course Details</b>
    </h3>
    <c:if test="${message != null}">
        <fieldset>
            <h3>
                <span style="color: red"> ${message}</span>
            </h3>
        </fieldset>
    </c:if>
    <form action="createcourse.php?page=createcourse" method="post">
                <label for="course-name">Course Name</label>
                <input type="text" size="25" maxlength="50"
                                        name="coursename" id="coursename" class="form-control" /></td>

                <label for="coursecode">Course Code</label>
                <input type="text" size="25"
                                        maxlength="50" name="coursecode" id="coursecode" class="form-control" />

                <label for="minstudents">Minimum Students </label>
                <input type="number" size="50" maxlength="50"
                                        name="minStudent" id="minStudent" class="form-control"/>

                <label for="maxstudents">Maximum Students </label>
                <input type="number" size="50" maxlength="50"
                                        name="maxStudent" id="maxStudent" class="form-control"/></td>

                <label for="startdate">Start Date </label>
                <input type="date" size="50" maxlength="50"
                                        name="start" id="start" class="form-control"/>

                <label for="enddate">End Date</label>
                <input type="date" size="50" maxlength="50"
                                        name="end" id="end" class="form-control" />

                <input type="submit" name="saveDataCourse"
                                        value="Create Course" class="btn btn-primary" style="margin-top: 16px; "/>

    </form>
</div>

<%@ include file="footer.jsp"%>
