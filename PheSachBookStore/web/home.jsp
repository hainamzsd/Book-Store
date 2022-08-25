<%@page import="java.util.ArrayList"%>
<%@page import="com.phesach.project.Model.Book.BookDTO"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Link Css-->
        <link rel="stylesheet" href="css/main.css" type="text/css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <!--Link Icon google-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

    </head>
    <body style="background-color: white;  ">
        <%@include file="headerWeb.jspf" %>   
        <div class="main-menu">
            <img class="img-responsive" src="img/hinh-anh-cuon-sach-dep-24.jpg" alt="image header"> <!--img-responsive for multi device-->
            <h1 class="header-text">Phê Sách</h1>

        </div>
        <div class="text-center"><h2>Welcome,<c:choose>
                    <c:when test="${not empty sessionScope.adminLogged.username}"> 
                        ${sessionScope.adminLogged.username}
                    </c:when>
                    <c:otherwise>${sessionScope.userLogged.username}</c:otherwise>
                </c:choose>
            </h2>
        </div>
        <table>

        </table>

        <div class="container-fluid">
            <div class="text-slider">
                <h2>Popular Book</h2>
                <a href="?action=booklist" class="more-popular-book">See more</a>
                <div class="row justify-content-md-center three-img">
                    <c:forEach items="${requestScope.listSumary}" var="book" begin="1" end="3" >
                        <div class="col-md-3 border-popular" style="width: 26%;">
                            <img src="${book.imgPath}" class="img-responsive center" style="height: 50vh;width: 16vw;">
                            <h2>${book.title}</h2>
                            <div class="book-format"></div>
                            <form action="./user" method="POST">
                                <input name="action" value="bookdetails" type="hidden">
                                <input name="id" value="${book.id}" type="hidden">
                                <input class="button" type="submit" value="Read">
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="text-slider">
                <h2>Recommended Book</h2>
                <a href="?action=booklist" class="more-popular-book">See more</a>
                <div class="row four-img" style="margin-left:auto;margin-right: auto;">
                    <c:forEach items="${requestScope.listSumary}" var="book" begin="4" end="7" >
                        <div class="col-md-2 recommend-border" style="width:22.666667%">
                            <img src="${book.imgPath}" class="img-responsive center" style="height: 45vh;width: 20vw;">
                            <h3 style="font-weight: bold; color: white">${book.title}</h3>
                            <div class="book-format"></div>
                            <!--button class="button">Read</button-->
                            <form action="./user" method="POST">
                                <input name="action" value="bookdetails" type="hidden">
                                <input name="id" value="${book.id}" type="hidden">
                                <input class="button" type="submit" value="Read">
                            </form>
                        </div>
                    </c:forEach>
                </div>
                <br>
            </div>
        </div>


        <%@include file="footerWeb.html" %>
    </body>
</html>
