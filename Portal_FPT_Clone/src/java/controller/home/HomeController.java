/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import controller.BaseRequiredAuthenticationController;
import dal.StudentDBContext;
import entity.Account;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());

        request.setAttribute("students", students);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/home/home.jsp").forward(request, response);
        HttpSession session = request.getSession();
        session.removeAttribute("semester_id");
        session.removeAttribute("course_id");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        //processRequest(request, response, loggedAccount);
    }

}
