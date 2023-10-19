/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.BaseRequiredAuthenticationController;
import dal.CampusDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Campus;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author MINH TUAN
 */
public class StudentDetailController extends BaseRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param loggedAccount
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("user_id"));
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(userID);
        request.setAttribute("students", students);

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(userID);
        request.setAttribute("campus", campus);
        request.getRequestDispatcher("view/detail/userdetail.jsp").forward(request, response);

        HttpSession session = request.getSession(false); // Don't create a new session if it doesn't exist
        if (session == null || session.getAttribute("loggedAccount") == null) {
            // Session is expired or the user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("view/home/home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount) throws ServletException, IOException {
        processRequest(request, response);
    }

}
