<%-- 
    Document   : userdetail
    Created on : 16-Oct-2023, 12:44:36
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User Detail</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/css/detailstyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                            &nbsp;|&nbsp;<b>User Detail</b>
                        </div>
                        <div class="divUser">
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            <a href="">
                                                <strong>${account.displayname}</strong>
                                            </a>
                                            &nbsp;|&nbsp;<a href="logout">
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
            <div>
                <h4>Student Information</h4>
            </div>
            <div class="row content-body">
                <div class="show-img col-md-4">
                    <img class="image-avatar" src="${requestScope.students.student_Img}" alt="Student Img"/>
                </div>
                <div class="information-student col-md-8">
                    <div class="profile-table">
                        <table>
                            <c:set var="s" value="${requestScope.students}"/>
                            <tr>
                                <th colspan="2">Profile</th>
                            </tr>
                            <tr>
                                <th colspan="2"></th>
                            </tr>
                            <tr>
                                <td class="row-1">Full Name</td>
                                <td>${s.student_Name}</td>
                            </tr>
                            <tr>
                                <td class="row-1">Date of Birth</td>
                                <td>${s.student_dob}</td>                        
                            </tr>
                            <tr>
                                <td class="row-1">Gender</td>
                                <td>
                                    <c:if test="${s.student_Gender eq true}">
                                        Male
                                    </c:if>
                                    <c:if test="${s.student_Gender eq false}">
                                        Female
                                    </c:if>    
                                </td>
                            </tr>
                            <tr>
                                <td class="row-1">Address</td>
                                <td>${s.student_Address}</td>
                            </tr>
                            <tr>
                                <td class="row-1">Phone Num</td>
                                <td>0${s.student_Phone}</td>
                            </tr>
                            <tr>
                                <td class="row-1">Email</td>
                                <td>                                    
                                    ${s.student_Email}
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div class="academic-table col-md-6">
                        <table>
                            <tr>
                                <th colspan="2">Academic</th>
                            </tr>
                            <tr>
                                <th colspan="2"></th>
                            </tr>
                            <tr>
                                <td>Roll Number</td>
                                <td>${requestScope.students.student_ID}</td>
                            </tr>
                            <tr>
                                <td>Member Code</td>
                                <td><c:out value="${account.displayname}" /></td>                        
                            </tr>
                            <tr>
                                <td>Mode</td>
                                <td>Chính quy</td>                        
                            </tr>
                            <tr>
                                <td>Current Term No</td>
                                <td>${requestScope.students.current_semester}</td>
                            </tr>
                            <tr>
                                <td>Curriculum</td>
                                <td>${requestScope.students.major.major_name}</td>
                            </tr>
                            <tr>
                                <td>Cumulative GPA</td>
                                <td>${requestScope.students.current_gpa}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <footer>
            <table width="100%" border="0">
                <tr>
                    <td style="padding-left: 210px">
                        <b>Mọi góp ý, thắc mắc xin liên hệ:</b>
                        <span>Phòng dịch vụ sinh viên</span>: Email:
                        <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                        Điện thoại: <strong>(024)7308.13.13</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p style="text-align: center">
                            &copy; Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>
                            &nbsp;|&nbsp;<a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>
                            &nbsp;|&nbsp;<a href="http://library.fpt.edu.vn" target="_blank">library</a>
                            &nbsp;|&nbsp;<a href="http://library.books24x7.com" target="_blank">books24x7</a>
                        </p>
                    </td>
                </tr>
            </table>
        </footer>
    </body>
</html>
