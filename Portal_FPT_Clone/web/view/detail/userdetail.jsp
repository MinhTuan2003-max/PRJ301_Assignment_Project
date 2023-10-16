<%-- 
    Document   : userdetail
    Created on : 16-Oct-2023, 12:44:36
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
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
                                    <img style="width: 120px; height: 40px" src="../../img/img-app-store.png" alt="appstore"/>
                                </a>
                            </td>
                            <td>
                                <a href="https://play.google.com/store/apps/details?id=com.fuct" class="">
                                    <img style="width: 120px; height: 43px" src="../../img/img-play-store.png" alt=""/>
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
                            <a href="../home/home.jsp">Home</a>
                            &nbsp;|&nbsp;<b>User Detail</b>
                        </div>
                        <div class="divUser">
                            <table>
                                <tr>
                                    <td>
                                        <p>
                                            <a href="">
                                                <strong>${sessionScope.account.displayname}</strong>
                                            </a>
                                            &nbsp;|&nbsp;<a href="../../logout">
                                                <strong>Logout</strong>
                                            </a>
                                            &nbsp;|&nbsp;<b>CAMPUS: FPTU-Hòa Lạc</b>
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
                    <img class="image-avatar" src="../../img/avatar.png" alt="alt"/>
                </div>
                <div class="information-student col-md-8">
                    <div class="profile-table">
                        <table>
                            <tr>
                                <th colspan="2">Profile</th>
                            </tr>
                            <tr>
                                <th colspan="2"></th>
                            </tr>
                            <tr>
                                <td class="row-1">Full Name</td>
                                <td> Hà Minh Tuan </td>
                            </tr>
                            <tr>
                                <td class="row-1">Date of Birth</td>
                                <td>29/09/2003</td>                        
                            </tr>
                            <tr>
                                <td class="row-1">Gender</td>
                                <td>Male</td>
                            </tr>
                            <tr>
                                <td class="row-1">ID Card</td>
                                <td>025203005158</td>
                            </tr>
                            <tr>
                                <td class="row-1">Address</td>
                                <td>Phu Tho</td>
                            </tr>
                            <tr>
                                <td class="row-1">Phone number</td>
                                <td>0367133632</td>
                            </tr>
                            <tr>
                                <td class="row-1">Email</td>
                                <td>
                                    <a href="https://mail.google.com/mail/u/0/#inbox?compose=CllgCJqZhTDVdvlKMzbnNHglfcmmqWWJKbrnttBXVrqZhjrvlVQzJVDBLwDZDSkgQwdnCgwSLtL">
                                        tuanhmhe173175@fpt.edu.vn
                                    </a>
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
                                <td>HE173175</td>
                            </tr>
                            <tr>
                                <td>Member Code</td>
                                <td>tuanhmhe173175</td>                        
                            </tr>
                            <tr>
                                <td>Mode</td>
                                <td>Chính quy</td>                        
                            </tr>
                            <tr>
                                <td>Current Term No</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td>Major</td>
                                <td>BIT</td>
                            </tr>
                            <tr>
                                <td>Curriculum</td>
                                <td>BIT_SE_17C_NJ</td>
                            </tr>
                            <tr>
                                <td>Cumulative GPA</td>
                                <td>8.02</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>