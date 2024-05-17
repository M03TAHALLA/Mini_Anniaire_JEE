<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="app.pk.UtilConnection" %>
<%@page import="javax.servlet.http.*"%>

<%
    HttpSession session2 = request.getSession(false);
    if (session2 == null || session2.getAttribute("LoggedIn") == null || !(Boolean) session2.getAttribute("LoggedIn")) {
        response.sendRedirect("/JEEProjet/jsp/Login/loginAdmin.jsp");
        return;
    }
%>
<html>
<head>
    <title>Ajouter une Filli�re</title>
 <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="icon" href="/JEEProjet/images/fevicon.png" type="image/gif" />
  <title>Filli�re</title>

  <link rel="stylesheet" type="text/css" href="/JEEProjet/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link href="/JEEProjet/css/style.css" rel="stylesheet" />
  <link href="/JEEProjet/css/Login/style.css" rel="stylesheet" />
</head>
<body>
<div class="hero_area">
    <header class="header_section">
        <div class="container-fluid">
             <nav class="navbar navbar-expand-lg custom_nav-container ">
                <a class="navbar-brand" href="/JEEProjet/LogoutServlet">
                    <span>Mini Annuaire</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav  ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/Menu/MenuAdmin.jsp"><i class="fa fa-calendar"></i> Menu  <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/admin/listeetudiant.jsp"><i class="fa fa-user"></i> Liste �tudiants <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/admin/listeDepartement.jsp"><i class="fa fa-building"></i> Liste D�partements <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/admin/listeFiliere.jsp"><i class="fa fa-crosshairs"></i> Liste Fili�res <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                                <a  class="nav-link" ><span style="color: green;font-weight: bolder"><i class="fa fa-user"></i> <%= session.getAttribute("name") %></span> <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                                <a  href="/JEEProjet/LogoutServlet" class="nav-link" ><span style="color: red;font-weight: bolder"><i class="fa fa-sign-out"></i> Log Out </span> <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
<% if(request.getAttribute("msg") != null) { %>
    <p id="success-message" class="success-message" style="margin: 10px 0; padding: 10px; border-radius: 3px; color: #D8000C; background-color: #FFBABA; text-align: center;"><i class="fa fa-times-circle"></i> <%= request.getAttribute("msg") %></p>
<% } %>

<script>
    setTimeout(function() {
        var messageElement = document.getElementById('success-message');
        if (messageElement) {
            messageElement.style.transition = 'opacity 0.5s'; 
            messageElement.style.opacity = '0'; 
            setTimeout(function() {
                messageElement.style.display = 'none'; 
            }, 2000); 
        }
    }, 3000); 
</script>
    <h1>Formulaire d'ajouter Une Filli�re <i class="fa fa-crosshairs"></i>  </h1>
    <div class="container">
        <div class="cta-form">
            <h2 style="font-weight: bold;">Informations : </h2>
            <p>Veuillez saisir toutes les informations n�cessaires</p>
        </div>
        
        <form action="/JEEProjet/AddFillier" method="post" class="form">

            <input type="text" name="NomFillier" placeholder="NomFillier" class="form__input" id="email" />
            <label for="email" class="form__label">NomFilli�re</label>

 <%
                        Connection connexion = null;
                        ResultSet rd = null;

                        try {
                            connexion = UtilConnection.seConnecter();
                            Statement statementrd = connexion.createStatement();
                            rd = statementrd.executeQuery("SELECT DISTINCT NomDepartement FROM departement");


                    %>
                    <label for="NomDepartement " style="margin-bottom: 30px;">Departement :</label>
            <select name="NomDepartement"  style="padding: 10px;">
                <% while(rd.next()) { %>
                <option value="<%= rd.getString(1) %>"><%= rd.getString(1) %></option>
                <% } %>
            </select><br>
                    <% } catch (Exception e) {
                  out.println("Erreur lors de la r�cup�ration des donn�es : " + e.getMessage());
              } finally {
                  try {
                      if (rd != null) rd.close();

                      if (connexion != null) connexion.close();
                  } catch (SQLException e) {
                      out.println("Erreur lors de la fermeture des ressources : " + e.getMessage());
                  }
              } %>
           
             
        
        
            <input class="button-9" type="submit" value="Ajouter">
        </form>
      
    </div>
</div>
</body>
</html>
