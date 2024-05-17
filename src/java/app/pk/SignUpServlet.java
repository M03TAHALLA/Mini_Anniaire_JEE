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
import java.sql.*;
import java.sql.PreparedStatement;


/**
 *
 * @author TAHALLA MOHAMMED
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

 
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Connection con = UtilConnection.seConnecter();
        String Username = request.getParameter("Username");
        String gmail = request.getParameter("gmail");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        
        PreparedStatement checkStatement = con.prepareStatement("SELECT * FROM users WHERE Username = ? AND gmail = ? ");
        checkStatement.setString(1, Username);
        checkStatement.setString(2, gmail);
        ResultSet rs = checkStatement.executeQuery();
        
        if (rs.next()) {
            request.setAttribute("msg", "L'utilisateur existe déjà dans la base de données.");
            request.getRequestDispatcher("/jsp/Login/loginUser.jsp").forward(request, response);
        } else {
            PreparedStatement insertStatement = con.prepareStatement("INSERT INTO users VALUES (?, ?, ?, ?)");
            insertStatement.setString(1, Username);
            insertStatement.setString(2, password);
            insertStatement.setString(3, role);
            insertStatement.setString(4, gmail);
            insertStatement.executeUpdate();
            
            request.setAttribute("msg", "Utilisateur ajouté avec succès");
            request.getRequestDispatcher("/jsp/Login/loginUser.jsp").forward(request, response);
        }
    } catch (Exception ex) {
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
