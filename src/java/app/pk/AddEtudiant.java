/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package app.pk;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import app.pk.UtilConnection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "AddEtudiant", urlPatterns = {"/AddEtudiant"})
public class AddEtudiant extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Connection con = UtilConnection.seConnecter();
            int CNE = Integer.parseInt(request.getParameter("CNE"));
            String Nom = request.getParameter("Nom");
            String Prenom = request.getParameter("Prenom");
            String Filliere = request.getParameter("Filliere");
            String Departement = request.getParameter("Departement");
            String Tele = request.getParameter("Tele");
            
           PreparedStatement psFilliere = con.prepareStatement("SELECT * FROM filliere WHERE NomDepartement = ? AND NomFilliere = ?");
            psFilliere.setString(1, Departement);
            psFilliere.setString(2, Filliere);
            ResultSet rsFilliere = psFilliere.executeQuery();
            
            PreparedStatement psCheck = con.prepareStatement("SELECT * FROM etudiants WHERE CNE = ?");
            psCheck.setInt(1, CNE);
            ResultSet rs = psCheck.executeQuery();
        if (rsFilliere.next()){
               
            if (rs.next()) {
                
                request.setAttribute("msg", "Etudiant Est Deja Dans DB");
            request.getRequestDispatcher("/jsp/formAddEtud.jsp").forward(request, response);
               
            }else{
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO etudiants values (?,?,?,?,?,?)");
            ps.setInt(1, CNE);
            ps.setString(2, Nom);
            ps.setString(3, Prenom);
            ps.setString(4, Filliere);
            ps.setString(5, Departement);
            ps.setString(6, Tele);
            ps.executeUpdate();
            
            PrintWriter out = response.getWriter();
            
            request.setAttribute("msg", "Etudiant Ajouter Avec Succes");
            request.getRequestDispatcher("/jsp/admin/listeetudiant.jsp").forward(request, response);
            }
        }else{
                    request.setAttribute("msg", "La filière "+Filliere+" n'appartient pas au département "+Departement);
            request.getRequestDispatcher("/jsp/formAddEtud.jsp").forward(request, response);
                 }
        }catch (Exception ex) { 
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage()); 
        }
    }

}
