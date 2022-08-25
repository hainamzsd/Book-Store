/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.User;

/**
 *
 * @author Radriar
 */
public class UserDTO {

    private String username;
    private String password;
    private boolean isAdmin;
    private String fullName;
    private String email;

    public UserDTO() {
    }

    public UserDTO(String username, String password, boolean isAdmin, String fullName, String email) {
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.fullName = fullName;
        this.email = email;
    }

    public UserDTO(String username, boolean isAdmin, String fullName) {
        this.username = username;
        this.isAdmin = isAdmin;
        this.fullName = fullName;
    }


    public UserDTO(String username, boolean isAdmin, String fullName, String email) {
        this.username = username;
        this.isAdmin = isAdmin;
        this.fullName = fullName;
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   

}
