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
                    <div class="tag" style="bottom: 0px">
                        <h1>Welcome to FAP</h1>                       
                        <p>Sinh viên FPT luôn luôn nỗ lực, cố gắng, quyết tâm làm khác để làm tốt</p>
                    </div>
                </div>

                <div class="login-column">
                    <div class="page-header">              
                        <div class="login-form" id="login-form">
                            <h4>Đăng nhập FAP</h4>
                            <select class="form-control" id="userSelectType" style="width: 100%;">
                                <option value="type1">Sinh viên, Giảng viên, Cán bộ ĐH-FPT</option>
                                <option value="type2">Phụ huynh</option>
                            </select>
                            <form onsubmit="return validateStudentLecturerLoginForm();"></br>
                                <div class="form-group">
                                    <select class="form-control" id="studentLecturerCampusSelect" style="width: 100%;">
                                        <option value="studentLecturerCampusSelect">Select Campus</option>
                                        <option value="campus1">FU-Hòa Lạc</option>
                                        <option value="campus2">FU-Hồ Chí Minh</option>
                                        <option value="campus3">FU-Đà Nẵng</option>
                                        <option value="campus4">FU-Quy Nhơn</option>
                                        <option value="campus5">FU-Cần Thơ</option>
                                    </select>
                                </div>
                                <form onsubmit="return validateLoginForm();">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required id="username" placeholder="Enter gmail">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" required id="password" placeholder="Enter password">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            <strong>
                                                Đăng Nhập
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
                <p>&copy; Powered by
                    <span>
                        <a href="http://fpt.edu.vn/">FPT University</a>
                    </span> |
                    <span>
                        <a href="http://cms.fpt.edu.vn/">CMS</a>
                    </span> |
                    <span>
                        <a href="http://library.fpt.edu.vn/">Library</a>
                    </span>
                    <span>
                        <a href="http://library.books24x7.com/">books24x7</a>
                    </span>
                </p>
            </div>
        </footer>
        <!-- Bootstrap JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

