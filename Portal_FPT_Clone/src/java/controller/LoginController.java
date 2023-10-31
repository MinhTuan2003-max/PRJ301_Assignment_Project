/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author MINH TUAN
 */
@WebServlet(name = "LoginController", urlPatterns = {"login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String campus = request.getParameter("campus");

        int campusStudy = Integer.parseInt(campus);

        AccountDBContext db = new AccountDBContext();
        Account loggedUser = db.get(username, password, campusStudy);

        if (loggedUser == null) {
            String errorMessage = "Tài khoản của bạn không được phép đăng nhập vào hệ thống";
            response.getWriter().println("<script>alert('" + errorMessage + "');"
                    + "window.location.href='login';</script>");
        } else {
            String remember = request.getParameter("remember");
            HttpSession session = request.getSession();
            session.setAttribute("account", loggedUser);
            if (remember != null) {
                Cookie c_user = new Cookie("user", username);
                Cookie c_pass = new Cookie("pass", password);
                c_user.setMaxAge(3600 * 24);
                c_pass.setMaxAge(3600 * 24);
                response.addCookie(c_user);
                response.addCookie(c_pass);
            }
            response.sendRedirect(request.getContextPath() + "/home");

            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
