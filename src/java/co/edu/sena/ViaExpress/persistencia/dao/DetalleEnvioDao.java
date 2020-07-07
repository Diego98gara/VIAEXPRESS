/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Diego Alejandro
 */
public class DetalleEnvioDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;

    public boolean GetCrearDetalle(int documento, String Nombre, String Telefono, int departamento, int ciudad, String Direccion, String Observaciones, int recogeOentrega, int idEnvio) {
        try {
            cnn = conexion.getConexion();
            CallableStatement cs = cnn.prepareCall("{CALL Detalle_Envio(?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, documento);
            cs.setString(2, Nombre);
            cs.setString(3, Telefono);
            cs.setInt(4, departamento);
            cs.setInt(5, ciudad);
            cs.setString(6, Direccion);
            cs.setString(7, Observaciones);
            cs.setInt(8, recogeOentrega);
            cs.setInt(9, idEnvio);
            if (cs.executeUpdate() == 1) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

}// fin dao 
