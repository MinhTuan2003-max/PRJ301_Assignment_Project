/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.BaseRequiredAuthenticationController;
import dal.CampusDBContext;
import dal.DepartmentDBContext;
import dal.EnrollmentDBContext;
import dal.GroupDBContext;
import dal.SemesterDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Campus;
import entity.Course;
import dal.CourseDBContext;
import entity.Department;
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
public class GroupController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());

        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());

        SemesterDBContext sedb = new SemesterDBContext();
        ArrayList<Semester> semesters = sedb.getAllSemester();
        int semester_id = (request.getParameter("semester_id") != null) ? Integer.parseInt(request.getParameter("semester_id")) : getDefaultIfNull(request.getSession().getAttribute("semester_id"), semesters.size());
        request.getSession().setAttribute("semester_id", semester_id);

        DepartmentDBContext ddbc = new DepartmentDBContext();
        ArrayList<Department> departments = ddbc.getDepartmentBySemester();
        int department_id = (request.getParameter("department_id") != null) ? Integer.parseInt(request.getParameter("department_id")) : getDefaultIfNull(request.getSession().getAttribute("department_id"), 1);
        request.getSession().setAttribute("department_id", department_id);

        CourseDBContext cdbc = new CourseDBContext();
        ArrayList<Course> courses = cdbc.getCourseByDepartmentID(department_id);
        int course_id = (request.getParameter("course_id") != null) ? Integer.parseInt(request.getParameter("course_id")) : getDefaultIfNull(request.getSession().getAttribute("course_id"), 0);
        request.getSession().setAttribute("course_id", course_id);

        GroupDBContext gdbc = new GroupDBContext();
        ArrayList<Group> groups = gdbc.getGroupByCourse(course_id, semester_id);
        int group_id = (request.getParameter("group_id") != null) ? Integer.parseInt(request.getParameter("group_id")) : getDefaultIfNull(request.getSession().getAttribute("group_id"), 0);
        request.getSession().setAttribute("group_id", group_id);

        EnrollmentDBContext edbc = new EnrollmentDBContext();
        ArrayList<Enrollment> enrollments = edbc.getByGroupAndCourse(group_id, course_id, semester_id);

        request.setAttribute("campus", campus);
        request.setAttribute("students", students);
        request.setAttribute("semesters", semesters);
        request.setAttribute("departments", departments);
        request.setAttribute("enrollments", enrollments);
        request.setAttribute("courses", courses);
        request.setAttribute("groups", groups);
        request.setAttribute("student", students);
        request.setAttribute("campus", campus);
        request.getRequestDispatcher("view/student/group.jsp").forward(request, response);
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
