/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.detail;

import controller.BaseRequiredAuthenticationController;
import dal.ActivityDetailDBContext;
import dal.CampusDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Attendance;
import entity.Campus;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author MINH TUAN
 */
public class ActivityDetailController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        ActivityDetailDBContext addbc = new ActivityDetailDBContext();
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        int attendanceID = Integer.parseInt(request.getParameter("attendance_id"));
        ArrayList<Attendance> detailTimetable = addbc.getDetailWeeklyTimetable(loggedAccount.getUserID(), courseID, attendanceID);

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());
        request.setAttribute("campus", campus);
        request.setAttribute("students", students);
        request.setAttribute("detailTimetable", detailTimetable);
        request.getRequestDispatcher("view/student/activitydetail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        processRequest(request, response, loggedAccount);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        processRequest(request, response, loggedAccount);
    }

}
