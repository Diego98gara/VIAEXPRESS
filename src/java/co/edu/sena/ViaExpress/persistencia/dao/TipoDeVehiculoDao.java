/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.TipoDeVehiculoVo;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
import co.edu.sena.ViaExpress.persistencia.vo.VehiculoVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Alejandro
 */
public class TipoDeVehiculoDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    TipoDeVehiculoVo ingreso = new TipoDeVehiculoVo();
    private boolean operacion = false;

    public List<TipoDeVehiculoVo> getordenaPorId() {
        List<TipoDeVehiculoVo> lista = new ArrayList<TipoDeVehiculoVo>();
        String sql = "SELECT * FROM tb_tipo_vehiculo ORDER BY idTipovehiculo";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TipoDeVehiculoVo ingreso = new TipoDeVehiculoVo();
                ingreso.setIdtipovehiculo(rs.getInt("idTipovehiculo"));
                ingreso.setDespripcionVehiculo(rs.getString("Descripcion_tipovehiculo"));
                lista.add(ingreso);
            }// fin while 
        } catch (SQLException e) {

        }
        return lista;
    }// fin consultar

    public TipoDeVehiculoVo getvehiculosById(int idvehiculo) {
        String myQuery = "SELECT * FROM tb_tipo_vehiculo WHERE idTipovehiculo =?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, idvehiculo);
            ResultSet rs = conexion.executeQuery();
            System.out.println("ingreso nuevamnete");
            while (rs.next()) {
                ingreso.setIdtipovehiculo(rs.getInt("idTipovehiculo"));
                ingreso.setDespripcionVehiculo(rs.getString("Descripcion_tipovehiculo"));

            }
        } catch (Exception ex) {
            ex.getMessage();
        }
        return ingreso;
    } // ver datos por ID 

    public boolean getcreartvehiuclo(String descripcion) {
        String myQuery = "INSERT INTO tb_tipo_vehiculo(Descripcion_tipovehiculo)VALUES(?)";
        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1, descripcion);
            if (ps.executeUpdate() == 1) {

                return true;
            }// fin if 
            System.out.println("ingrso");
        } catch (SQLException se) {
            System.out.println("el error fue " + se);
        }// fin catch
        return false;
    }//  descripcion

    public boolean getUpdateTipoVehiculo(String descripcion, int id) {

        String myQuery = "UPDATE tb_tipo_vehiculo SET Descripcion_tipovehiculo = ? WHERE idTipovehiculo = ?";

        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1, descripcion);
            ps.setInt(2, id);
             if (ps.executeUpdate() == 1) {
                return true;
            }// fin if 
        } catch (Exception e) {
            System.out.println("error en" + e);
        }// fin catch 
        return false;
    }

    public void eliminartVehiculo(int idtvehiculo){

        String myQuery = "DELETE FROM tb_tipo_vehiculo WHERE idTipovehiculo=?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, idtvehiculo);
            conexion.executeUpdate();

        } catch (Exception ex) {

            ex.getMessage();
        }// fin  catch

    }// fin elimiar dato 

}// fin class tipovehiculo 
