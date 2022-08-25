/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Controller;

import com.phesach.project.Model.Author.AuthorDAO;
import com.phesach.project.Model.Author.AuthorDTO;
import com.phesach.project.Model.Book.BookDAO;
import com.phesach.project.Model.Book.BookDTO;
import com.phesach.project.Model.ReviewContent.ReviewDTO;
import com.phesach.project.Model.User.UserDAO;
import com.phesach.project.Model.User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class UserController extends HttpServlet {

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
        String action = request.getParameter("action");
        String tittle = request.getParameter("tittle");

        HttpSession session = request.getSession(false);
        UserDAO userDao = new UserDAO();
        UserDTO currentUser = null;
        UserDTO currentAdmin = null;
        if (session != null) {
            currentUser = (UserDTO) session.getAttribute("userLogged");
        }

        log("Debug: " + currentUser);
        if (currentUser == null) {
            log("Debug: Redirect to login page" + currentUser);
            response.sendRedirect(request.getContextPath() + "login.jsp");
            return;
        }

        BookDAO bookDao = new BookDAO();
        AuthorDAO authorDAO = new AuthorDAO();
        if (action == null || action.equals("home")) {
            ArrayList<BookDTO> list = bookDao.listSummary(null, null);
            request.setAttribute("listSumary", list);
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
        } else if (action.equals("booklist")) {//khong dung listSummary vi khong lay duoc id
            ArrayList<BookDTO> listBook = bookDao.getAllBook();
            request.setAttribute("listbook", listBook);
            RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
            rd.forward(request, response);
        } else if (action.equals("bookdetails")) {
            Long bookid = null;
            try {
                bookid = Long.parseLong(request.getParameter("id"));
            } catch (NumberFormatException ex) {

            }
            ReviewDTO review = null;
            BookDTO book = null;
            AuthorDTO author = null;

            if (bookid != null) {
                book = bookDao.load(bookid);
                author = bookDao.getAuthorDTOFromBook(bookid);
                review = bookDao.getReviewFromBook(bookid);
            }

            request.setAttribute("review", review);
            request.setAttribute("author", author);
            request.setAttribute("book", book);
            RequestDispatcher rd = request.getRequestDispatcher("bookdetails.jsp");
            rd.forward(request, response);
        } else if (action.equals("booksearch")) {
            String title = request.getParameter("title");

            ArrayList<BookDTO> listBook = bookDao.listSummary(title, null);
            request.setAttribute("listbook", listBook);

            RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
            rd.forward(request, response);
        } else if (action.equals("searchCategory")) {
            String category = request.getParameter("category");
            ArrayList<BookDTO> listBook = bookDao.listSummary(null, category);
            request.setAttribute("listbook", listBook);

            RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
            rd.forward(request, response);

        } else if (action.equals("writereview")) {
            Long id = null;
            try {
                id = Long.parseLong(request.getParameter("id"));
            } catch (NumberFormatException ex) {

            }
            BookDTO book = null;
            if (id != null) {
                book = bookDao.load(id);
            }
            request.setAttribute("book", book);
            RequestDispatcher rd = request.getRequestDispatcher("writereview.jsp");
            rd.forward(request, response);
        } else if (action.equals("useredit")) {
            UserDTO user = userDao.getUserByUsername(currentUser.getUsername());
            request.setAttribute("user", user);
            RequestDispatcher rd = request.getRequestDispatcher("useredit.jsp");
            rd.forward(request, response);
        } else if (action.equals("updateUser")) {
            UserDTO user = userDao.getUserByUsername(currentUser.getUsername());
            String newUsername = request.getParameter("newUsername");
            String newPassword = request.getParameter("newPassword");
            String newFullname = request.getParameter("newFullname");
            if (!newUsername.isEmpty()) {
                user.setUsername(newUsername);
            }
            if (!newPassword.isEmpty()) {
                user.setPassword(newPassword);

            }
            if (!newFullname.isEmpty()) {
                user.setFullName(newFullname);
            }
          
            userDao.updateUser(user);
            request.setAttribute("user", user);
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
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
