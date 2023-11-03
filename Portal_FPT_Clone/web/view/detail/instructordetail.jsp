<%-- 
    Document   : instructordetail
    Created on : 01-Nov-2023, 17:19:22
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/css/viewactivity.css" rel="stylesheet" type="text/css"/>
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
                            &nbsp;|&nbsp;<b>User Detail</b>
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
                Instructor Information
            </h2>
            <br>
            <div class="activity_view">
                <table style="width: 99%; margin-left: 7px">
                    <c:forEach items="${requestScope.instructures}" var="i">
                        <tr>
                            <td class="title">
                                <strong>Login</strong>
                            </td>
                            <td class="description">${i.instructure_code}</td>
                        </tr>
                        <tr>
                            <td class="title">
                                <strong>Full Name</strong>
                            </td>
                            <td class="description">${i.instructure_name}</td>
                        </tr>
                        <tr>
                            <td class="title">
                                <strong>Image</strong>
                            </td>
                            <td class="description">
                                <img src="${i.instructure_img}" alt="alt" style="width: 38%"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="title">
                                <strong>Email</strong>
                            </td>
                            <td class="description">${i.email}</td>
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
