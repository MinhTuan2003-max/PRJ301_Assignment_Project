<%-- 
    Document   : markreport
    Created on : 24-Oct-2023, 21:42:42
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
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
                <h2>Grade Report for Ha Minh Tuan (HE173175)</h2>
            </div>
            <br>
            <div>
                <br>
                <div>
                    <h4>Select a term, course ...</h4>
                </div>
                <div>
                    <table border="1">
                        <tr>
                            <td class="grade-term-course">Term</td>
                            <td class="grade-term-course">Course</td>
                        </tr>

                        <tr>
                            <td>
                                <a href="javascript:void(0);" onclick="showCourse('Summer2022')">Summer2022</a>
                            </td>
                            <td>
                                <div class="grade-course" id="Summer2022Course"  style="display: none;">
                                    English 5 (TRS501) (TRS501.5.P1, from 16/05/2022 - 24/06/2022) <br>
                                    Transition (TRS601) (TRS601.4.P2, from 11/07/2022 - 26/08/2022) <br>
                                    Vovinam 2 (VOV124) (VOV124.XH6.P1, from 04/05/2022 - 23/06/2022) <br>
                                    Vovinam 3 (VOV134) (VOV134.HL64.P2, from 18/07/2022 - 24/08/2022) <br>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="javascript:void(0);" onclick="showCourse('Fall2022')">Fall2022</a>
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

                <div id="CEA201Grades"  style="display: none;">
                    <table border="1">
                        <tr>
                            <td class="grade-title">GRADE CATEGORY</td>
                            <td class="grade-title">GRADE ITEM</td>
                            <td class="grade-title">WEIGHT</td>
                            <td class="grade-title">VALUE</td>
                            <td class="grade-title">COMMENT</td>
                        </tr>
                        <c:forEach items="${requestScope.scores}" var="s" varStatus="loop">
                            <tr>
                                <td>${requestScope.assessments[loop.index].course_grade_group} </td>
                                <td>${requestScope.assessments[loop.index].grade.grade_name}</td>
                                <td>${s.assessment.course_grade_weight * 100} %</td>
                                <c:choose>
                                    <c:when test="${not empty s.score}">
                                        <td>${s.score}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td></td>
                                    </c:otherwise>
                                </c:choose>
                                <td></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <th rowspan="2">COURSE TOTAL</th>
                            <th>AVERAGE</th>
                            <th>${requestScope.gpa}</th>
                        </tr>
                        <tr>
                            <th>STATUS</th>
                            <th>${requestScope.status}</th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

