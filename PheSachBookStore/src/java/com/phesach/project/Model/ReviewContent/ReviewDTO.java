/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.ReviewContent;

/**
 *
 * @author ADMIN
 */
public class ReviewDTO {

    private Long id;
    private String content;

    public ReviewDTO(String content) {
        this.content = content;
    }

    public ReviewDTO(Long id, String content) {
        this.id = id;
        this.content = content;
    }

    public ReviewDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
