<%-- 
    Document   : activitydetail
    Created on : 01-Nov-2023, 15:11:20
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activity Detail</title>
        <link href="${pageContext.request.contextPath}/css/viewactivity.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .url_meet_instructor {
                background-color: #ec971f;
                padding: 10px 11px;
                border-radius: 4px;
            }

            .url_meet_instructor:hover {
                text-decoration: none;
                background-color: #ff6600;
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
                            &nbsp;|&nbsp;<a href="${pageContext.request.contextPath}/timetable">Activity</a>
                            &nbsp;|&nbsp;<b>View</b>
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
            <h2>
                Activity Detail
            </h2>
            <br>
            <div class="activity_view">
                <table style="width: 99%; margin-left: 7px">
                    <c:forEach items="${requestScope.detailTimetable}" var="d">
                        <tr>
                            <td class="title">Date</td>
                            <td class="description">${d.date}</td>
                        </tr>
                        <tr>
                            <td class="title">Slot</td>
                            <td class="description">${d.slot}</td>
                        </tr>
                        <tr>
                            <td class="title">Student group</td>
                            <td class="description">
                                <a href="${pageContext.request.contextPath}/group?department_id=${d.enrollment.group.course.department.department_id}&group_id=${d.enrollment.group.group_id}&course_id=${d.enrollment.group.course.course_id}">
                                    ${d.enrollment.group.group_name}
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td class="title">Instructor</td>
                            <td class="description">
                                <a href="${pageContext.request.contextPath}/user_detail?login=${d.instructure.instructure_code}">${d.instructure.instructure_code}</a>
                                <span class="url_meet_instructor">
                                    <a style="color: #fff; text-decoration: none;" href="${d.instructure.meet_link}" target="_blank">MeetURL</a>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="title">Course</td>
                            <td class="description">${d.enrollment.group.course.course_name} (${d.enrollment.group.course.course_code})</td>
                        </tr>
                        <tr>
                            <td class="title">Campus/Programme</td>
                            <td class="description">FPTU-${requestScope.campus[0].cname}</td>
                        </tr>
                        <tr>
                            <td class="title" style="border-bottom: none">Attendance</td>
                            <td class="description" style="text-transform: capitalize; border-bottom: none">${d.status}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <br>
            <footer>
                <table width="100%" border="0">
                    <tr>
                        <td>
                            <b>Mọi góp ý, thắc mắc xin liên hệ:</b>
                            <span>Phòng dịch vụ sinh viên</span>: Email:
                            <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                            Điện thoại: <strong>(024)7308.13.13</strong>
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
            </footer>
        </div>
    </body>
</html>
