/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.Book;

import com.phesach.project.Model.Author.AuthorDTO;
import com.phesach.project.Model.ReviewContent.ReviewDTO;
import com.phesach.project.Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Radriar
 */
public class BookDAO {

   
    public ArrayList<BookDTO> getAllBook() {
        String sql = "select id, title, AuthorID, Category, ISBN, "
                + "Ratings, DateOfPublish, Language, Description, Img_path, link_Amazon from Books";
        ArrayList<BookDTO> books = new ArrayList<>();
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(new BookDTO(
                        rs.getLong("id"),
                        rs.getString("title"),
                        rs.getLong("authorID"),
                        rs.getString("category"),
                        rs.getString("isbn"),
                        rs.getLong("ratings"),
                        rs.getDate("dateOfPublish"),
                        rs.getString("language"),
                        rs.getString("Description"),
                        rs.getString("img_path"),
                        rs.getString("link_Amazon")));
            }
            return books;
        } catch (SQLException ex) {
            System.out.println("Query book error!" + ex.getMessage());
        }
        return null;
    }

    public ArrayList<BookDTO> listSummary(String title, String category) {
        String sql = "select id, title, AuthorID, Category, ISBN, "
                + "Ratings, DateOfPublish, Language, Description, Img_path from Books";
        ArrayList<BookDTO> list = new ArrayList<BookDTO>();

        String where = " ";
        String whereJoinWord = " WHERE ";

        if (title != null && !title.trim().isEmpty()) {
            where += whereJoinWord;
            where += " title  LIKE  ?";
            whereJoinWord = " AND ";
        }
        if (category != null && !category.trim().isEmpty()) {
            where += whereJoinWord;
            where += " category  LIKE ? ";
            whereJoinWord = " AND ";
        }
        sql += where;
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            int index = 1;
            if (title != null && !title.trim().isEmpty()) {
                ps.setString(index, "%"+title+"%");
                index++;
            }

            if (category != null && !category.trim().isEmpty()) {
                ps.setString(index, "%"+category+"%");
                index++;
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookDTO(
                        rs.getLong("id"),
                        rs.getString("title"),
                        rs.getLong("authorID"),
                        rs.getString("category"),
                        rs.getString("isbn"),
                        rs.getLong("ratings"),
                        rs.getDate("dateOfPublish"),
                        rs.getString("language"),
                        rs.getString("Description"),
                        rs.getString("img_path")));
            }
            return list;

        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }
    

   
    public BookDTO load(Long id) {

        String sql = "select id, title, AuthorID, Category, ISBN, "
                + "Ratings, DateOfPublish, Language, Description, Img_path, link_Amazon from Books WHERE id = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new BookDTO(
                        rs.getLong("id"),
                        rs.getString("title"),
                        rs.getLong("authorID"),
                        rs.getString("category"),
                        rs.getString("isbn"),
                        rs.getLong("ratings"),
                        rs.getDate("dateOfPublish"),
                        rs.getString("language"),
                        rs.getString("Description"),
                        rs.getString("img_path"),
                        rs.getString("link_Amazon"));
            }
        } catch (SQLException ex) {
            System.out.println("Query book error!" + ex.getMessage());
        }
        return null;
    }

    public boolean updateBookDetails(BookDTO book) {
        String sql = "UPDATE Books "
                + "SET [title]=?, [authorID]=?,  [category]=?, [isbn]=?, [ratings]=?, [dateOfPublish]=?, [language]=?, [description]=?, [img_Path]=? "
                + "WHERE [id]=?";
        
        boolean isUpdated = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setLong(2, book.getAuthorID());
            ps.setString(3, book.getCategory());
            ps.setString(4, book.getIsbn());
            ps.setLong(5, book.getRatings());
            ps.setDate(6, book.getDateOfPublish());
            ps.setString(7, book.getLanguage());
            ps.setString(8, book.getDescription());
            ps.setString(9, book.getImgPath());
            ps.setLong(10, book.getId());
            int rowAffected = ps.executeUpdate();
            if (rowAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException ex) {
            System.out.println("Unable to update book details. " + ex.getMessage());
        }
        return isUpdated;
    }
    
    public AuthorDTO getAuthorDTOFromBook(Long idBook) {
        String sql = "select a.id, a.name, a.born, a.specialization from Author a LEFT JOIN Books b "
                + "ON a.id = b.AuthorID WHERE a.id = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idBook);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new AuthorDTO(rs.getLong("id"), rs.getString("name"), rs.getString("born"), rs.getString("specialization"));

            }
        } catch (SQLException ex) {
            System.out.println("Query author error!" + ex.getMessage());
        }
        return null;
    }

    public ReviewDTO getReviewFromBook(Long idBook) {
        String sql = "select r.ReviewContent\n"
                + "from Review r LEFT JOIN Books b ON r.idBook = b.id\n"
                + "WHERE b.id =?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idBook);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return (new ReviewDTO(rs.getString("ReviewContent")));
            }
        } catch (SQLException ex) {
            System.out.println("Query author error!" + ex.getMessage());
        }
        return null;
    }
    
    public ReviewDTO getCategoryFromBook(Long idBook) {
        String sql = "select r.ReviewContent\n"
                + "from Review r LEFT JOIN Books b ON r.idBook = b.id\n"
                + "WHERE b.id =?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idBook);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return (new ReviewDTO(rs.getString("ReviewContent")));
            }
        } catch (SQLException ex) {
            System.out.println("Query author error!" + ex.getMessage());
        }
        return null;
    }
    
    
    
    
}
