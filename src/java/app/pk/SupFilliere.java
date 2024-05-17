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
import java.sql.PreparedStatement;

/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "SupFilliere", urlPatterns = {"/SupFilliere"})
public class SupFilliere extends HttpServlet {

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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = UtilConnection.seConnecter();
            String NomFilliere = request.getParameter("NomFilliere");
            
            PreparedStatement ps = con.prepareStatement("DELETE  FROM filliere WHERE NomFilliere=?");
            ps.setString(1, NomFilliere);
            ps.executeUpdate();
            
            PreparedStatement psEtudiant = con.prepareStatement("UPDATE etudiants SET Fillier = 'Pas Filliere' WHERE Fillier = ?");
            psEtudiant.setString(1, NomFilliere);
            psEtudiant.executeUpdate();
            
            PrintWriter out = response.getWriter();
            
            request.setAttribute("msg", "Filliere Suprimmer Avec Succes");
            request.getRequestDispatcher("/jsp/admin/listeFiliere.jsp").forward(request, response);

        }catch (Exception ex) { 
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage());
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
