<%-- 
    Document   : weeklytimetable
    Created on : 31-Oct-2023, 20:45:51
    Author     : MINH TUAN
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Schedule</title>
        <link href="${pageContext.request.contextPath}/css/styletimetable.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            <h2>
                Activities for
                <span id="lblStudent">${account.displayname} (${requestScope.students.student_ID})</span>
            </h2>
            <p class="ghichu">
                <b>Note:</b>
                These activities do not include extra-curriculum activities, such as
                club activities ...
            </p>
            <p class="ghichu">
                <b>Chú thích:</b>
                Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa,
                ví dụ như hoạt động câu lạc bộ ...
            </p>
            <div>
                <p class="ghichu">
                    Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br/>
                    Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br/>
                    Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br/>
                    Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br/>
                    Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br/>Little UK (LUK) thuộc tầng 5 tòa nhà Delta
                </p>
            </div>

            <table style="width: 100%">
                <tr>
                    <td class="timetable_getdate">
                        <form action="timetable" method="GET">
                            From <input type="date" name="startDate" value="${requestScope.startDate}"/> <br/>
                            To <input type="date" name="endDate" value="${requestScope.endDate}"/>
                            <input type="submit" value="View"/>
                        </form>
                    </td>
                    <c:forEach items="${requestScope.week_date}" var="d">
                        <td class="date_in_week"> 
                            <fmt:formatDate value="${d}" pattern="EEE"/> <br>
                            <div style="border-top: 1px solid #fff;">
                                <fmt:formatDate value="${d}" pattern="dd-MM"/>
                            </div>
                        </td>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.slot_index}" var="slot_index">
                    <tr>
                        <td class="week_date">Slot ${slot_index}</td>
                        <c:forEach items="${requestScope.week_date}" var="d">
                            <c:set var="found" value="false" />
                            <c:forEach items="${requestScope.weeklyTimetable}" var="w">
                                <c:if test="${slot_index eq w.slot and w.date eq d}">
                                    <td class="week_date">
                                        <span >
                                            <a style="font-size: 14px" href="${pageContext.request.contextPath}/activitydetail?courseID=${w.enrollment.group.course.course_id}&attendance_id=${w.attendance_id}">${w.enrollment.group.course.course_code}</a>
                                        </span>-<a class="get_materials" href="https://flm.fpt.edu.vn/DefaultSignin">View Materials</a> <br>
                                        at <span style="font-size: 14px">${w.classroom.room_code}</span> <br>
                                        <span style="${w.status eq 'attended' ? 'color: green;' : w.status eq 'absent' ? 'color: red;' : 'color: rgb(255,0,0);'}">
                                            (${w.status})
                                        </span> <br>
                                        <span class="time_study">
                                            (<fmt:formatDate value="${w.start_time}" pattern="HH:mm"/> - <fmt:formatDate value="${w.end_time}" pattern="HH:mm"/>)
                                        </span>
                                    </td>
                                    <c:set var="found" value="true" />
                                </c:if>
                            </c:forEach>
                            <c:if test="${not found}">
                                <td style="border-bottom: 1px solid rgb(240,240,240); border-top: 1px solid rgb(240,240,240)">-</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>
            <p class="divfoot">
                <b>More note / Chú thích thêm:</b>
            </p>
            <div>
                <ul>
                    <li class="divfoot">
                        (<font color="green">attended</font>): ${account.displayname} had attended this activity / ${requestScope.students.student_Name} đã tham gia hoạt động này
                    </li>
                    <li class="divfoot">
                        (<font color="red">absent</font>): ${account.displayname} had NOT attended this activity / ${requestScope.students.student_Name} đã vắng mặt buổi này
                    </li>
                    <li class="divfoot">(-): no data was given / chưa có dữ liệu</li>
                </ul>
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
                                &nbsp;|&nbsp;<a href="http://library.fpt.edu.vn" target="_blank">Library</a>
                                &nbsp;|&nbsp;<a href="http://library.books24x7.com" target="_blank">books24x7</a>
                            </p>
                        </td>
                    </tr>
                </table>
            </footer>
        </div>
    </body>
</html>





