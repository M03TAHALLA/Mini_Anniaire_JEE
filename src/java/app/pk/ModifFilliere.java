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
@WebServlet(name = "ModifFilliere", urlPatterns = {"/ModifFilliere"})
public class ModifFilliere extends HttpServlet {

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
    **/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = UtilConnection.seConnecter();
            
            String NomFillier = request.getParameter("NomFilliernew");
            String NomFillierold = request.getParameter("NomFillierold");
            String NomDepartement = request.getParameter("NomDepartement");
            
            
            PreparedStatement ps = con.prepareStatement("UPDATE filliere SET NomFilliere=?,NomDepartement=? WHERE NomFilliere=?");
           
            ps.setString(1, NomFillier);
            ps.setString(2, NomDepartement);
            ps.setString(3, NomFillierold);
            ps.executeUpdate();
            
            PrintWriter out = response.getWriter();
            
            request.setAttribute("msg", "Fillier Ajouter Avec Succes");
            request.getRequestDispatcher("/jsp/admin/listeFiliere.jsp").forward(request, response);

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
