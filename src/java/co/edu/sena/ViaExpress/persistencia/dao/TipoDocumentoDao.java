/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.TipoDeVehiculoVo;
import co.edu.sena.ViaExpress.persistencia.vo.TipoDocumentoVo;
import co.edu.sena.ViaExpress.persistencia.vo.VehiculoVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Alejandro
 */
    public class TipoDocumentoDao {

  Conexion conexion = new Conexion();
  Connection cnn = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  TipoDocumentoVo ingreso = new TipoDocumentoVo();
    public List<TipoDocumentoVo> getordenaPorId(){
         List<TipoDocumentoVo> lista = new ArrayList<TipoDocumentoVo>();
         String mysql ="SELECT * FROM tipodocumento ORDER BY idTipodocumento";
        try {
          cnn=conexion.getConexion();
          ps=cnn.prepareStatement(mysql);
          rs = ps.executeQuery();
            while (rs.next()) {
                TipoDocumentoVo ingreso = new TipoDocumentoVo();
                ingreso.setIdTipoDocumento(rs.getInt("idTipodocumento"));
                ingreso.setDescripcionDocumento(rs.getString("descripcion_documento"));
                lista.add(ingreso);
            }// fin while 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }// fin consultar

    public TipoDocumentoVo gettipoDocumnetoById(int documento) {
        
        String myQuery = "SELECT * FROM tipodocumento WHERE idTipodocumento = ?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, documento);
            ResultSet rs = conexion.executeQuery();
            System.out.println("ingreso nuevamnete");
            while (rs.next()) {
              ingreso.setIdTipoDocumento(rs.getInt("idTipodocumento"));
              ingreso.setDescripcionDocumento(rs.getString("descripcion_documento"));
              
            }// fin wh
        } catch (Exception e) {
            System.out.println("errorSQL"+e);
        }
      return ingreso;
    } // ver datos por ID

    public boolean getcreartipoDocumento(String  descripcion){

        String myQuery = "INSERT INTO tipodocumento(descripcion_documento) VALUE (?)";
        try {
         ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1,descripcion);
            if (ps.executeUpdate() == 1) {

                return true;
            }// fin if 
            System.out.println("ingrso");
        } catch (Exception ex) {
            ex.getMessage();
            ex.printStackTrace();
        }// fin catch

        return false;
    }//  fin crear tipodocumento

    public boolean getUpdateDocumento (String descripcion, int id) {
          
      String myQuery = "UPDATE tipodocumento SET descripcion_documento = ? WHERE  idTipodocumento =?";
      
        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1, descripcion);
            ps.setInt(2, id);
            if (ps.executeUpdate() == 1) {
                return true;
            }// fin if 
        } catch (Exception e) {
        }
        return false;

    }// fin actualizar datos 

    public void eliminartipodocumento(int idtipodocumeto) {

        String myQuery = "DELETE FROM `tipodocumento` WHERE `idTipodocumento` =?";

        try {
           cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, idtipodocumeto);
            conexion.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

    }// fin elimiar dato

}// fin class
