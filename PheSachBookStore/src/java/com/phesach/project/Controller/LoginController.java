/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Controller;

import com.phesach.project.Model.User.UserDAO;
import com.phesach.project.Model.User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String action = request.getParameter("action");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);

                // response.sendRedirect("login.jsp");
                if (session != null) {
                    session.invalidate();
                }
            }

            log("Debug user : " + email + " " + password);

            if (email == null && password == null) {

                log("Debug email : Go to login " + email + " " + password);
                url = "login.jsp";
                request.getRequestDispatcher(url).forward(request, response);

            } else {
                log("Debug email : Go to here " + email + " " + password);
                UserDAO userDAO = new UserDAO();
                UserDTO userDTO = userDAO.login(email, password);

                if (userDTO != null) {
                    HttpSession session = request.getSession(true);
                    if (userDTO.isIsAdmin()) {
                        session.setAttribute("adminLogged", userDTO);
                        url = "/admin";
                        response.sendRedirect(url);
                    } else {
                        session.setAttribute("userLogged", userDTO);
                        response.sendRedirect("/user");
                    }

                } else {
                    request.setAttribute("error", "Wrong username or password");
                    url = "login.jsp";
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }

        } catch (Exception ex) {
            System.out.println("");
        } finally {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
