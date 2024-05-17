<%-- 
    Document   : MenuAdmin
    Created on : 16 mars 2024, 21:03:09
    Author     : TAHALLA MOHAMMED
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession session2 = request.getSession(false);
    if (session2 == null || session2.getAttribute("LoggedIn") == null || !(Boolean) session2.getAttribute("LoggedIn")) {
        response.sendRedirect("/JEEProjet/jsp/Login/loginUser.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Utilisateur</title>
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
        <div class="hero_area">
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="/JEEProjet/">
            <span>Mini Annuaire</span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

           <ul class="navbar-nav  ml-auto">
               <li class="nav-item active">
                                <a  class="nav-link" ><span style="color: green;font-weight: bolder"><i class="fa fa-user"></i> <%= session.getAttribute("name") %></span> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                                <a  href="/JEEProjet/LogoutServlet" class="nav-link" ><span style="color: red;font-weight: bolder"><i class="fa fa-sign-out"></i> Log Out </span> <span class="sr-only">(current)</span></a>
                </li>
           </ul>
        </nav>
      </div>
    </header>

    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-6">
                  <div class="detail-box">
                    <h1>
                      Menu Utilisateur <br>
                    </h1>
                    <div class="btn-box">
                      <a href="/JEEProjet/jsp/user/listeetudiant.jsp" class="btn-2">
                        Liste complète des étudiants 
                        <i class="fa fa-user"></i>
                      </a>
                        <a  href="/JEEProjet/jsp/Recherche/RechercheEtud.jsp" class="btn-2">
                        Recherche d’un étudiant 
                        <i class="fa fa-search"></i>
                      </a>
                        <a href="/JEEProjet/jsp/user/listeDepartement.jsp" class="btn-2">
                        Liste complète des départements 
                        <i class="fa fa-building"></i>
                        </a>
                         <a href="/JEEProjet/jsp/Recherche/RechercheDep.jsp" class="btn-2">
                        Recherche d’un département
                        <i class="fa fa-search"></i>
                         </a>
                        <a href="/JEEProjet/jsp/user/listeFiliere.jsp" class="btn-2">
                        Liste complète des filières
                        <i class="fa fa-crosshairs"></i>
                        </a>
                         <a href="/JEEProjet/jsp/Recherche/RechercheFill.jsp" class="btn-2">
                        Recherche d’une filière
                        <i class="fa fa-search"></i>
                        </a>
                    </div>
                  </div>
                </div> 
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </section>

  </div>
    </body>
</html>
