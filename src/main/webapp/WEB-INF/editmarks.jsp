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
        <b>Enter Marks Details</b>
    </h3>
    <c:if test="${message != null}">
        <fieldset>
            <h3>
                <span style="color: red"> ${message}</span>
            </h3>
        </fieldset>
    </c:if>
    <c:forEach items="${marks}" var="mrk" varStatus="stdstatus">
    <form action="editmarks.php?page=editmarks" method="post">
                <input type="number" name="id" id="id" class="form-control" value=${mrk.getId()}
                <label for="student-id">Student Id </label>
                <input type="number" size="50" maxlength="50"
                                                        name="studentId" id="studentId" class="form-control" value=${mrk.getStudentId()}/>

                <label for="course-name">Course Name </label>
                <input type="text" size="50" maxlength="50"
                                        name="coursename" id="coursename" class="form-control" value=${mrk.getCourseName()}/>

                <label for="course-marks">Course Marks </label>
                <input type="number" size="50" maxlength="50"
                                        name="coursemarks" id="coursemarks" class="form-control" value=${mrk.getCourseMarks()}/>

                <input type="submit" name="editMarks"
                                        value="Create Marks" class="btn btn-primary" style="margin-top: 16px; "/>

    </form>
    </c:forEach>
</div>

<%@ include file="footer.jsp"%>
