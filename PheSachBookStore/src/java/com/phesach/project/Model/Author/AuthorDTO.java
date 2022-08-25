/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.Author;

/**
 *
 * @author ADMIN
 */
public class AuthorDTO {
    private Long id;
    private String name;
    private String born;
    private String specialization;

    public AuthorDTO() {
    }

    public AuthorDTO(Long id, String name, String born, String specialization) {
        this.id = id;
        this.name = name;
        this.born = born;
        this.specialization = specialization;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBorn() {
        return born;
    }

    public void setBorn(String born) {
        this.born = born;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    
}
