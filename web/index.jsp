<%-- 
    Document   : index
    Created on : Apr 12, 2017, 11:42:30 AM
    Author     : edwin < edwinkun at gmail dot com >
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login ke Aplikasi</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/app.css" rel="stylesheet" type="text/css" />
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0; 
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <form class="form-signin" method="POST" action="/JWP01-UAS/ActionServlet">       
                
                <% if(request.getParameter("error") != null && request.getParameter("error").equals("fail")) { %>
                <h4 class="form-signin-heading" style="color: red;">Username dan Password Salah</h4>
                <% } %>

                <% if(request.getParameter("error") != null && request.getParameter("error").equals("login")) { %>
                <h4 class="form-signin-heading" style="color: red;">Harap Login Terlebih Dahulu</h4>
                <% } %>
                
                <h2 class="form-signin-heading">Please login</h2> <br />
                <input type="text" class="form-control" name="username" placeholder="Username Anda" required="" autofocus="" /> 
                <input type="password" class="form-control" name="password" placeholder="Password Anda" required=""/> 
                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
            </form>
        </div>
        
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
    </body>
</html>
