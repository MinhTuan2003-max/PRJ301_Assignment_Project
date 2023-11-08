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
        <title>View Attendance</title>
        <link href="${pageContext.request.contextPath}/css/viewattendance.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .table td, .table th {
                padding: .75rem;
                vertical-align: top;
                border: 1px solid #dee2e6;
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
                                        <img style="width: 120px;
                                             height: 40px" src="img/img-app-store.png" alt="appstore"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="https://play.google.com/store/apps/details?id=com.fuct" class="">
                                        <img style="width: 120px;
                                             height: 43px" src="img/img-play-store.png" alt=""/>
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
                <strong>
                    View Attendance Report for ${sessionScope.account.displayname} (${requestScope.students.student_ID})
                </strong>
            </h2>
            <br>
            <div class="choose_term_course">
                <table style="width: 100%">
                    <tr>
                        <th class="title" style="padding-left: 3px">CAMPUS/PROGRAM</th>
                        <th class="title" style="padding: 0 100px 0 3px">SEMESTER</th>
                        <th class="title" style="padding-left: 3px">COURSE</th>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <th>FU-${requestScope.campus[0].cname}</th>
                            </table>
                        </td>
                        <td>
                            <table>
                                <c:forEach var="se" items="${requestScope.semesters}">
                                    <tr style="border-bottom: 1px solid rgb(210,210,210);">
                                        <c:choose>
                                            <c:when test="${se.semester_id == requestScope.semester_id}">
                                                <td style="padding: 0 100px 0 3px; ">
                                                    <a style="font-size: 14px;" class="selected"
                                                       href="viewattendance?semester_id=${se.semester_id}">${se.semester_name}</a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding: 0 100px 0 3px">
                                                    <a style="font-size: small;"
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
                                    <tr style="border-bottom: 1px solid rgb(210,210,210);">
                                        <c:choose>
                                            <c:when test="${g.group_id == requestScope.course_id}">
                                                <td style="padding-left: 3px">
                                                    <a class="selected" href="viewattendance?semester_id=${requestScope.semester_id}&course_id=${g.group_id}">
                                                        ${g.course.course_name}(${g.course.course_code}) (${g.group_name},start ${g.course.start_date})
                                                    </a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="padding-left: 3px">
                                                    <a href="viewattendance?semester_id=${requestScope.semester_id}&course_id=${g.group_id}">
                                                        ${g.course.course_name}(${g.course.course_code}) (${g.group_name},start ${g.course.start_date})
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
                <div id="Grid">
                    <table class="table table-hover" style="width: 100%">
                        <tr>
                            <th class="thead-inverse" style="width:10px;
                                border-right: 1px solid #fff">NO</th>
                            <th class="thead-inverse" style="width:161px;
                                border-right: 1px solid #fff">DATE</th>
                            <th class="thead-inverse" style="width:104px;
                                border-right: 1px solid #fff">SLOT</th>
                            <th class="thead-inverse" style="width:60px;
                                border-right: 1px solid #fff">ROOM</th>
                            <th class="thead-inverse" style="width:80px;
                                border-right: 1px solid #fff">LECTURER</th>
                            <th class="thead-inverse" style="width:83px;
                                border-right: 1px solid #fff;">GROUP NAME</th>
                            <th class="thead-inverse" style="width:10px;
                                border-right: 1px solid #fff">ATTENDANCE STATUS</th>
                            <th class="thead-inverse" style="width:10px;
                                border-right: 1px solid #fff">LECTURER'S COMMENT</th>
                        </tr>
                        <c:forEach items="${requestScope.attendances}" var="att" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>
                                    <span style="background-color: rgb(51,122,183);
                                          color: #fff;
                                          font-weight: bold;
                                          border-radius: 3px;
                                          padding: 3px;
                                          font-size: 12px;">
                                        ${att.day_of_week} <fmt:formatDate value="${att.date}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </td>
                                <td>
                                    <span style="background-color: rgb(217,83,79);
                                          color: #fff;
                                          font-weight: bold;
                                          border-radius: 3px;
                                          padding: 3px;
                                          font-size: 12px;">
                                        ${att.slot}_(${att.timeSlot.description})
                                    </span>
                                </td>
                                <td>${att.classroom.room_code}</td>
                                <td>${att.instructure.instructure_code}</td>
                                <td>${att.enrollment.group.group_name}</td>
                                <td>
                                    <div style="text-transform: capitalize;
                                         ${att.status eq 'attended' ? 'color: green;' 
                                           : att.status eq 'absent' ? 'color: red;' 
                                           : 'color: gray;'}">
                                         <c:choose>
                                             <c:when test="${att.status eq 'not yet'}">
                                                 <span style="display: none;">not yet</span>
                                                 <span style="color: black">Future</span>
                                             </c:when>
                                             <c:otherwise>
                                                 ${att.status}
                                             </c:otherwise>
                                         </c:choose>
                                    </div>
                                </td>
                                <td>${att.comments}</td>
                            </tr>
                        </c:forEach>
                    </table>     
                    <br>
                    <div style="text-align: center">
                        <c:choose>
                            <c:when test="${requestScope.absent_percent > 20 and requestScope.enrollment.total_slot eq 20}">
                                <span class="total_absent" style="color: red;">
                                    <strong>
                                        ABSENT : ${requestScope.absent_percent}% ABSENT SO FAR (${requestScope.absent} ABSENT ON ${requestScope.enrollment.total_slot} TOTAL)
                                    </strong>
                                </span>
                            </c:when>
                            <c:when test="${requestScope.absent_percent > 10 and requestScope.enrollment.total_slot eq 10}">
                                <span class="total_absent" style="color: red;">
                                    <strong>
                                        ABSENT : ${requestScope.absent_percent}% ABSENT SO FAR (${requestScope.absent} ABSENT ON ${requestScope.enrollment.total_slot} TOTAL)
                                    </strong>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="total_absent">
                                    <strong>
                                        ABSENT : ${requestScope.absent_percent}% ABSENT SO FAR (${requestScope.absent} ABSENT ON ${requestScope.enrollment.total_slot} TOTAL)
                                    </strong>
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
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