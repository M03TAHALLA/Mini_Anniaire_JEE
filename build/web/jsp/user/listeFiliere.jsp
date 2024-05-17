<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="app.pk.UtilConnection" %>
<%
    HttpSession session2 = request.getSession(false);
    if (session2 == null || session2.getAttribute("LoggedIn") == null || !(Boolean) session2.getAttribute("LoggedIn")) {
        response.sendRedirect("/JEEProjet/jsp/Login/loginUser.jsp");
        return;
    }
%>
<html>
<head>
 <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="icon" href="/JEEProjet/images/fevicon.png" type="image/gif" />
  <title>Fillières</title>

  <link rel="stylesheet" type="text/css" href="/JEEProjet/css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link href="/JEEProjet/css/style.css" rel="stylesheet" />
  <link href="/JEEProjet/css/Login/style.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/2.0.2/css/dataTables.bootstrap5.css" rel="stylesheet" />
  <script defer src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
  <script defer src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>
  <script defer src="https://cdn.datatables.net/2.0.2/js/dataTables.bootstrap5.js"></script>
  <script defer src="/JEEProjet/js/script.js"></script>

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
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav  ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/Menu/MenuUtilisation.jsp"><i class="fa fa-calendar"></i> Menu  <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/user/listeetudiant.jsp"><i class="fa fa-user"></i> Liste Étudiants <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/user/listeDepartement.jsp"><i class="fa fa-building"></i> Liste Départements <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="/JEEProjet/jsp/user/listeFiliere.jsp"><i class="fa fa-crosshairs"></i> Liste Filières <span class="sr-only">(current)</span></a>
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
    <%
    Connection con = null;
    ResultSet rs = null;
    try {
        con = UtilConnection.seConnecter();
        Statement statement = con.createStatement();
        rs = statement.executeQuery("SELECT * FROM filliere");
%>


<h2  style="text-align: center ; "> Table Fillières</h2>

    <table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th style="text-align: center ; ">Nom Fillière</th>
                <th  style="text-align: center ; ">Nom Département</th>
            </tr>
        </thead>
        <tbody>
             <%
        while(rs.next()) {
    %>
            <tr>
                 <td  style="text-align: center ; "><%= rs.getString(1) %></td>
                <td  style="text-align: center ; "><%= rs.getString(2) %></td>
            </tr>
            <%
        }
    %>
        </tbody>
        <tfoot>
            <tr>
                <th style="text-align: center ; ">Nom Fillière</th>
                <th  style="text-align: center ; ">Nom Département</th>
            </tr>
        </tfoot>
    </table>
        <%
    } catch (Exception e) {
        out.println("Erreur lors de la récupération des données : " + e.getMessage());
    } finally {
        // Close resources in finally block to ensure they're closed even if an exception occurs
        try {
            if (rs != null) rs.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("Erreur lors de la fermeture des ressources : " + e.getMessage());
        }
    }
%>
</div>
</body>
</html>

</body>
</html>
