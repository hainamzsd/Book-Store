<%-- 
    Document   : bookedit
    Created on : Jul 18, 2022, 3:42:35 PM
    Author     : Radriar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Edit Page</title>
    </head>
    <body>
        <h1>Book Edit Form</h1>
        <form action="admin">
            <c:set value="${requestScope.bookDetails}" var="book"/>
            ISBN: <input type="text" value="${book.isbn}" name="ISBN"> <br>
            Title: <input type="text" value="${book.title}" name="Title"><br>
            Author ID: <input type="text" value="${book.authorID}" name="AuthorID"><br>
            Category : <input type="text" value="${book.category}" name="Category"><br>
            Published Date: <input type="text" value="${book.dateOfPublish}" name="PublishedDate"><br>
            Language: <input type="text" value="${book.language}" name="Language"><br>
            Description: <input type="text" value="${book.description}" name="Description"><br>
            Image Path: <input type="text" value="${book.imgPath}" name="ImgPath"><br>
            Affiliate Link: <input type="text" value="${book.link_Amazon}" name="LinkAmazon"><br>
            Ratings: <input type="text" value="${book.ratings}" name="Ratings"><br>

            <input type="hidden" value="saveEdit" name="action">
            <input type="hidden" value="${book.id}" name="id">
            <input type="submit" value="Save Changes">


        </form>
    </body>
</html>
