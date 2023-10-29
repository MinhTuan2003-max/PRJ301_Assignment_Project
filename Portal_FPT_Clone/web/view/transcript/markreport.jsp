<%-- 
    Document   : markreport
    Created on : 24-Oct-2023, 21:42:42
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
        <title>Mark Report</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/css/stylemark.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/display.js" type="text/javascript"></script>
        <style>
            .grade-course a:focus {
                color: #333;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
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
                            <td colspan="5">
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
        <div class="container">
            <div class="row">
                <div class="col-md-12">                    
                    <div class="content-container">
                        <div class="divControl">
                            <a href="${pageContext.request.contextPath}/home">Home</a>
                            &nbsp;|&nbsp;<b>Grade Book</b>
                        </div>
                        <div class="divUser">
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            <a href="${pageContext.request.contextPath}/userdetail?user_id=${sessionScope.account.userID}">
                                                <strong>${sessionScope.account.displayname}</strong>
                                            </a>
                                            &nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/logout">
                                                <strong>Logout</strong>
                                            </a>
                                            &nbsp;|&nbsp;<b>CAMPUS: FPTU-${requestScope.campus[0].cname}</b>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div>
                <br>
                <h2>Grade Report for ${requestScope.students.student_Name} (${requestScope.students.student_ID})</h2>
            </div>
            <br>
            <div>
                <br>
                <div>
                    <br>
                    <div>
                        <h4>Select a term, course ...</h4>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td class="grade-term-course">Term</td>
                                <td class="grade-term-course">Course</td>
                            </tr>
                            <tr>
                                <td style="padding-right: 15px">
                                    <c:forEach items="${requestScope.enrollments}" var="e" varStatus="loop">
                                        <c:if test="${loop.first}">
                                            <a href="javascript:void(0);" onclick="showCourse('Fall2022', '${e.student.student_ID}')" id="fallLink">Fall2022</a>
                                        </c:if>
                                    </c:forEach>
                                </td>

                                <td>
                                    <div class="grade-course" id="Fall2022Course"  style="display: none;">
                                        <c:forEach items="${requestScope.enrollments}" var="e">
                                            <a href="javascript:void(0);" onclick="showGrades('${e.course.course_id}')">
                                                ${e.course.course_name}(${e.course.course_id})
                                            </a>
                                            <span>
                                                (${e.group.group_name}, from ${e.startDate} to ${e.endDate})
                                            </span>
                                            <br>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br>
                    <div id="CEA201Grades"  style="display: none;">
                        <h3>... then see report</h3>
                        <table >
                            <tr>
                                <td class="grade-title" style="padding-right: 10px; padding-left: 5px">GRADE CATEGORY</td>
                                <td class="grade-title" style="padding-right: 10px; padding-left: 5px">GRADE ITEM</td>
                                <td class="grade-title" style="padding-right: 10px; padding-left: 5px">WEIGHT</td>
                                <td class="grade-title" style="padding-right: 10px; padding-left: 5px">VALUE</td>
                                <td class="grade-title" style="padding-right: 10px; padding-left: 5px">COMMENT</td>
                            </tr>
                            <c:forEach items="${requestScope.scores}" var="s" varStatus="loop">
                                <tr>
                                    <c:choose>
                                        <c:when test="${loop.first || (requestScope.assessments[loop.index].course_grade_group != requestScope.assessments[loop.index - 1].course_grade_group && requestScope.assessments[loop.index].course_grade_group != 'Total')}">
                                            <td style="padding-right: 10px; padding-left: 5px">
                                                ${requestScope.assessments[loop.index].course_grade_group}
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td style="padding-right: 10px; padding-left: 5px">
                                        ${requestScope.assessments[loop.index].grade.grade_name}
                                    </td>
                                    <td style="padding-right: 10px; padding-left: 5px">
                                        ${s.assessment.course_grade_weight * 100} %
                                    </td>
                                    <td style="padding-right: 10px; padding-left: 5px">
                                        ${s.score}
                                    </td>
                                    <td style="padding-right: 10px; padding-left: 5px"></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th rowspan="1" style="padding-right: 10px; padding-left: 5px">
                                    COURSE TOTAL
                                </th>
                                <th style="padding-right: 10px; padding-left: 5px">
                                    AVERAGE
                                </th>
                                <th style="padding-right: 10px; padding-left: 5px">
                                    ${requestScope.gpa}
                                </th>
                            </tr>
                            <tr>
                                <td></td>
                                <th style="padding-right: 10px; padding-left: 5px">STATUS</th>
                                <th style="padding-right: 10px; padding-left: 5px">${requestScope.status}</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>

