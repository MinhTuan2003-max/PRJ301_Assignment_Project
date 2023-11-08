/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.BaseRequiredAuthenticationController;
import dal.AttendanceDBContext;
import dal.CampusDBContext;
import dal.EnrollmentDBContext;
import dal.GroupDBContext;
import dal.SemesterDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Attendance;
import entity.Campus;
import entity.Enrollment;
import entity.Group;
import entity.Semester;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import util.GetNullDefault;

/**
 *
 * @author MINH TUAN
 */
public class ViewAttendstudentController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        GetNullDefault gnd = new GetNullDefault();

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());

        SemesterDBContext sedb = new SemesterDBContext();
        ArrayList<Semester> semesters = sedb.getAllSemester();
        int semester_id = (request.getParameter("semester_id") != null) ? Integer.parseInt(request.getParameter("semester_id")) : gnd.getDefaultIfNull(request.getAttribute("semester_id"), semesters.size());

        GroupDBContext grdb = new GroupDBContext();
        ArrayList<Group> groups = grdb.getGroupByStudentIDAndSemester(students.getStudent_ID(), semester_id);
        int course_id = (request.getParameter("course_id") != null) ? Integer.parseInt(request.getParameter("course_id")) : gnd.getDefaultIfNull(request.getAttribute("course_id"), 1);

        AttendanceDBContext atdb = new AttendanceDBContext();
        ArrayList<Attendance> attendances = atdb.getViewAttendance(students.getStudent_ID(), course_id);
        int getAbsentCount = atdb.getAbsentCount(attendances);

        EnrollmentDBContext endb = new EnrollmentDBContext();
        Enrollment enrollment = endb.getEnrollmentByStudentIDAndGroup(students.getStudent_ID(), course_id);

        int absent_percent = endb.calculateAbsentPercent(enrollment, getAbsentCount);
        request.setAttribute("absent_percent", absent_percent);
        request.setAttribute("enrollment", enrollment);
        request.setAttribute("course_id", course_id);
        request.setAttribute("semester_id", semester_id);
        request.setAttribute("attendances", attendances);
        request.setAttribute("absent", getAbsentCount);
        request.setAttribute("groups", groups);
        request.setAttribute("campus", campus);
        request.setAttribute("students", students);
        request.setAttribute("semesters", semesters);

        request.getRequestDispatcher("/view/student/viewattendance.jsp").forward(request, response);
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
