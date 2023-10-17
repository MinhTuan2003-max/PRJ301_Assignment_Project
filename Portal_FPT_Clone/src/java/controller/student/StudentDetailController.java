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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        int a = (int) request.getSession().getAttribute("id");
        StudentDBContext studb = new StudentDBContext();
        ArrayList<Student> students = studb.getStudent(a);
        request.setAttribute("students", students);

        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> campus = camp.search(a);
        request.setAttribute("campus", campus);

        request.getRequestDispatcher("view/detail/userdetail.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount) throws ServletException, IOException {
        processRequest(request, response, loggedAccount);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount) throws ServletException, IOException {
        processRequest(request, response, loggedAccount);
    }

}
