<%-- 
    Document   : admin
    Created on : Jul 16, 2022, 6:58:15 PM
    Author     : macha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <a href="/user">Home For User</a>
        <h1>Hello ${sessionScope.adminLogged.username}</h1>
        <br>
        <table border="1" cellpadding="2">
            <caption><h2>Account List</h2></caption>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Full Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.userList}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.fullName}</td>
                        <td>
                            <form action="admin">
                                <input type="hidden" value="deleteUser" name="action">
                                <input type="hidden" value="${user.username}" name="username">
                                <input type="submit" value="Delete">
                            </form>                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <table border="1" >
            <caption><h2>Book List</h2></caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Publish Date</th>
                    <th>Language</th>
                    <th>Category</th>
                    <th>Ratings</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.bookList}" var="book">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.isbn}</td>
                        <td>${book.title}</td>
                        <td>${book.dateOfPublish}</td>
                        <td>${book.language}</td>
                        <td>${book.category}</td>
                        <td>${book.ratings}</td>
                        <td>
                            <form action="admin">
                                <input type="hidden" value="editBook" name="action">
                                <input type="hidden" value="${book.id}" name="id">
                                <input type="submit" value="Edit">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <table border="1">
            <thead>
            <caption><h2>Author List</h2></caption>
                <tr>
                    <th>Author ID</th>
                    <th>Name</th>
                    <th>Birthplace</th>
                    <th>Specialization</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.authorList}" var="author">
                <tr>
                    <td>${author.id}</td>
                    <td>${author.name}</td>
                    <td>${author.born}</td>
                    <td>${author.specialization}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <table border="1">
            <caption><h2>Review List</h2></caption>
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Review Content</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.reviewList}" var="review">
                <tr>
                    <td>${review.id}</td>
                    <td>${review.content}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>


    </body>
</html>
