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

/**
 *
 * @author MINH TUAN
 */
public class ViewAttendstudentController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());

        SemesterDBContext sedb = new SemesterDBContext();
        ArrayList<Semester> semesters = sedb.getAllSemester();
        int semester_id = (request.getParameter("semester_id") != null) ? Integer.parseInt(request.getParameter("semester_id")) : getDefaultIfNull(request.getSession().getAttribute("semester_id"), semesters.size());
        request.getSession().setAttribute("semester_id", semester_id);

        GroupDBContext grdb = new GroupDBContext();
        ArrayList<Group> groups = grdb.getGroupByStudentIDAndSemester(students.getStudent_ID(), semester_id);
        int group_id = (request.getParameter("group_id") != null) ? Integer.parseInt(request.getParameter("group_id")) : getDefaultIfNull(request.getSession().getAttribute("group_id"), 1);
        request.getSession().setAttribute("group_id", group_id);

        AttendanceDBContext atdb = new AttendanceDBContext();
        ArrayList<Attendance> attendances = atdb.getViewAttendance(students.getStudent_ID(), group_id);
        request.setAttribute("attendances", attendances);

        EnrollmentDBContext endb = new EnrollmentDBContext();
        Enrollment enrollment = endb.getEnrollmentByStudentIDAndGroup(students.getStudent_ID(), group_id);

        request.setAttribute("total_slot", enrollment.getTotal_slot());
        request.setAttribute("total_absent_slot", enrollment.getTotal_absent_slot());
        int absent_percent = Math.round((float) enrollment.getTotal_absent_slot() / enrollment.getTotal_slot() * 100);
        request.setAttribute("absent_percent", absent_percent);
        request.setAttribute("enrollment", enrollment);
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

    private static int getDefaultIfNull(Object value, int defaultValue) {
        if (value != null) {
            return (int) value;
        } else {
            return defaultValue;
        }
    }
}
