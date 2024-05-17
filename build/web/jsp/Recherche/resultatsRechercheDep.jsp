<%@ page import="java.sql.Connection, java.sql.*, java.sql.ResultSet, java.sql.SQLException" %>
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
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="icon" href="/JEEProjet/images/fevicon.png" type="image/gif" />
  <title>Departements</title>

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
<h2 style="text-align: center;">Departement<i class="fa fa-crosshairs"></i></h2>

<% if(request.getAttribute("msg") != null) { %>
    <p id="success-message" class="success-message" style="margin: 10px 0; padding: 10px; border-radius: 3px; color: #270; background-color: #DFF2BF; text-align: center;"><%= request.getAttribute("msg") %></p>
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

    <table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th  style="text-align: center ; ">Nom Département</th>
                <th  style="text-align: center ; ">Fillieres</th>
            </tr>
        </thead>
        <tbody>
              <% ResultSet rs = (ResultSet)request.getAttribute("resultats");
                 
                    
                
        try {
            while (rs.next()) { %>
            <tr>
                <td  style="text-align: center ; "><%= rs.getString("NomDepartement") %></td>
                <%
                    String NomDepartement = rs.getString("NomDepartement");
                    Connection con = UtilConnection.seConnecter();
                    PreparedStatement psFiliere = con.prepareStatement("SELECT COUNT(*) AS row_count FROM filliere WHERE NomDepartement=?");
                    psFiliere.setString(1, NomDepartement);
                    ResultSet rsFiliere = psFiliere.executeQuery();
                    int count = 0;
                    if (rsFiliere.next()) {
                        count = rsFiliere.getInt("row_count");
                    }
                %>
                <td style="text-align: center;background-color: #04AA6D;cursor: pointer; /* Green */border: none;color: white;padding: 10px 32px;font-size: 16px;"><a style="width: 100% ;text-decoration: none;" href="/JEEProjet/jsp/Recherche/RechFillParDep.jsp?NomDepartement=<%= rs.getString(1) %>"><span style="font-weight: bold ;text-decoration: none; color:white">Fillieres (<%= count %>) </span></a></td>

            </tr>
            <%
        }
    %>
        </tbody>
        <tfoot>
            <tr>
                <th  style="text-align: center ; ">Nom Département</th>
            </tr>
        </tfoot>
    </table>
     <% 
        } catch (SQLException e) {
            e.printStackTrace();
        } %>
</div>
</body>
</html>

</body>
</html>
