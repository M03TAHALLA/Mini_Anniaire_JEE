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

/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "RechDepartement", urlPatterns = {"/RechDepartement"})
public class RechDepartement extends HttpServlet {

    
   

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
            
            String NomDepartement = request.getParameter("NomDepartement");
           
            PreparedStatement ps = con.prepareStatement("SELECT * FROM departement WHERE NomDepartement=?");
            
            ps.setString(1, NomDepartement);
            
            
            
            
            
           
            ResultSet rs = ps.executeQuery();
            
            if (!rs.isBeforeFirst()) {
    request.setAttribute("msg", "Departement Non Disponible");
    request.getRequestDispatcher("/jsp/Recherche/RechercheDep.jsp").forward(request, response);
} else {
    request.setAttribute("resultats", rs);
    request.setAttribute("msg", "Departement Disponible");
    request.getRequestDispatcher("/jsp/Recherche/resultatsRechercheDep.jsp").forward(request, response);
}
            
        

        }catch (Exception ex) { 
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage()); // Print the exception message
        }
    }
    

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
