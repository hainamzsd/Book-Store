<%-- Document : register Created on : Jul 4, 2022, 4:46:26 PM Author : ADMIN --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <!--Link Css-->
        <link rel="stylesheet" href="css/register.css" type="text/css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="tittle-head">
        </div>
        <div class="row">
            <div class="col-md-12 align-self-center a">
                <div class="main-register" style="margin:auto;margin-top: 18vh;"> 
                    <form class="form-main" action="signup" method="get">  
                        <h1 class="text-center">Register </h1>

                        <div class="form-group">
                            <input type="text" name="fullname" class="input-form form-control " id="text" placeholder="Full Name">
                        </div>
                        <div class="form-group">
                            <input type="text" name="username" class="input-form form-control " id="text" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="input-form form-control" id="email" placeholder="email">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="input-form form-control " id="pwd" placeholder="password">
                        </div>
                        <div class="form-group">
                            <input type="password" name="repassword" class="input-form form-control " id="pwd" placeholder="re-enter password">
                        </div>
                        <p class="text-danger">${msg}</p>
                        <div class="checkbox">
                            <label><input type="checkbox"> Remember me</label>
                        </div>
                        <button class="sign-up-btn">Sign up</button>
                        <p>Already have an account? <a href="login.jsp">Sign in</a></p>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>