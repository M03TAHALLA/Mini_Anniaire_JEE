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
@WebServlet(name = "AddDepartement", urlPatterns = {"/AddDepartement"})
public class AddDepartement extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            Connection con = UtilConnection.seConnecter();
            
            String NomDepartement = request.getParameter("NomDepartement");
            
           PreparedStatement psCheck = con.prepareStatement("SELECT * FROM departement WHERE NomDepartement = ?");
            psCheck.setString(1, NomDepartement);
            ResultSet rs = psCheck.executeQuery();
            if (rs.next()) {
                
            request.setAttribute("msg", "Departement Est Deja Dans DB");
            request.getRequestDispatcher("/jsp/formAddDepartement.jsp").forward(request, response);
            
            
            }else{
            PreparedStatement ps = con.prepareStatement("INSERT INTO departement (NomDepartement) values (?)");
            
            ps.setString(1, NomDepartement);
           
            ps.executeUpdate();
            
            PrintWriter out = response.getWriter();
            
            request.setAttribute("msg", "Departement Ajouter Avec Succes");
            request.getRequestDispatcher("/jsp/admin/listeDepartement.jsp").forward(request, response);
                    }
        }catch (Exception ex) { 
            PrintWriter out = response.getWriter();
            out.print("ERREUR: " + ex.getMessage()); 
        }
    }

}
