/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.TipoDocumentoVo;
import co.edu.sena.ViaExpress.persistencia.vo.TipoMercanciaVo;
import co.edu.sena.ViaExpress.persistencia.vo.VehiculoVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Alejandro
 */
public class TipoMercanciaDao {

    Conexion conexion = new Conexion();
    Connection cnn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    TipoMercanciaVo ingreso = new TipoMercanciaVo();
    private boolean operacion = false;

    public List<TipoMercanciaVo> getordenaPorId() {
        List<TipoMercanciaVo> lista = new ArrayList<TipoMercanciaVo>();
        String mysql = "SELECT * FROM tb_tipomercancia ORDER BY idTipomercancia";
        try {
            cnn = conexion.getConexion();
            ps = cnn.prepareStatement(mysql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TipoMercanciaVo ingreso = new TipoMercanciaVo();
                ingreso.setIdTipoMercacia(rs.getInt("idTipomercancia"));
                ingreso.setDescripcionTipoMercancia(rs.getString("DescricpcionTipomercancia"));
                lista.add(ingreso);
                System.out.println("ingreso");
            }// fin while 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }// fin consultar

    public TipoMercanciaVo getmercanciaById(int idmercaancia) {
        String myQuery = "SELECT * FROM tb_tipomercancia WHERE idTipomercancia= ?";

        try {
           cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, idmercaancia);
            ResultSet rs = conexion.executeQuery();
            System.out.println("ingreso nuevamnete");
            while (rs.next()) {
               ingreso.setIdTipoMercacia(rs.getInt("idTipomercancia"));
               ingreso.setDescripcionTipoMercancia(rs.getString("DescricpcionTipomercancia"));
            }
        } catch (Exception ex) {
            ex.getMessage();

        }
        return ingreso;
    } // ver datos por ID 

    public boolean getcrearmercancia(String tipomercancia) {
        String myQuery = "INSERT INTO tb_tipomercancia(DescricpcionTipomercancia)VALUES(?)";
        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1, tipomercancia);
            if (ps.executeUpdate() == 1) {

                return true;
            }// fin if 
        } catch (Exception ex) {
            ex.getMessage();
        }// fin catch
        return false;
    }//  fin crear vehiculo 

    public boolean modificarmercancia(String tipomercancia, int idmercancia)  {

        String myQuery = "UPDATE tb_tipomercancia SET DescricpcionTipomercancia = ?WHERE idTipomercancia =?";

        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(1, tipomercancia);
            ps.setInt(2, idmercancia);
             if (ps.executeUpdate() == 1) {
                return true;
            }// fin if 
        } catch (Exception ex) {
            ex.getMessage();
           
        }

        return false;
    }// fin actualizar datos 

    public void eliminarmercancia(int idmercancia){

        String myQuery = "DELETE FROM tb_tipomercancia WHERE idTipomercancia = ?";

        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, idmercancia);
            conexion.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
    }

    }// fin elimiar dato 

}// fin class conection 
