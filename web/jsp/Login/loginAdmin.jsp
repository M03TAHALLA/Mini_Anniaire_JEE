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
        <title>Login Admin</title>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/JEEProjet/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="/JEEProjet/css/style2.css">
    <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="icon" href="/JEEProjet/images/fevicon.png" type="image/gif" />

  <link rel="stylesheet" type="text/css" href="/JEEProjet/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link href="/JEEProjet/css/style.css" rel="stylesheet" />
    
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
         
       <% if(request.getAttribute("msg")!= null){ %>
        <p id="success-message" class="success-message" style="margin: 10px 0; padding: 10px; border-radius: 3px; color: #D8000C; background-color: #FFBABA; text-align: center;"><i class="fa fa-times-circle"></i> <%= request.getAttribute("msg") %></p>
    <% } %>
    
    
         <script>
    setTimeout(function() {
        var messageElement = document.getElementById('success-message');
        if (messageElement) {
            messageElement.style.transition = 'opacity 0.8s'; 
            messageElement.style.opacity = '0'; 
            setTimeout(function() {
                messageElement.style.display = 'none'; 
            }, 2000); 
        }
    }, 3000); 
</script>
          <div class="main">
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="/JEEProjet/images/signin-image.png" alt="sing up image"></figure>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Login <span style="color:red">admin</span></h2>
                        <form action="/JEEProjet/LoginAdminServlet" method="post">
                            <div class="form-group">
                                <label for="UserName"><i class="fa fa-user"></i></label>
                                <input type="text" name="Username" id="your_name" placeholder="AdminName"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="fa fa-lock"></i></i></label>
                                <input type="password" name="password" id="your_pass" placeholder="Password"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>
    </div>

    </body>
</html>
