<%-- 
    Document   : studenttranscript
    Created on : 11-Oct-2023, 20:20:18
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
        <title>FPT University Academic Portal</title>
        <style type="text/css">
            .style1 {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="header-image"></div>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="https://daihoc.fpt.edu.vn/">
                            <img style="width: 200px; height: auto;" class="head_logo" src="../img/2017-FPTU-S-01.png" alt=""/>
                        </a>
                        <div class="spacer"></div>
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
                    <form name="aspnetForm" method="post" action="./transcript.jsp" id="aspnetForm">                        
                        <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                            <a href="?view=user">
                                <span id="ctl00_lblLogIn" class="label label-success">tuanhmhe173175</span>
                            </a>
                            | <a href="../../logout" class="label label-success">logout</a>
                            |
                            <span id="ctl00_lblCampusName" class="label label-success">CAMPUS: FPTU-Hòa Lạc</span>
                        </div>
                        <div style="position: absolute; top: -35px; right: 30px; width: 150px;"></div>
                        <ol class="breadcrumb">
                            <li>
                                <span id="ctl00_lblNavigation">
                                    <a href="../../login">Home</a>
                                    &nbsp;|&nbsp;<b>Grade Transcript</b>
                                </span>
                            </li>
                        </ol>
                        <table>
                            <tr style="border-bottom: 0 none">
                                <td>
                                    <div>
                                        <h2>
                                            Grade report for transcript

                                            <span id="ctl00_mainContent_lblRollNumber">
                                                <span class="label label-default">HE173175</span>
                                                - <span class="label label-info">BIT_SE_17C_NJ</span>
                                            </span>
                                        </h2>
                                        <br/>
                                        <div id="Grid">
                                            <table>
                                                <tr>
                                                    <td valign="top">
                                                        <div id="ctl00_mainContent_divGrade">
                                                            <Table class="table table-hover">
                                                                <thead class="thead-inverse" style="background-color: #6b90da">
                                                                    <tr >
                                                                        <th style="width:10px">No</th>
                                                                        <th style="width:15px">Term</th>
                                                                        <th style="width:80px">Semester</th>
                                                                        <th style="width:60px">Subject Code</th>
                                                                        <th style="width:60px">prerequisite</th>
                                                                        <th style="width:80px">Replaced Subject</th>
                                                                        <th>Subject Name</th>
                                                                        <th style="width:10px">Credit</th>
                                                                        <th style="width:20px">Grade</th>
                                                                        <th style="width:80px">Status</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>1</td>
                                                                        <td>0</td>
                                                                        <td>Fall2021</td>
                                                                        <td>GDQP</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Military training</td>
                                                                        <td>0</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                7.6
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2</td>
                                                                        <td>0</td>
                                                                        <td>Summer2022</td>
                                                                        <td>VOV124</td>
                                                                        <td style="width:60px">VOV114</td>
                                                                        <td></td>
                                                                        <td>Vovinam 2</td>
                                                                        <td>2</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                7.5
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>3</td>
                                                                        <td>0</td>
                                                                        <td>Summer2022</td>
                                                                        <td>VOV134</td>
                                                                        <td style="width:60px">VOV124</td>
                                                                        <td></td>
                                                                        <td>Vovinam 3</td>
                                                                        <td>2</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                8
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>4</td>
                                                                        <td>0</td>
                                                                        <td>Spring2022</td>
                                                                        <td>VOV114</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Vovinam 1</td>
                                                                        <td>2</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                7.5
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>5</td>
                                                                        <td>0</td>
                                                                        <td>Summer2022</td>
                                                                        <td>TRS601</td>
                                                                        <td style="width:60px">TRS501/LUK5</td>
                                                                        <td></td>
                                                                        <td>Transition</td>
                                                                        <td>0</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                6.6
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>6</td>
                                                                        <td>0</td>
                                                                        <td>Spring2022</td>
                                                                        <td>TMI101</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>ÐSA102</td>
                                                                        <td>Traditional musical instrument</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                8.2
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>7</td>
                                                                        <td>1</td>
                                                                        <td>Fall2022</td>
                                                                        <td>SSL101c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Academic Skills for University Success</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                7.3
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>8</td>
                                                                        <td>1</td>
                                                                        <td>Fall2022</td>
                                                                        <td>CSI104</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Introduction to Computer Science</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                6.8
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>9</td>
                                                                        <td>1</td>
                                                                        <td>Fall2022</td>
                                                                        <td>PRF192</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Programming Fundamentals</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                6.5
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>10</td>
                                                                        <td>1</td>
                                                                        <td>Fall2022</td>
                                                                        <td>MAE101</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Mathematics for Engineering</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                6.8
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>11</td>
                                                                        <td>1</td>
                                                                        <td>Fall2022</td>
                                                                        <td>CEA201</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>
                                                                            Computer Organization and Architecture
                                                                        </td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                8.1
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>12</td>
                                                                        <td>2</td>
                                                                        <td>Spring2023</td>
                                                                        <td>PRO192</td>
                                                                        <td style="width:60px">PRF192</td>
                                                                        <td></td>
                                                                        <td>Object-Oriented Programming</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                8.4
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>13</td>
                                                                        <td>2</td>
                                                                        <td>Spring2023</td>
                                                                        <td>MAD101</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Discrete mathematics</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                7.6
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>14</td>
                                                                        <td>2</td>
                                                                        <td>Spring2023</td>
                                                                        <td>OSG202</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Operating Systems</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                9.1
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>15</td>
                                                                        <td>2</td>
                                                                        <td>Spring2023</td>
                                                                        <td>NWC203c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Computer Networking</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                9.8
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>16</td>
                                                                        <td>2</td>
                                                                        <td>Spring2023</td>
                                                                        <td>SSG104</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Communication and In-Group Working Skills</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                8.7
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>17</td>
                                                                        <td>3</td>
                                                                        <td>Summer2023</td>
                                                                        <td>JPD113</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Elementary Japanese 1-A1.1</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                9.7
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>18</td>
                                                                        <td>3</td>
                                                                        <td>Summer2023</td>
                                                                        <td>CSD201</td>
                                                                        <td style="width:60px">PRO192</td>
                                                                        <td></td>
                                                                        <td>Data Structures and Algorithms</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                6.7
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>19</td>
                                                                        <td>3</td>
                                                                        <td>Summer2023</td>
                                                                        <td>DBI202</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Introduction to Databases</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                7.9
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>20</td>
                                                                        <td>3</td>
                                                                        <td>Summer2023</td>
                                                                        <td>LAB211</td>
                                                                        <td style="width:60px">PRO192</td>
                                                                        <td></td>
                                                                        <td>OOP with Java Lab</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">

                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>21</td>
                                                                        <td>3</td>
                                                                        <td>Summer2023</td>
                                                                        <td>WED201c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Web Design</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-primary">
                                                                                8.5
                                                                            </span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-success">
                                                                                Passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>22</td>
                                                                        <td>4</td>
                                                                        <td>Fall2023</td>
                                                                        <td>MAS291</td>
                                                                        <td style="width:60px">MAE101/MAC101</td>
                                                                        <td></td>
                                                                        <td>Statistics and Probability</td>
                                                                        <td>3</td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-info">
                                                                                Studying
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>23</td>
                                                                        <td>4</td>
                                                                        <td>Fall2023</td>
                                                                        <td>JPD123</td>
                                                                        <td style="width:60px">JPD113</td>
                                                                        <td></td>
                                                                        <td>Elementary Japanese 1-A1.2</td>
                                                                        <td>3</td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-info">
                                                                                Studying
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>24</td>
                                                                        <td>4</td>
                                                                        <td>Fall2023</td>
                                                                        <td>IOT102</td>
                                                                        <td style="width:60px"></td>
                                                                        <td></td>
                                                                        <td>Internet of Things</td>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <span class="label label-danger"></span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="label label-danger">
                                                                                Not passed
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>25</td>
                                                                        <td>4</td>
                                                                        <td>Fall2023</td>
                                                                        <td>PRJ301</td>
                                                                        <td style="width:60px">DBI202&PRO192</td>
                                                                        <td></td>
                                                                        <td>Java Web Application Development</td>
                                                                        <td>3</td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-info">
                                                                                Studying
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>26</td>
                                                                        <td>4</td>
                                                                        <td>Fall2023</td>
                                                                        <td style="width:60px">SWE201c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Introduction to Software Engineering</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-info">
                                                                                Studying
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>27</td>
                                                                        <td>5</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SWP391</td>
                                                                        <td style="width:60px">SWE201c&PRJ301</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Application development project</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">
                                                                                Not started
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>28</td>
                                                                        <td>5</td>
                                                                        <td></td>
                                                                        <td style="width:60px">ITE302c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Ethics in IT</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>29</td>
                                                                        <td>5</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SWR302</td>
                                                                        <td style="width:60px">SWE201c/SWE102</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Software Requirement</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>30</td>
                                                                        <td>5</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SWT301</td>
                                                                        <td style="width:60px">SWE201c/SWE102</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Software Testing</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>31</td>
                                                                        <td>5</td>
                                                                        <td></td>
                                                                        <td style="width:60px">FER202</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Front-End web development with React</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>32</td>
                                                                        <td>6</td>
                                                                        <td></td>
                                                                        <td style="width:60px">ENW492c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Writing Research Papers</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>33</td>
                                                                        <td>6</td>
                                                                        <td></td>
                                                                        <td style="width:60px">OJT202</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>On the job training</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>34</td>
                                                                        <td>7</td>
                                                                        <td></td>
                                                                        <td style="width:60px">ISC301</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>e-Commerce</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>35</td>
                                                                        <td>7</td>
                                                                        <td></td>
                                                                        <td style="width:60px">PRM392</td>
                                                                        <td style="width:60px">PRO192</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Mobile Programming</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>36</td>
                                                                        <td>7</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SWD392</td>
                                                                        <td style="width:60px">PRO192&(&SWE201c/SWE102)</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>SW Architecture and Design</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>37</td>
                                                                        <td>7</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SDN301m</td>
                                                                        <td style="width:60px">DBI202&FER201m</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Server-Side development with NodeJS, Express, and MongoDB</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>38</td>
                                                                        <td>7</td>
                                                                        <td></td>
                                                                        <td style="width:60px">EXE101</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Experiential Entrepreneurship 1</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>39</td>
                                                                        <td>8</td>
                                                                        <td></td>
                                                                        <td style="width:60px">EXE201</td>
                                                                        <td style="width:60px">EXE101</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Experiential Entrepreneurship 2</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>40</td>
                                                                        <td>8</td>
                                                                        <td></td>
                                                                        <td style="width:60px">PMG202c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Project management</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>41</td>
                                                                        <td>8</td>
                                                                        <td></td>
                                                                        <td style="width:60px">WDU203c</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>UI/UX Design</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>42</td>
                                                                        <td>8</td>
                                                                        <td></td>
                                                                        <td style="width:60px">MLN111</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Philosophy of Marxism – Leninism</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>43</td>
                                                                        <td>8</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SE-0004</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Elective 4</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>44</td>
                                                                        <td>8</td>
                                                                        <td></td>
                                                                        <td style="width:60px">MLN122</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Political economics of Marxism – Leninism</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>45</td>
                                                                        <td>9</td>
                                                                        <td></td>
                                                                        <td style="width:60px">SEP490</td>
                                                                        <td style="width:60px"></td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>SE Capstone Project</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>46</td>
                                                                        <td>9</td>
                                                                        <td></td>
                                                                        <td style="width:60px">HCM202</td>
                                                                        <td style="width:60px">MLN111/|MLN101&MLN122</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Ho Chi Minh Ideology</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>47</td>
                                                                        <td>9</td>
                                                                        <td></td>
                                                                        <td style="width:60px">MLN131</td>
                                                                        <td style="width:60px">MLN111/|MLN101&MLN122</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>Scientific socialism</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>48</td>
                                                                        <td>9</td>
                                                                        <td></td>
                                                                        <td style="width:60px">VNR202</td>
                                                                        <td style="width:60px">MLN111/|MLN101&MLN122</td>
                                                                        <td>
                                                                            <span class="label label-warning"></span>
                                                                        </td>
                                                                        <td>History of Việt Nam Communist Party</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            <span class="label label-default">Not started</span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                                <Table>
                                                                    </div>
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" align="left">
                                                                            <div id="ctl00_mainContent_divDNTN"></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top" align="left">
                                                                            <h2>
                                                                                <span class="label label-primary">Những môn ngoài khung chương trình</span>
                                                                            </h2>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top">
                                                                            <div id="ctl00_mainContent_divNotGrade">
                                                                                <Table class="table table-hover">
                                                                                    <thead class="thead-inverse">
                                                                                        <tr>
                                                                                            <th style="width:10px">No</th>
                                                                                            <th style="width:40px">Semester</th>
                                                                                            <th style="width:40px">SubjectCode</th>
                                                                                            <th>SubjectName</th>
                                                                                            <th>Credit</th>
                                                                                            <th style="width:20px">Grade</th>
                                                                                            <th style="width:55px">Status</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>1</td>
                                                                                            <td>Fall2021</td>
                                                                                            <td>ENT104</td>
                                                                                            <td>Top Notch 1</td>
                                                                                            <td>0</td>
                                                                                            <td>
                                                                                                <span class="label label-primary">7.4</span>
                                                                                            </td>
                                                                                            <td>
                                                                                                <span class="label label-success">Passed</span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2</td>
                                                                                            <td>Spring2022</td>
                                                                                            <td>ENT203</td>
                                                                                            <td>Top Notch 2</td>
                                                                                            <td>0</td>
                                                                                            <td>
                                                                                                <span class="label label-primary">7.3</span>
                                                                                            </td>
                                                                                            <td>
                                                                                                <span class="label label-success">Passed</span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>3</td>
                                                                                            <td>Spring2022</td>
                                                                                            <td>TRS401</td>
                                                                                            <td>English 4</td>
                                                                                            <td>0</td>
                                                                                            <td>
                                                                                                <span class="label label-primary">7.6</span>
                                                                                            </td>
                                                                                            <td>
                                                                                                <span class="label label-success">Passed</span>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>4</td>
                                                                                            <td>Summer2022</td>
                                                                                            <td>TRS501</td>
                                                                                            <td>English 5</td>
                                                                                            <td>0</td>
                                                                                            <td>
                                                                                                <span class="label label-primary">6.4</span>
                                                                                            </td>
                                                                                            <td>
                                                                                                <span class="label label-success">Passed</span>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                    <Table>
                                                                                        </div>
                                                                                        </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    </td>
                                                                                    </tr>
                                                                                    <table width="100%" border="0">
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
                                                                                    </td>
                                                                                    </tr>
                                                                                </table>
                                                                                </form>
                                                                            </div>
                                                                            </div>
                                                                            </div>
                                                                            </body>
                                                                            </html>

