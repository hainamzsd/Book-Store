<%-- 
    Document   : Review
    Created on : Jul 14, 2022, 12:17:15 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Review</title>
        <!--Link Css-->
        <link rel="stylesheet" href="css/book.css" type="text/css">
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
            <div class="category">Category: 
                <span><a name="" href="user?action=searchCategory&category=Romance">Romance</a></span>
                <span><a name="" href="user?action=searchCategory&category=Adventure">Adventure</a></span>
                <span><a name="" href="user?action=searchCategory&category=Fiction">Fiction</a></span>
                <span><a name="" href="user?action=searchCategory&category=Crime">Crime</a></span>
                <span><a name="" href="user?action=searchCategory&category=Classic">Classic</a></span>
                <span><a name="" href="user?action=searchCategory&category=Mystery">Mystery</a></span>
                <span><a name="" href="user?action=searchCategory&category=Horror">Horror</a></span>
                <span><a name="" href="user?action=searchCategory&category=Thriller">Thriller</a></span>              
            </div>
            <table class="list-table" style="margin-left:auto;margin-right: auto;">
                <c:forEach items="${requestScope.listbook}" var="book"  >
                    <tr>
                        <td class="list-img" style="padding: 2vh;">
                            <a href="?action=bookdetails&id=${book.id}"><img src="${book.imgPath}" class="img-responsive center" style="height: 45vh;width: 20vw;"></a>
                        </td>
                        <td class="list-content-sumary"> 
                            <h3 style="font-weight: bold; color: black;font-family: 'Segoe UI light';"><a href="?action=bookdetails&id=${book.id}">${book.title}</a></h3><br>
                            <p>${book.description}</p>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>

        <%@include file="footerWeb.html" %>
    </body>
</html>
