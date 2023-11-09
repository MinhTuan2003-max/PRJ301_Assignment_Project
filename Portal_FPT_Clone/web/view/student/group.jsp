<%-- 
    Document   : group
    Created on : 07-Nov-2023, 22:31:19
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>FPT University Academic Portal</title>
        <link href="${pageContext.request.contextPath}/css/groupstyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .table td, .table th {
                padding: .75rem;
                vertical-align: top;
                border-bottom: 1px solid #dee2e6;
            }
        </style>
    </head>
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
                            &nbsp;|&nbsp;<b>Groups</b>
                        </div>
                        <div class="divUser">
                            <table style="width: 100%;margin-left: 7px;">
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
            <h2 style="color: rgb(119,119,119)">Select a course, then a group ...</h2>

            <div class="choose_term_course">
                <table style="width: 100%">
                    <tr>
                        <th class="title" style="padding-left: 3px">CAMPUS</th>
                        <th class="title" style="padding: 0 100px 0 3px">TERM</th>
                        <th class="title" style="padding: 0 100px 0 3px">DEPARTMENT</th>
                        <th class="title" style="padding-left: 3px">COURSE</th>
                        <th class="title" style="padding-left: 3px">GROUP</th>
                    </tr>

                    <tr>
                        <td>
                            <table>
                                <th>FU-${requestScope.campus[0].cname}</th>
                            </table>
                        </td>
                        <td>
                            <table>
                                <c:forEach items="${requestScope.semesters}" var="se">
                                    <tr style="border-bottom: 1px solid rgb(210,210,210);">
                                        <c:choose>
                                            <c:when test="${se.semester_id == sessionScope.semester_id}">
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a style="font-size: 14px;" class="selected"
                                                       href="group?semester_id=${se.semester_id}">${se.semester_name}</a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding: 0 100px 0 3px">
                                                    <a style="font-size: small;"
                                                       href="group?semester_id=${se.semester_id}">${se.semester_name}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table>
                                <c:forEach items="${requestScope.departments}" var="d">
                                    <tr style="border-bottom: 1px solid rgb(210,210,210);">
                                        <c:choose>
                                            <c:when test="${d.department_id == sessionScope.department_id}">
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a style="font-size: 14px;" class="selected" href="group?semester_id=${sessionScope.semester_id}&department_id=${d.department_id}">
                                                        ${d.department_name}
                                                    </a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a style="font-size: 14px;" href="group?semester_id=${sessionScope.semester_id}&department_id=${d.department_id}">
                                                        ${d.department_name}
                                                    </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table>
                                <c:forEach items="${requestScope.courses}" var="c">
                                    <tr style="border-bottom: 1px solid rgb(210,210,210);">
                                        <c:choose>
                                            <c:when test="${c.course_id == sessionScope.course_id}">
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a class="selected"  href="group?semester_id=${sessionScope.semester_id}&department_id=${sessionScope.department_id}&course_id=${c.course_id}">
                                                        ${c.course_name}(${c.course_code})
                                                    </a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a href="group?semester_id=${sessionScope.semester_id}&department_id=${sessionScope.department_id}&course_id=${c.course_id}">
                                                        ${c.course_name}(${c.course_code})
                                                    </a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                        <td>
                            <table>
                                <c:forEach items="${requestScope.groups}" var="g">
                                    <tr style="border-bottom: 1px solid rgb(210,210,210);">
                                        <c:choose>
                                            <c:when test="${g.group_id == sessionScope.group_id}">
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a class="selected" href="group?semester_id=${sessionScope.semester_id}&course_id=${g.course.course_id}&group_id=${g.group_id}">
                                                        ${g.group_name}                                           
                                                    </a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a href="group?semester_id=${sessionScope.semester_id}&course_id=${g.course.course_id}&group_id=${g.group_id}">
                                                        ${g.group_name}                                           
                                                    </a>
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
            <c:if test="${not empty requestScope.groups}">
                <table class="table table-hover" style="width: 100%">
                    <h2 style="color: rgb(119,119,119)">... then see student list</h2>
                    <tr>
                        <th class="thead-inverse" style="width:10px; border-right: 1px solid #fff">INDEX</th>
                        <th class="thead-inverse" style="width:10px; border-right: 1px solid #fff">IMAGE</th>
                        <th class="thead-inverse" style="width:10px; border-right: 1px solid #fff">ROLL NUMBER</th>
                        <th class="thead-inverse" style="width:10px; border-right: 1px solid #fff">FULL NAME</th>
                    </tr>
                    <c:forEach items="${requestScope.enrollments}" var="e" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td><img style="height: 146px;
                                     width: 111px;
                                     border-width: 0px;" src=""></td>
                            <td>${e.student.student_ID}</td>
                            <td>${e.student.student_Name}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <br>
            <table>
                <tr>
                    <td>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <b>Mọi góp ý, thắc mắc xin liên hệ:</b>
                                        <span>Phòng dịch vụ sinh viên</span>: Email:
                                        <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                                        Điện thoại: (024)7308.13.13
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p style="text-align: center">
                                            © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>
                                            &nbsp;|&nbsp;<a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>
                                            &nbsp;|&nbsp;<a href="http://library.fpt.edu.vn" target="_blank">library</a>
                                            &nbsp;|&nbsp;<a href="http://library.books24x7.com" target="_blank">books24x7</a>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
