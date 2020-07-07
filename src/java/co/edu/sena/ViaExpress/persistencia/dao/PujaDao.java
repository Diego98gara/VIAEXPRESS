/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.EnvioVo;
import co.edu.sena.ViaExpress.persistencia.vo.PujaVo;
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
public class PujaDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;

    public boolean GetCrearPuja(String ValorPuja, String Fecha, String Comentario, int idEnvio, int idUsuario) {
        try {
            cnn = conexion.getConexion();
            CallableStatement cs = cnn.prepareCall("{CALL CrearPuja(?,?,?,?,?)}");
            cs.setString(1, ValorPuja);
            cs.setString(2, Fecha);
            cs.setString(3, Comentario);
            cs.setInt(4, idEnvio);
            cs.setInt(5, idUsuario);
            if (cs.executeUpdate() == 1) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<PujaVo> GetoptenerPuja(int idEnvio) {
        List<PujaVo> lista = new ArrayList<PujaVo>();
        String Mysql = "select idPuja,ValorPuja,FechaPuja,Comentario,tb_envio_idEnvio,tb_user_isUser  from puja where tb_envio_idEnvio = ?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(Mysql);
            ps.setInt(1, idEnvio);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PujaVo pujaveo = new PujaVo();
                pujaveo.setValorPuja(rs.getString("ValorPuja"));
                pujaveo.setFechaPuja(rs.getString("FechaPuja"));
                pujaveo.setComentario(rs.getString("Comentario"));
                pujaveo.setIdenvio(rs.getInt("tb_envio_idEnvio"));
                pujaveo.setIdPuja(rs.getInt("idPuja"));
                pujaveo.setIdusuario(rs.getInt("tb_user_isUser"));
                lista.add(pujaveo);
            }// fin whilw

        } catch (SQLException e) {
            System.out.println(e);

        }
        return lista;
    }

    public int setPujaSeleccionada(int idEnvio, int idPuja) {
        int ex=0;
        try {
            String updatepuja = "update puja set estadoPuja =2 where tb_envio_idEnvio =? and idpuja =?";
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(updatepuja);
            ps.setInt(1, idEnvio);
            ps.setInt(2, idPuja);
            if (ps.executeUpdate() == 1) {
                ex=1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        try {
            String updatepuja = "update tb_envio set id_estado =5 where idEnvio =?";
            cnn = conexion.getConexion();
            PreparedStatement ps1 = cnn.prepareCall(updatepuja);
            ps1.setInt(1, idEnvio);
            if (ps1.executeUpdate() == 1) {
                ex=1;
            }else{
                ex=0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
      
        return ex;
    }

}// fin Dao
