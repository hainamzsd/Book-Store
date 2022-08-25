/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.ReviewContent;

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
public class ReviewDAO {

    public List<ReviewDTO> getAllReviews() {
        String sql = "SELECT  [idBook]\n"
                + "      ,[ReviewContent]\n"
                + "  FROM [Review]";
        List<ReviewDTO> list = new ArrayList<>();
        try{Connection conn = DBUtils.getConnection();
        PreparedStatement ps  = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ReviewDTO(rs.getLong("idBook"),rs.getString("ReviewContent")));
            }
            return list;
        }catch (SQLException ex) {
            System.out.println("Unable to retrieve review contents" + ex.getMessage());
        }
        return null;
    }
}
