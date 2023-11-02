<%-- 
    Document   : home
    Created on : 13-Oct-2023, 10:04:36
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/css/homestyle.css" rel="stylesheet" type="text/css"/>
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
                                <td class="head-text" colspan="1" >
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
            <div class="divUser">
                <table>
                    <tr>
                        <td>
                            <p>
                                <a href="userdetail">
                                    <strong>${sessionScope.account.displayname}</strong>
                                </a>
                                &nbsp;|&nbsp;<a href="logout">
                                    <strong>Logout</strong>
                                </a>
                                &nbsp;|&nbsp;<b>FPTU - FPT University</b>                                                            
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
            <br>
            <div><br></div>
            <div class="row overlay content">
                <div class="tag">
                    <p>Attendance Information</p>
                </div> 
                <div class="col-md-6">
                    <section class="hero">
                        <h1>Weekly Timetable</h1>
                        <p>View schedule by week or by day</p>
                        <a href="timetable" class="cta-button">
                            <strong>Weekly Timetable</strong>
                        </a>
                    </section>
                </div>

                <div class="col-md-6">
                    <section class="contact">
                        <h1>Attendance Report</h1>
                        <p>Report attendance for students by each subject</p>
                        <a href="viewattendance?user_id=${sessionScope.account.userID}" class="cta-button">
                            <strong>Attendance Report</strong>
                        </a>
                    </section>
                </div>
            </div>
            <br>
            <footer style="margin-left: 0px">
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
                                &copy; Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>
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
