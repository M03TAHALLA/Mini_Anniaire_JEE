 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.pk;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *x
 * @author TAHALLA MOHAMMED
 */
public class UtilConnection {
    public static Connection seConnecter() throws Exception{
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-EJV1OG9:1521/XE", "SYSTEM", "simo");
        }catch(ClassNotFoundException ex){
            throw new Exception("Impossible de Charger Driver");
        }catch(SQLException e){
            throw new Exception("erreur :"+e.getMessage());
        }
        
    }
}
