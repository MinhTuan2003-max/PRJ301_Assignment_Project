/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import controller.BaseRequiredAuthenticationController;
import dal.MajorDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Major;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("user_id"));
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(userID);

        MajorDBContext mdbc = new MajorDBContext();
        Major majors = mdbc.get(students.getStudent_ID());
        request.setAttribute("students", students);
        request.setAttribute("majors", majors);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/home/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        //processRequest(request, response, loggedAccount);
    }

}
