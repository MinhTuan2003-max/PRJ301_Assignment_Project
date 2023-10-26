/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import dal.AssessmentDBContext;
import dal.CampusDBContext;
import dal.EnrollmentDBContext;
import dal.ScoreDBContext;
import dal.SemesterDBContext;
import dal.StudentDBContext;
import entity.Assessment;
import entity.Campus;
import entity.Enrollment;
import entity.Score;
import entity.Semester;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import util.CalculateScoreTotal;

/**
 *
 * @author MINH TUAN
 */
public class MarkReportController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("user_id"));
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(userID);
        request.setAttribute("students", students);

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(userID);
        request.setAttribute("campus", campus);
        
        CalculateScoreTotal calculateScoreTotal = new CalculateScoreTotal();
        SemesterDBContext sdbc = new SemesterDBContext();
        ArrayList<Semester> semester = sdbc.get();

        EnrollmentDBContext edbc = new EnrollmentDBContext();
        ArrayList<Enrollment> enrollments = edbc.get();

        ScoreDBContext srdbc = new ScoreDBContext();
        ArrayList<Score> scores = srdbc.getScores();

        AssessmentDBContext adbc = new AssessmentDBContext();
        ArrayList<Assessment> assessments = adbc.getAssessments();
        request.setAttribute("semester", semester);
        request.setAttribute("enrollments", enrollments);
        request.setAttribute("assessments", assessments);
        request.setAttribute("scores", scores);
        double gpa = calculateScoreTotal.calculateGPA(scores);
        String status = calculateScoreTotal.checkGPA(gpa);
        request.setAttribute("gpa", gpa);
        request.setAttribute("status", status);
        request.getRequestDispatcher("view/transcript/markreport.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
