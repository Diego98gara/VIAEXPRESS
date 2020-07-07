/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
import co.edu.sena.ViaExpress.persistencia.vo.VehiculoVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author Diego Alejandro
 */
public class VehiculoDao {
    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    UserVo ingreso = new UserVo();
    private boolean operacion = false;

    public List<VehiculoVo> getordenaPorId() throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<VehiculoVo> lista = new ArrayList<VehiculoVo>();
        try {
            ps = cnn.prepareStatement("SELECT * FROM vehiculo ORDER BY idVehiculo");
            rs = ps.executeQuery();
            while (rs.next()) {

                VehiculoVo ingreso = new VehiculoVo(rs.getInt("idvehiculo"));
                ingreso.setPlaca(rs.getString("placa"));
                ingreso.setTipoVehiculo(rs.getString("tipoVehiculo"));
                ingreso.setModelo(rs.getString("modelo"));
                ingreso.setIdususario(rs.getInt("idususario"));
                lista.add(ingreso);
            }// fin while 
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("error de conexion");
        }
        return lista;
    }// fin consultar

    public ArrayList<VehiculoVo> getvehiculosById(int idvehiculo) throws Exception {
        ArrayList<VehiculoVo> vehiculo = new ArrayList<>();
        String myQuery = "SELECT * FROM vehiculo WHERE idVehiculo = ?";

        try {
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, idvehiculo);
            ResultSet rs = conexion.executeQuery();
            while (rs.next()) {

                VehiculoVo vehiculovo = new VehiculoVo();
                vehiculovo.setIdvehiculo(rs.getInt("idvehiculo"));
                vehiculovo.setPlaca(rs.getString("placa"));
                vehiculovo.setTipoVehiculo(rs.getString("tipoVehiculo"));
                vehiculovo.setModelo(rs.getString("modelo"));
                vehiculovo.setIdususario(rs.getInt("idususario"));
                vehiculo.add(vehiculovo);
            }
        } catch (Exception ex) {

            ex.getMessage();
            ex.printStackTrace();
            throw new Exception("error de conexion");
        }
        return vehiculo;
    } // ver datos por ID 

    public void getcrearvehivulo(String placa, int tipovehiculo, String modelo, int idusuario){
         PreparedStatement ps = null;
             String myQuery = "INSERT INTO vehiculo(placa,tipo_vehiculo,modelo,usuario_idUsuario)VALUES(?,?,?,?)";
        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1, placa);
            ps.setInt(2, tipovehiculo);
            ps.setString(3, modelo);
            ps.setInt(4, idusuario);
            ps.executeUpdate();
        } catch (SQLException ex) {
          
            System.out.println(ex);
        }// fin catch

    }//  fin crear vehiculo 

    public void modificarvehiculo(String placa, int tipovehiculo, int modelo, int usuario, int id) throws Exception {

        String myQuery = "UPDATE vehiculo SET placa= ?,tipo_vehiculo= ? ,modelo =?,usuario_idUsuario=? WHERE idVehiculo = ?";

        try {
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setString(1, placa);
            conexion.setInt(2, tipovehiculo);
            conexion.setInt(3, modelo);
            conexion.setInt(4, usuario);
            conexion.setInt(4, id);
            conexion.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
            ex.printStackTrace();
            throw new Exception("error de conexion");
        }

    }// fin actualizar datos 

    public void eliminarVehiculo(int vehiculo) throws Exception {

        String myQuery = "DELETE FROM `vehiculo` WHERE idVehiculo =?";

        try {
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, vehiculo);
            conexion.executeUpdate();

        } catch (Exception ex) {

            ex.getMessage();
            ex.printStackTrace();
            throw new Exception("error de conexion");
        }

    }// fin elimiar dato 
    
 public ArrayList<VehiculoVo> getvehiculoPorUsuario(int usuario) {
        ArrayList<VehiculoVo> vehiculo = new ArrayList<>();
        String myQuery = "select placa,Descripcion_tipovehiculo,modelo from vehiculo \n" +
"inner join tb_tipo_vehiculo \n" +
"on vehiculo.tipo_vehiculo = tb_tipo_vehiculo.idTipovehiculo where usuario_idUsuario = ? ;";
        try {
           cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(myQuery);
             ps.setInt(1, usuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VehiculoVo vehiculovo = new VehiculoVo();
                vehiculovo.setPlaca(rs.getString("placa"));
                vehiculovo.setTipoVehiculo(rs.getString("Descripcion_tipovehiculo"));
                vehiculovo.setModelo(rs.getString("modelo"));
                vehiculo.add(vehiculovo);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return vehiculo;
    } // ver datos por ID 
 
 

}// fin class DAO 
