<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Link Css-->
        <link rel="stylesheet" href="css/login.css" type="text/css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Login</title>
    </head>

    <body>

        
        <!--form login-->
        <div class="main-login">
            <div class="row">
                <div class="col-md-5 left">
                    <h1>Welcome Reader</h1>
                    <p>To keep connected with us please login with your personal info and start reading right now.</p>
                    <a href="register.jsp"><button class="sign-up-btn">Sign up</button></a>
                </div>
                <div class="col-md-7 right">
                    <h1 class="text-center">Login </h1>
                
                    <form name="login-form" action="./login" method="get" style="text-align: center;">
                        <div class="form-group text-center">
                            <input type="email" class="form-control" id="email" style="width: 100vh;margin: auto;" placeholder="Email" name="email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="pwd" style="width: 100vh;margin: auto;" placeholder="Password" name="password">
                        </div>
                        <br>
                        <div class="checkbox-line">
                            <label><input type="checkbox" class="checkbox-prob"> Remember me</label>
                        </div>
                        <p class="text-danger">${requestScope.error}</p>
                        
                        <input class="sign-in-btn" type="submit" value="Sign-in"> 
                    </form>
                </div>
                        
            </div>
        </div>
    </body>

    </html>