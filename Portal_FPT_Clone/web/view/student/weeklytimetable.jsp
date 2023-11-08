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
        <script src="${pageContext.request.contextPath}/js/display.js" type="text/javascript"></script>
    </head>
    <style>
        .title_body {
            font-family: cursive;
            font-weight: bold;
            color: #fff;
            padding-left: 10px;
        }

        .link_meet {
            background-color: rgb(94,94,94);
            color: #fff;
            font-size: 11px;
            padding: 3px 8px;
            margin-left: 3px;
            border-radius: 4px;
            font-weight: bold;
        }

        .link_to_join a:hover {
            background-color: orangered;
            color: #fff;
        }

        .instructure_meet a:hover {
            background-color: #333;
            color: #fff;
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
            <br>
            <div style="background-color: #ef8d01; text-align: center; padding: 10px;border-radius: 10px;">
                <h2 class="title_body">Weekly Schedule for ${sessionScope.account.displayname} (${requestScope.students.student_ID})</h2>      
            </div>
            <br>
            <br>
            <div class="weeklyTimetable_view">
                <table style="width: 100%">
                    <tr>
                        <td class="timetable_getdate" style="padding-left: 3px;">
                            <form action="timetable" method="GET">
                                From <input type="date" name="startDate" id="startDate" value="${requestScope.startDate}"/> <br/>
                                To <input type="date" name="endDate" id="endDate" value="${requestScope.endDate}"/>
                            </form>
                        </td>
                        <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                        <c:forEach items="${requestScope.week_date}" var="d">
                            <c:set var="isToday" value="${d.time == currentDate.time}" />
                            <td class="date_in_week${isToday ? ' today' : ''}">
                                <fmt:formatDate value="${d}" pattern="EEE"/> <br>
                                <div style="border-top: 1px solid #fff;">
                                    <fmt:formatDate value="${d}" pattern="dd-MM"/>
                                </div>
                            </td>
                        </c:forEach>                           
                    </tr>
                    <c:forEach items="${requestScope.timeslot}" var="t">
                        <tr>
                            <td class="week_date" style="padding-left: 3px; font-size: 15px;">Slot ${t.timeslot_id}</td>
                            <c:forEach items="${requestScope.week_date}" var="d">
                                <c:set var="isTodayOrFuture" value="${d.time >= currentDate.time}" />
                                <c:set var="found" value="false" />
                                <c:forEach items="${requestScope.weeklyTimetable}" var="w">
                                    <c:if test="${t.timeslot_id eq w.slot and w.date eq d}">
                                        <td class="week_date">
                                            <span >
                                                <a style="font-size: 14px" href="${pageContext.request.contextPath}/activitydetail?courseID=${w.enrollment.group.course.course_id}&attendance_id=${w.attendance_id}">${w.enrollment.group.course.course_code}</a>
                                            </span>-<span class="link_to_join" style="margin-left: 3px;"><a class="get_materials" href="https://flm.fpt.edu.vn/DefaultSignin" target="_blank">View Materials</a> </span> <br>
                                            at <span style="font-size: 14px">${w.classroom.room_code}</span>
                                            <c:if test="${isTodayOrFuture}">
                                                <span class="instructure_meet">-<a class="link_meet" href="${w.instructure.meet_link}">Meet URL</a></span>
                                            </c:if>
                                            <br>
                                            <span style="${w.status eq 'attended' ? 'color: green;' : w.status eq 'absent' ? 'color: red;' : 'color: rgb(255,0,0);'}">
                                                (${w.status})
                                            </span><br>
                                            <span class="time_study">
                                                (${w.timeSlot.description})
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
            </div>
            <br>
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
                                &nbsp;|&nbsp;<a href="http://library.fpt.edu.vn" target="_blank">library</a>
                                &nbsp;|&nbsp;<a href="http://library.books24x7.com" target="_blank">books24x7</a>
                            </p>
                        </td>
                    </tr>
                </table>
            </footer>
        </div>
    </body>
    <script>
        // Lấy tham chiếu đến các trường nhập ngày
        var startDateInput = document.getElementById("startDate");
        var endDateInput = document.getElementById("endDate");

        // Lắng nghe sự kiện onChange trên cả hai trường nhập ngày
        startDateInput.addEventListener("change", updateView);
        endDateInput.addEventListener("change", updateView);

        // Hàm cập nhật URL và gửi yêu cầu tự động
        function updateView() {
            var startDate = startDateInput.value;
            var endDate = endDateInput.value;

            // Tạo URL cần gửi yêu cầu đến (thay thế "/timetable" bằng URL của trang hiển thị thời khoá biểu)
            var newURL = "${pageContext.request.contextPath}/timetable?startDate=" + startDate + "&endDate=" + endDate;

            // Chuyển hướng đến URL mới
            window.location.href = newURL;
        }
    </script>
</html>