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
import java.sql.ResultSet;

/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "RechFilliere", urlPatterns = {"/RechFilliere"})
public class RechFilliere extends HttpServlet {

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
            
            String NomFillier = request.getParameter("NomFillier");
            
            
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM filliere WHERE NomFilliere = ?");
           
            ps.setString(1, NomFillier);
          
            
            ResultSet rs = ps.executeQuery();
            
           if (!rs.isBeforeFirst()) {
    request.setAttribute("msg", "Fillière Non Disponible");
    request.getRequestDispatcher("/jsp/Recherche/RechercheFill.jsp").forward(request, response);
} else {
    request.setAttribute("resultats", rs);
    request.setAttribute("msg", "Fillière Disponible");
    request.getRequestDispatcher("/jsp/Recherche/resultatsRechercheFill.jsp").forward(request, response);
}

        }catch (Exception ex) { 
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage());
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
