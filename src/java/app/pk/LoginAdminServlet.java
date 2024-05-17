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
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "LoginAdminServlet", urlPatterns = {"/LoginAdminServlet"})
public class LoginAdminServlet extends HttpServlet {

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
        String username = request.getParameter("Username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = UtilConnection.seConnecter();
            ps = con.prepareStatement("SELECT role FROM users WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");
                if (null == role) {
                    request.setAttribute("msg", "Rôle non reconnu.");
                    request.getRequestDispatcher("/jsp/Login/loginAdmin.jsp").forward(request, response);
                } else switch (role) {
                    case "Admin" -> {
                        HttpSession session2 = request.getSession();
                        session2.setAttribute("LoggedIn", true);
                        session2.setAttribute("name", username);
                        response.sendRedirect("/JEEProjet/jsp/Menu/MenuAdmin.jsp");
                    }
                    default -> {
                        request.setAttribute("msg", "L'utilisateur n'est pas un administrateur.");
                        request.getRequestDispatcher("/jsp/Login/loginAdmin.jsp").forward(request, response);
                    }
                }
            } else {
                request.setAttribute("msg", "Nom d'utilisateur ou mot de passe incorrect.");
                request.getRequestDispatcher("/jsp/Login/loginAdmin.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            PrintWriter out = response.getWriter();
            out.println("Erreur de base de données : " + ex.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(LoginAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
    }

}
