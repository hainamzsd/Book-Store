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
import com.phesach.project.Model.ReviewContent.ReviewDAO;
import com.phesach.project.Model.ReviewContent.ReviewDTO;
import com.phesach.project.Model.User.UserDAO;
import com.phesach.project.Model.User.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AdminController extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        UserDTO currentAdmin = null;
        if (session != null) {
            currentAdmin = (UserDTO) session.getAttribute("adminLogged");

        }

        log("Debug: " + currentAdmin);
        if (currentAdmin == null) {
            log("Debug: Redirect to login page" + currentAdmin);
            response.sendRedirect(request.getContextPath() + "login.jsp");
            return;
        } else {
            session.setAttribute("userLogged", currentAdmin);
        }

        try {
            UserDAO userDAO = new UserDAO();
            BookDAO bookDAO = new BookDAO();
            AuthorDAO authorDAO = new AuthorDAO();
            ReviewDAO reviewDAO = new ReviewDAO();
            if (action == null) {

                List<UserDTO> userList = userDAO.getAllUsers();
                request.setAttribute("userList", userList);

                List<BookDTO> bookList = bookDAO.getAllBook();
                request.setAttribute("bookList", bookList);
                
                List<AuthorDTO> authorList = authorDAO.getAllAuthor();
                request.setAttribute("authorList", authorList);
                
                List<ReviewDTO> reviewList = reviewDAO.getAllReviews();
                request.setAttribute("reviewList", reviewList);

                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            } else if (action.equals("deleteUser")) {
                String username = request.getParameter("username");
                userDAO.deleteUser(username);

                List<UserDTO> userList = userDAO.getAllUsers();
                request.setAttribute("userList", userList);

                List<BookDTO> bookList = bookDAO.getAllBook();
                request.setAttribute("bookList", bookList);

                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            } else if (action.equals("editBook")) {
                Long bookID = null;
                try {
                    bookID = Long.parseLong(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    System.out.println("ID field only accept Long data type." + ex.getMessage());
                }
                BookDTO book = null;
                if (bookID != null) {
                    book = bookDAO.load(bookID);
                }

                request.setAttribute("bookDetails", book);
                request.setAttribute("action", "update");
                RequestDispatcher rd = request.getRequestDispatcher("bookedit.jsp");
                rd.forward(request, response);
            } else if (action.equals("saveEdit")) {

                String newTitle = request.getParameter("Title");
                String newISBN = request.getParameter("ISBN");
                String newDescription = request.getParameter("Description");
                Long newAuthorID = Long.parseLong(request.getParameter("AuthorID"));
                String newCategory = request.getParameter("Category");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

                LocalDate preprocessedDate = LocalDate.parse(request.getParameter("PublishedDate"), formatter);
                java.sql.Date newPublishedDate = java.sql.Date.valueOf(preprocessedDate);

                String newLanguage = request.getParameter("Language");
                String newImgPath = request.getParameter("ImgPath");
                Long newRatings = Long.parseLong(request.getParameter("Ratings"));
                String newLinkAmazon = request.getParameter("LinkAmazon");
                Long updatedBookID = Long.parseLong(request.getParameter("id"));
                BookDTO updatedBook = new BookDTO(updatedBookID, newTitle, newAuthorID, newCategory, newISBN, newRatings, newPublishedDate, newLanguage, newDescription, newImgPath, newLinkAmazon);

                bookDAO.updateBookDetails(updatedBook);

                List<UserDTO> userList = userDAO.getAllUsers();
                request.setAttribute("userList", userList);

                List<BookDTO> bookList = bookDAO.getAllBook();
                request.setAttribute("bookList", bookList);

                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            }

        } catch (Exception ex) {
            System.out.println("Unable to retrieve user and book list." + ex.getMessage());
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
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
