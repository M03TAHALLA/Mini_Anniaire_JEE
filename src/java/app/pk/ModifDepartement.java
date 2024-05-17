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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ModifDepartement", urlPatterns = {"/ModifDepartement"})
public class ModifDepartement extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        
        PrintWriter out = response.getWriter();

        String oldNomDepartement = request.getParameter("oldNomDepartement");
        String newNomDepartement = request.getParameter("newNomDepartement");
        
        if (oldNomDepartement == null || oldNomDepartement.isEmpty() || newNomDepartement == null || newNomDepartement.isEmpty()) {
            out.println("Please provide both old and new department names.");
            return;
        }

        try {
            Connection con = UtilConnection.seConnecter();
            
            PreparedStatement ps = con.prepareStatement("UPDATE departement SET NomDepartement=? WHERE NomDepartement=?");
            
            ps.setString(1, newNomDepartement);
            ps.setString(2, oldNomDepartement);
           
            int rowsUpdated = ps.executeUpdate();
            
            if (rowsUpdated > 0) {
                request.setAttribute("msg", "Department modified successfully.");
            } else {
                request.setAttribute("msg", "No department found with the given name.");
            }
            
            request.getRequestDispatcher("/jsp/admin/listeDepartement.jsp").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
            
            out.print("ERROR: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet to modify department";
    }
}
