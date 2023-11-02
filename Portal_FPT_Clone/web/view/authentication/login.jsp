<%-- 
    Document   : login
    Created on : 07-Oct-2023, 10:05:34
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT University Academic Portal</title>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/validate.js" type="text/javascript"></script>
        <!-- Add Bootstrap CSS link -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="header-image"></div>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="https://daihoc.fpt.edu.vn/">
                            <img class="head_logo" src="img/2017-FPTU-S-01.png" alt=""/>
                        </a>
                        <div class="spacer"></div> <!-- This div creates a space -->
                    </div>
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
        <div class="body_content">
            <div class="row">
                <div class="image-column">
                    <img src="img/8716597e8b9a5fc4068b-removebg-preview.png" alt=""/>
                    <div class="tag">
                        <h1>Welcome to FAP</h1>                       
                        <p> 
                            Giáo dục đào tạo đáp ứng nhu cầu xã hội và dựa trên các công nghệ đào tạo tiên tiến nhất
                        </p>
                    </div>
                </div>

                <div class="login-column">
                    <div class="page-header">              
                        <div class="login-form" id="login-form">
                            <h4>Đăng nhập FAP</h4>
                            <h4>Cổng Thông tin Học Thuật FPTU</h4>
                            <form action="login" method="POST" onsubmit="return validateLoginForm();">
                                <div class="form-group">
                                    <select class="form-control" name="campus" id="studentLecturerCampusSelect" style="width: 100%;">
                                        <option value="studentLecturerCampusSelect">Select Campus</option>
                                        <option value="1">FU-Hòa Lạc</option>
                                        <option value="2">FU-Hồ Chí Minh</option>
                                        <option value="3">FU-Đà Nẵng</option>
                                        <option value="4">FU-Quy Nhơn</option>
                                        <option value="5">FU-Cần Thơ</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input type="text" name="username" required class="form-control" id="username" placeholder="Enter gmail">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" required class="form-control" id="password" placeholder="Enter password">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">
                                        <strong>
                                            Sign In
                                        </strong> 
                                    </button>                           
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="footer bg-white text-black p-4">
            <div class="container text-center">
                <p>&copy; Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>
                    &nbsp;|&nbsp;<a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>
                    &nbsp;|&nbsp;<a href="http://library.fpt.edu.vn" target="_blank">library</a>
                    &nbsp;|&nbsp;<a href="http://library.books24x7.com" target="_blank">books24x7</a>
                </p>
            </div>
        </footer>
    </body>
</html>

