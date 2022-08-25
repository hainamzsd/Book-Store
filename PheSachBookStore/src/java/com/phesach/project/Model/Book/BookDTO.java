/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.phesach.project.Model.Book;

import java.sql.Date;

/**
 *
 * @author Radriar
 */
public class BookDTO {
    private Long id;
    private String title;
    private Long authorID;
    private String category;
    private String isbn;
    private Long ratings;
    private Date dateOfPublish ;
    private String language;
    private String description;
    private String imgPath;
    private String link_Amazon;
    
    public BookDTO() {
    }

    public BookDTO(String title, Long authorID, String category, String isbn, Long ratings, Date dateOfPublish, String language, String description, String imgPath, String link_Amazon) {
        this.title = title;
        this.authorID = authorID;
        this.category = category;
        this.isbn = isbn;
        this.ratings = ratings;
        this.dateOfPublish = dateOfPublish;
        this.language = language;
        this.description = description;
        this.imgPath = imgPath;
        this.link_Amazon = link_Amazon;
    }
    

    public BookDTO(Long id, String title, Long authorID, String category, String isbn, Long ratings, Date dateOfPublish, String language, String description, String imgPath, String link_Amazon) {
        this.id = id;
        this.title = title;
        this.authorID = authorID;
        this.category = category;
        this.isbn = isbn;
        this.ratings = ratings;
        this.dateOfPublish = dateOfPublish;
        this.language = language;
        this.description = description;
        this.imgPath = imgPath;
        this.link_Amazon = link_Amazon;
    }
    
    public BookDTO(Long id, String title, Long authorID, String category, String isbn, Long ratings, Date dateOfPublish, String language, String description, String imgPath) {
        this.id = id;
        this.title = title;
        this.authorID = authorID;
        this.category = category;
        this.isbn = isbn;
        this.ratings = ratings;
        this.dateOfPublish = dateOfPublish;
        this.language = language;
        this.description = description;
        this.imgPath = imgPath;
    }

    public BookDTO(String title, String description, String imgPath) {
        this.title = title;
        this.description = description;
        this.imgPath = imgPath;
    }

    public BookDTO(Long id, String title, String description, String imgPath) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imgPath = imgPath;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getAuthorID() {
        return authorID;
    }

    public void setAuthorID(Long authorID) {
        this.authorID = authorID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Long getRatings() {
        return ratings;
    }

    public void setRatings(Long ratings) {
        this.ratings = ratings;
    }

    public Date getDateOfPublish() {
        return dateOfPublish;
    }

    public void setDateOfPublish(Date dateOfPublish) {
        this.dateOfPublish = dateOfPublish;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getLink_Amazon() {
        return link_Amazon;
    }

    public void setLink_Amazon(String link_Amazon) {
        this.link_Amazon = link_Amazon;
    }

    @Override
    public String toString() {
        return "BookDTO{" + "id=" + id + ", title=" + title + ", authorID=" + authorID + ", category=" + category + ", isbn=" + isbn + ", ratings=" + ratings + ", dateOfPublish=" + dateOfPublish + ", language=" + language + ", description=" + description + ", imgPath=" + imgPath + ", link_Amazon=" + link_Amazon + '}';
    }

   

}
