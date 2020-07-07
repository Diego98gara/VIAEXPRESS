/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.EnvioVo;
import java.sql.CallableStatement;
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
public class EnvioDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;

    public boolean GetCrearEnvio(int idusuario, String NombreEnvio, float peso, float ancho, float alto, String observaciones, int valorOferta, int idMercancia, int idEstado ,String FechaInicio,String FechaFin) {
        try {
            cnn = conexion.getConexion();
            CallableStatement cs = cnn.prepareCall("{CALL Registrar_Envio(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, idusuario);
            cs.setString(2, NombreEnvio);
            cs.setDouble(3, peso);
            cs.setDouble(4, ancho);
            cs.setDouble(5, alto);
            cs.setString(6, observaciones);
            cs.setInt(7, valorOferta);
            cs.setInt(8, idMercancia);
            cs.setInt(9, idEstado);
            cs.setString(10, FechaInicio);
            cs.setString(11, FechaFin);
            if (cs.executeUpdate() == 1) {
                return true;
            }// fin if 
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    } // fin crear envio 

    public List<EnvioVo> getordenaPorId() {
        List<EnvioVo> lista = new ArrayList<EnvioVo>();
        String sql = "Select * from tb_envio";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EnvioVo ingreso = new EnvioVo();
                ingreso.setIdEnvio(rs.getInt("idEnvio"));
                ingreso.setIdUsuario(rs.getInt("usuario_idUsuario"));
                ingreso.setNombreEnvio(rs.getString("NombreEnvio"));
                ingreso.setPeso(rs.getDouble("peso"));
                ingreso.setAncho(rs.getDouble("Ancho"));
                ingreso.setAlto(rs.getDouble("Alto"));
                ingreso.setObservaciones(rs.getString("Observaciones"));
                ingreso.setValorOferta(rs.getInt("ValorOferta"));
                ingreso.setTipoMercancia(rs.getInt("id_tipoMercancia"));
                ingreso.setEstado(rs.getInt("id_estado"));
                lista.add(ingreso);
            }// fin while 
        } catch (Exception e) {
            e.printStackTrace();
            //throw new Exception("error de conexion");
        }
        return lista;
    }// fin consultar

    public int getUltimoID() {
        int idenvio = 0;
        String Mysql = "Select  MAX(idEnvio) AS idenvio from tb_envio";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(Mysql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            idenvio = rs.getInt("idenvio");
        } catch (SQLException EX) {
            System.out.println(EX);
        }
        return idenvio;
    }

    /*public EnvioVo getConsultarEnvio(int idUsuario) {
        String Mysql = "Select NombreEnvio,ValorOferta,id_tipoMercancia,Observaciones from tb_envio where usuario_idUsuario = ?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }*/
    
  
    
    
    
}// fin dao 
