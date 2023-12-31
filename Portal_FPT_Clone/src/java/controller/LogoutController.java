/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MINH TUAN
 */
public class LogoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().setAttribute("account", null);
        Cookie c_user = new Cookie("user", null);
        Cookie c_pass = new Cookie("password", null);
        c_user.setMaxAge(-1);
        c_pass.setMaxAge(-1);
        HttpSession session = request.getSession();
        session.removeAttribute("semester_id");
        session.removeAttribute("course_id");
        session.removeAttribute("group_id");
        session.removeAttribute("department_id");
        // Hủy bỏ phiên làm việc (session) của người dùng
        session.invalidate();

        response.addCookie(c_user);
        response.addCookie(c_pass);
        request.getRequestDispatcher("view/authentication/logout.jsp").forward(request, response);
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
