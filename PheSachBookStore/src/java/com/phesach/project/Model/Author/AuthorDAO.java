/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.Author;

import com.phesach.project.Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AuthorDAO {

    public ArrayList<AuthorDTO> getAllAuthor() {
        ArrayList<AuthorDTO> authors = new ArrayList<AuthorDTO>();
        String sql = "SELECT id, name, born, specialization FROM Author";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                authors.add(new AuthorDTO(rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("born"),
                        rs.getString("specialization")));

            }
            return authors;
        } catch (SQLException ex) {
            System.out.println("Query author error");
        }
        return null;
    }
   
}
