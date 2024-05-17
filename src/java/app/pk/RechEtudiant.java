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
import java.sql.Connection;
import java.sql.*;


/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "RechEtudiant", urlPatterns = {"/RechEtudiant"})
public class RechEtudiant extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = UtilConnection.seConnecter();
            String cne = request.getParameter("CNE");
            String nom = request.getParameter("Nom");
            String prenom = request.getParameter("Prenom");
            String telephone = request.getParameter("Tele");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM etudiants WHERE CNE = ? OR Nom = ? OR Prenom = ? OR Telephone = ?");
            ps.setString(1, cne);
            ps.setString(2, nom);
            ps.setString(3, prenom);
            ps.setString(4, telephone);
            
            ResultSet rs = ps.executeQuery();
            
           
           
           
         if (!rs.isBeforeFirst()) {
            request.setAttribute("msg"," Etudiant Non Disponible");
            request.getRequestDispatcher("/jsp/Recherche/RechercheEtud.jsp").forward(request, response);
        } else {
            
            request.setAttribute("resultats", rs);
            request.setAttribute("msg","Etudiant Disponible");
            request.getRequestDispatcher("/jsp/Recherche/resultatsRechercheEtud.jsp").forward(request, response);
        }

        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage());
        }
    }

}
