/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.User;

import com.phesach.project.Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Radriar
 */
public class UserDAO {

    public UserDTO login(String email, String password) {
        String sql = "select username,email,fullname, password, isAdmin from [User] where email= ? and password = ? ";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO userDTO = new UserDTO(rs.getString("username"), rs.getBoolean("isAdmin"), rs.getString("fullname"));
                return userDTO;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }
    
    public UserDTO getUserByUsername(String username){
        String sql = "select username,email,fullname, password, isAdmin from [User] where username= ? ";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, username);

            rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO userDTO = new UserDTO(rs.getString("username"), rs.getString("password"),rs.getBoolean("isAdmin"), rs.getString("fullname"),rs.getString("email"));
                return userDTO;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }
    
   
    
     public boolean updateUser(UserDTO user){
        String sql = "UPDATE [User] SET username = ? , password = ?, fullname = ? WHERE email = ?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getEmail());
            if (ps.executeUpdate() > 0)
                return true;
            else
                return false;
        }catch(SQLException ex){
            System.out.println("Update user error" + ex);
        }
        return false;
    }
    
    
    public UserDTO checkUserExist(String email) {
        String sql = "select * from [User] where email = ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, email);

            rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO userDTO = new UserDTO(rs.getString("username"), rs.getBoolean("isAdmin"), rs.getString("fullname"));
                return userDTO;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }

    public boolean register(UserDTO user) {
        String sql = "INSERT INTO [User]( username, password, isAdmin, fullname, email)  VALUES (? ,? ,? ,?,?)"; //id identity(1,1)
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {

            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setBoolean(3, false);
            ps.setString(4, user.getFullName());
            ps.setString(5, user.getEmail());
            ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            System.out.println("Insert Student error!" + ex.getMessage());
        }
        return false;
    }

    public List<UserDTO> getAllUsers() {
        String sql = "SELECT username, isAdmin, fullName, email FROM [User]";
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new UserDTO(rs.getString("username"), rs.getBoolean("isAdmin"), rs.getString("fullName"), rs.getString("email")));
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("Unable to retrieve user list. " + ex.getMessage());
        }
        return null;
    }


    public boolean deleteUser(String username) {
        String sql = "DELETE FROM [User] WHERE username=?";
        Connection conn = null;
        PreparedStatement ps = null;
        boolean isUpdated = false;
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException ex) {
            System.out.println("Unable to delete user. " + ex.getMessage());
        }
        return isUpdated;

    }
    
    

}
