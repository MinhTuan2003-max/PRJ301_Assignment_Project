/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MINH TUAN
 */
public abstract class BaseRequiredAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("account");
        if (account != null) {
            return true;
        } else {
            String user = null;
            String password = null;
            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (user != null && password != null) {
                    break;
                }
                if (cooky.equals("user")) {
                    user = cooky.getValue();
                }
                if (cooky.equals("password")) {
                    password = cooky.getValue();
                }
            }

            if (user != null && password != null) {
                AccountDBContext adbc = new AccountDBContext();
                Account param = new Account();
                param.setUsername(user);
                param.setPassword(password);
                account = adbc.get(param);

                if (account != null) {
                    request.getSession().setAttribute("account", account);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doGet(request, response, (Account) request.getSession().getAttribute("account"));
        } else {
            response.sendRedirect("login");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doPost(request, response, (Account) request.getSession().getAttribute("account"));
        } else {
            response.sendRedirect("login");
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
