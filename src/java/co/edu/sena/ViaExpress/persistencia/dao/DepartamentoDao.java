/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.DepartamentoVo;
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
public class DepartamentoDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    DepartamentoVo departamentovo = new DepartamentoVo();

    public List<DepartamentoVo> getobtDepartamento() {
        List<DepartamentoVo> lista = new ArrayList<>();
        String Mysql = "Select * from tb_departamento";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(Mysql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DepartamentoVo  ingreso = new DepartamentoVo () ;
                ingreso.setIdDepartamento(rs.getInt("idDepartamento"));
                ingreso.setNombreDepartamento(rs.getString("NombreDepartamento"));
                lista.add(ingreso);
            }// fin wh
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lista;

    }// fin metodo 

    public DepartamentoVo getobtPorID(int idDepartamento) {
        String MySql = "Select * from tb_departamento where idDepartamento = ?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(MySql);
            conexion.setInt(1, idDepartamento);
            ResultSet rs = conexion.executeQuery();
            while (rs.next()) {
                departamentovo.setIdDepartamento(rs.getInt("idDepartamento"));
                departamentovo.setNombreDepartamento(rs.getString("NombreDepartamento"));
            }
        } catch (SQLException EX) {
            System.out.println(EX);
        }
        return departamentovo;
    }

}// fin class Departamento 
