/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.conexion;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Diego Alejandro
 */
public class Conexion {
    
    Connection cnn = null;
    String server = "localhost";
    String db = "viaexpress";
    //String url = "jdbc:mysql://"+server+":3306/"+db;
    String url = "jdbc:mysql://"+server+":3306/"+db;
    String username = "root";
    String password = "root";
    //String parametros = "?useUnicode=true&useJDBCCompliantTimeZoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    
    public Conexion()
    {
        try {
            cnn =(Connection) DriverManager.getConnection(url, username, password);
            
            System.out.println(" se conecto ");
            
        } catch (Exception e) {
            e.getMessage();
        }
    }
    public Connection getConexion (){
     return cnn;
    }
    
}
