<%-- 
    Document   : loginUser
    Created on : 16 mars 2024, 20:39:00
    Author     : TAHALLA MOHAMMED
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUP Utilisateur</title>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Font Icon -->
    <link rel="stylesheet" href="/JEEProjet/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/JEEProjet/css/style2.css">
    <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="icon" href="/JEEProjet/images/fevicon.png" type="image/gif" />
  <title>Acceuil</title>

  <link rel="stylesheet" type="text/css" href="/JEEProjet/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link href="/JEEProjet/css/style.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
       
       
     <header class="header_section">
      <div class="container-fluid">
          <nav style="margin-left: 42%"class="navbar navbar-expand-lg custom_nav-container ">
          <a  class="navbar-brand" href="/JEEProjet/">
              <span style="font-family: Arial, Helvetica, sans-serif">Mini Annuaire</span>
          </a> 
        </nav>
      </div>
    </header>
          <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="/JEEProjet/images/Signup.svg" alt="sing up image"></figure>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign UP </h2>
                        <form action="/JEEProjet/SignUpServlet" method="post">
                            <div class="form-group">
                                <label for="UserName"><i class="fa fa-user"></i></label>
                                <input type="text" name="Username" id="your_name" placeholder="UserName"/>
                            </div>
                             <div class="form-group">
                                <label for="UserName"><i class="material-icons" style="font-size:15px">mail</i></label>
                                <input type="gmail" name="gmail" id="your_name" placeholder="Gmail"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="fa fa-lock"></i></i></label>
                                <input type="password" name="password" id="your_pass" placeholder="Password"/>
                            </div>
                            <div hidden class="form-group">
                                <label for="your_pass"><i class="fa fa-lock"></i></i></label>
                                <input type="password" name="role" value="Utilisateur" id="your_pass" placeholder="Password"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="SingUp"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    </body>
</html>
