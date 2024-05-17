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
@WebServlet(name = "SupDepartement", urlPatterns = {"/SupDepartement"})
public class SupDepartement extends HttpServlet {

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
            String nomDepartement = request.getParameter("NomDepartement");

            PreparedStatement psEtudiant = con.prepareStatement("UPDATE etudiants SET Departement = 'Pas Departement',Fillier = 'Pas Filliere' WHERE Departement = ?");
            psEtudiant.setString(1, nomDepartement);
            psEtudiant.executeUpdate();
           

            PreparedStatement psFilliere = con.prepareStatement("DELETE FROM filliere WHERE NomDepartement = ?");
            psFilliere.setString(1, nomDepartement);
            psFilliere.executeUpdate();
            
            PreparedStatement psDepartement = con.prepareStatement("DELETE FROM departement WHERE NomDepartement = ?");
            psDepartement.setString(1, nomDepartement);
            psDepartement.executeUpdate();

            PrintWriter out = response.getWriter();
            request.setAttribute("msg", "Département supprimé avec succès");
            request.getRequestDispatcher("/jsp/admin/listeDepartement.jsp").forward(request, response);

        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for deleting a Departement and updating related etudiant records";
    }



}
