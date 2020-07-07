/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.CiudadVo;
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
public class CiudadDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    CiudadVo ciudadvo = new CiudadVo();

    public List<CiudadVo> getOrdenarId() {
        List<CiudadVo> consulta = new ArrayList<>();
        String Mysql = "Select * from tb_ciudad";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(Mysql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CiudadVo ingreso = new CiudadVo () ;
                ingreso.setCiudad(rs.getInt("idCiudad"));
                ingreso.setNombreCiudad(rs.getString("NomCiudad"));
                consulta.add(ingreso);
            }// fin while 

        } catch (SQLException e) {
            System.out.println(e);
        }// fin catch
        return consulta;
    }// fin metodo 

    public CiudadVo getobtenerporid(int idciudad) {
        String MySql = "Select * from tb_ciudad where  idCiudad = ?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(MySql);
            conexion.setInt(1, idciudad);
            ResultSet rs = conexion.executeQuery();
            while (rs.next()) {
                ciudadvo.setCiudad(rs.getInt("idCiudad"));
                ciudadvo.setNombreCiudad(rs.getString("NomCiudad"));
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return ciudadvo;
    }// fin metodo 

}// fin class
