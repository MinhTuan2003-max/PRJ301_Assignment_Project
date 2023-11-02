<%-- 
    Document   : viewattendance
    Created on : 02-Nov-2023, 10:53:26
    Author     : MINH TUAN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Schedule</title>
        <link href="${pageContext.request.contextPath}/css/styletimetable.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <style>
        .selected {
            color: #333; /* Text color for selected link */
            font-weight: bold; /* Bold text for selected link */
        }

        .choose_term_course a:hover {
            color: #333; /* Text color for selected link */
        }
    </style>

    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark">
                <nav class="navbar navbar-expand-lg navbar-dark">
                    <div class="container">
                        <div class="collapse navbar-collapse">
                            <h1>FPT University Academic Portal</h1>
                        </div>
                    </div>
                </nav>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <table class="navbar-nav ml-auto">
                        <tbody>
                            <tr>
                                <td colspan="5" style="font-size: 14px">
                                    <strong>FAP mobile app (myFAP) is ready at</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="https://apps.apple.com/app/id1527723314">
                                        <img style="width: 120px; height: 40px" src="img/img-app-store.png" alt="appstore"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="https://play.google.com/store/apps/details?id=com.fuct" class="">
                                        <img style="width: 120px; height: 43px" src="img/img-play-store.png" alt=""/>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </nav>
        </header>       
        <div class="container">
            <div class="row">
                <div class="col-md-12">                    
                    <div class="content-container">
                        <div class="divControl">
                            <a href="${pageContext.request.contextPath}/home">Home</a>
                            &nbsp;|&nbsp;<b>View Schedule</b>
                        </div>
                        <div class="divUser">
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            <a href="${pageContext.request.contextPath}/userdetail">
                                                <strong>${account.displayname}</strong>
                                            </a>
                                            &nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/logout">
                                                <strong>Logout</strong>
                                            </a>
                                            &nbsp;|&nbsp;<b>CAMPUS: FPTU-${requestScope.campus[0].cname}
                                            </b>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <h2>View attendance for ${requestScope.students.student_Name} (${sessionScope.account.displayname})</h2>
            <br>
            <div class="choose_term_course">
                <table style="width: 100%">
                    <tr>
                        <th>CAMPUS/PROGRAM</th>
                        <th style="padding-right: 259px; padding-left: 277px;">SEMESTER</th>
                        <th>COURSE</th>
                    </tr>
                    <tr>
                        <th>FU-${requestScope.campus[0].cname}</th>
                        <td>
                            <table>
                                <c:forEach var="se" items="${requestScope.semesters}">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${se.semester_id == sessionScope.semester_id}">
                                                <td style="padding-right: 259px; padding-left: 277px;">
                                                    <a style="font-size: medium;" class="selected"
                                                       href="viewattendance?semester_id=${se.semester_id}">${se.semester_name}</a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding-right: 259px; padding-left: 277px;">
                                                    <a style="font-size: medium;"
                                                       href="viewattendance?semester_id=${se.semester_id}">${se.semester_name}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table>
                                <c:forEach var="g" items="${requestScope.groups}">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${g.group_id == sessionScope.group_id}">
                                                <td>
                                                    <a style="font-size: medium" class="selected"
                                                       href="viewattendance?semester_id=${sessionScope.semester_id}&group_id=${g.group_id}">${g.course.course_name} - ${g.group_name}</a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>
                                                    <a style="font-size: medium"
                                                       href="viewattendance?semester_id=${sessionScope.semester_id}&group_id=${g.group_id}">${g.course.course_name} - ${g.group_name}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <br>
            <table>
                <tr>
                    <td>NO</td>
                    <td>DATE</td>
                    <td>TIME</td>
                    <td>SLOT</td>
                    <td>ROOM</td>
                    <td>LECTURER</td>
                    <td>GROUP NAME</td>
                    <td>ATTENDANCE STATUS</td>
                </tr>
                <c:forEach items="${requestScope.attendances}" var="att" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${att.day_of_week} <fmt:formatDate value="${att.date}" pattern="dd/MM/yyyy"/></td>
                        <td>
                            ${att.timeSlot.description}
                        </td>
                        <td>${att.slot}</td>
                        <td>${att.classroom.room_code}</td>
                        <td>${att.instructure.instructure_code}</td>
                        <td>${att.enrollment.group.group_name}</td>
                        <td>
                            <div style="${att.status eq 'present' ? 'color: green;' : att.status eq 'absent' ? 'color: red;' : 'color: gray;'}">
                                ${att.status}
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <table>
                <tr>
                    <th>
                        <c:choose>
                            <c:when test="${requestScope.absent_percentage > 10}">
                                <span style="color: red;">ABSENT : ${requestScope.absent_percentage}% ABSENT SO FAR (${requestScope.enrollment.total_absent_slot} ABSENT ON ${requestScope.enrollment.total_slot} TOTAL)</span>
                            </c:when>
                            <c:otherwise>
                                ABSENT : ${requestScope.absent_percentage}% ABSENT SO FAR (${requestScope.enrollment.total_absent_slot} ABSENT ON ${requestScope.enrollment.total_slot} TOTAL)
                            </c:otherwise>
                        </c:choose>
                    </th>
                </tr>
            </table>
        </div>
    </body>
</html>