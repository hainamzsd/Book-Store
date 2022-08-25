<%-- Document : register Created on : Jul 4, 2022, 4:46:26 PM Author : ADMIN --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Edit</title>
        <!--Link Css-->
        <link rel="stylesheet" href="css/useredit.css" type="text/css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!-- Font awesome -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- JavaScript-->
        <script src="./javascript/useredit.js"></script>
    </head>

    <body>
        <%@include file="headerWeb.jspf" %>   
        <div class="tittle-head">
        </div>
        <div class="row">
            <div class="col-md-12 align-self-center">
                <div class="main-user" style="margin:auto;margin-top: 18vh;">
                    <div style="font-size: 4vh;">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <div>Username: ${requestScope.user.username}</div>
                        <div type="password">Password: ${requestScope.user.password}</div>
                        <div>Full name: ${requestScope.user.fullName}</div>
                        <div>Email: ${requestScope.user.email}</div>
                        <button class="edit" onclick="showForm()" id="btn">Edit</button>
                        <form id="a" action="user" style="display: none;" method="GET">
                            <input name="action" values="updateUser" type="hidden" value="updateUser">
                            <input name="action" values="updateUser" type="hidden" value="updateUser">
                            <div>New Username: <input type="text" name="newUsername" style="border-radius: 10px;"></div>
                            <div>New Password: <input type="password" name="newPassword" style="border-radius: 10px;"></div>
                            <div>New Full Name: <input type="text" name="newFullname" style="border-radius: 10px;"></div>
                            <button class="edit">Change</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footerWeb.html" %>
    </body>

</html>