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
@WebServlet(name = "ModifEtud", urlPatterns = {"/ModifEtud"})
public class ModifEtud extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            Connection con = UtilConnection.seConnecter();
            int oldCNE = Integer.parseInt(request.getParameter("CNEold"));
            int newCNE = Integer.parseInt(request.getParameter("CNE"));
            String Nom = request.getParameter("Nom");
            String Prenom = request.getParameter("Prenom");
            String Filliere = request.getParameter("Filliere");
            String Departement = request.getParameter("Departement");
            String Tele = request.getParameter("Tele");
            
            PreparedStatement ps = con.prepareStatement("UPDATE etudiants SET CNE=?,Nom=?, Prenom=?, Fillier=?, Departement=?, Telephone=? WHERE CNE=?");
            ps.setInt(1, newCNE);
            ps.setString(2, Nom);
            ps.setString(3, Prenom);
            ps.setString(4, Filliere);
            ps.setString(5, Departement);
            ps.setString(6, Tele);
            ps.setInt(7, oldCNE);   
            ps.executeUpdate();
            
            PrintWriter out = response.getWriter();
            
            request.setAttribute("msg", "Etudiant Modifier Avec Succes");
            request.getRequestDispatcher("/jsp/admin/listeetudiant.jsp").forward(request, response);

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
   

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
