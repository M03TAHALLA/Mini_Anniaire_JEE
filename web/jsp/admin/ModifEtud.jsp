<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement" %>
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
    <title>Modifier un étudiant</title>
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
                            <a class="nav-link" href="/JEEProjet/jsp/admin/listeetudiant.jsp"><i class="fa fa-user"></i> Liste Étudiants <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/admin/listeDepartement.jsp"><i class="fa fa-building"></i> Liste Départements <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/admin/listeFiliere.jsp"><i class="fa fa-crosshairs"></i> Liste Filières <span class="sr-only">(current)</span></a>
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

<h1>Formulaire d'étudiant <i class="fa fa-user"></i></h1>
<div class="container">
     <%
    Connection con = null;
    ResultSet rs = null;

    try {
        con = UtilConnection.seConnecter();
        PreparedStatement ps1 = con.prepareStatement("SELECT * FROM etudiants WHERE CNE = ?");
        int CNE = Integer.parseInt(request.getParameter("CNE"));
        ps1.setInt(1, CNE);
        rs = ps1.executeQuery();
        
        if(rs.next()) {
    %>
    <div class="cta-form">
        <h2 style="font-weight: bold;">Modifier :</h2>
        <p>Modifier les Donnees de Etudiant : <br><span style="font-weight: bold"><%= rs.getString(2) %> <%= rs.getString(3) %></span></p>
    </div>

   
        <form action="/JEEProjet/ModifEtud" method="post" class="form">
            <input hidden  type="number" name="CNEold" value="<%= rs.getInt(1) %>" placeholder="CNE" class="form__input" id="name" />
            
            <input type="number" name="CNE" value="<%= rs.getInt(1) %>" placeholder="CNE" class="form__input" id="name" />
            <label for="name" class="form__label">CNE</label>

            <input type="text" value="<%= rs.getString(2) %>" name="Nom" placeholder="Nom" class="form__input" id="email" />
            <label for="email" class="form__label">Nom</label>

            <input type="text"value="<%= rs.getString(3) %>" name="Prenom" placeholder="Prénom" class="form__input" id="subject" />
            <label for="subject" class="form__label">Prénom</label>

            <input type="text" value="<%= rs.getString(6) %>" name="Tele" placeholder="Téléphone" class="form__input" id="subject" />
            <label for="subject"  class="form__label">Téléphone</label>

            <label for="NomDepartement" style="margin-bottom: 30px;">Département :</label>
            <select name="Departement" style="padding: 10px;">
            <option value="<%= rs.getString(5) %>" selected><%= rs.getString(5) %></option>
            <%
            Statement statementrd = con.createStatement();
            ResultSet rd = statementrd.executeQuery("SELECT DISTINCT NomDepartement FROM departement");
            while(rd.next()) {
            %>
            <option value="<%= rd.getString(1) %>"><%= rd.getString(1) %></option>
            <%
            }
            rd.close();
            %>
        </select><br>

            <label for="NomFilliere" style="margin-right: 40px;">Filière :</label>
            <select  name="Filliere" style="padding: 10px;">
                <option value="<%= rs.getString(4) %>" selected><%= rs.getString(4) %></option>
                <%
                Statement statement = con.createStatement();
                ResultSet result = statement.executeQuery("SELECT DISTINCT NomFilliere FROM filliere");
                while(result.next()) {
                %>
                <option  value="<%= result.getString(1) %>"><%= result.getString(1) %></option>
                <%
                }
                result.close();
                %>
            </select>
        
            <input class="button-9" type="submit" value="Modifier">
        </form>
    <%
        }
    } catch (Exception e) {
        out.println("Erreur lors de la récupération des données : " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("Erreur lors de la fermeture des ressources : " + e.getMessage());
        }
    }
    %>
    </div>
</div>
</body>
</html>
