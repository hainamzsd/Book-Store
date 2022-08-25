<%-- 
    Document   : review
    Created on : Jul 17, 2022, 6:13:25 PM
    Author     : macha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Review</title>
        <!--Link Css-->
        <link rel="stylesheet" href="css/bookdetails.css" type="text/css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="headerWeb.jspf" %> 
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6" style="text-align: center;">
                    <img src="${requestScope.book.imgPath}" class="img-responsive" style="width: 65vh; margin-left:auto;margin-right: auto;">
                    <button class="writereview"><a href="${requestScope.book.link_Amazon}">View In Amazon</a></button>
                </div>
                <div class="col-md-6 information">
                    <h1>${requestScope.book.title}</h1>
                    <p>${requestScope.author.name}</p>
                    <div class="details">
                        <p>
                        <h2>
                            ${requestScope.book.title} <!--book name here-->
                        </h2>
                        <p> <!--Description here-->
                            ${requestScope.book.description}
                        </p>
                        <h2>
                            About this book
                        </h2>
                        <div class="about">
                            <div>ISBN:${requestScope.book.isbn}</diV>
                            <div>Publication date:${requestScope.book.dateOfPublish}</div>
                            <div>Author:${requestScope.author.name}</div>
                            <div>Language:${requestScope.book.language}</div>
                            <div>Rating:${requestScope.book.ratings}</div>
                        </div>
                        <h2>
                            Review
                        </h2>
                        <div class="about">
                            <p>${requestScope.review.content}</p>
                            
                        </div>
                        </h1>
                        </p>
                    </div>
                </div>
            </div>


        </div>

        <%@include file="footerWeb.html" %>
    </body>
</html>
