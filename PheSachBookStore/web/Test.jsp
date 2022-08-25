<%-- 
    Document   : Test
    Created on : Jul 17, 2022, 4:07:15 PM
    Author     : Radriar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
    </head>
    <body>
        <c:set value="${sessionScope.userLogged}" var="user"/>
            <c:choose>
                <c:when test="${not empty user}">
                    <h1>Logged</h1>
                    <br>
                    <h2>${user.isAdmin}</h2>
                    <h2>${user.email}</h2>
                </c:when>
                    <c:otherwise>
                        <h1>Not logged</h1>
                    </c:otherwise>
        
        </c:choose>
        
    </body>
</html>
