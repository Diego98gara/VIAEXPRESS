/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.UserVo;
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
public class UserDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    UserVo ingreso = new UserVo();
    private boolean operacion = false;

    public List<UserVo> getordenaPorId() {
        List<UserVo> lista = new ArrayList<UserVo>();
        String sql = "SELECT * FROM vista_usuarioCompleta";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserVo ingreso = new UserVo();
                ingreso.setIduser(rs.getInt("isUser"));
                ingreso.setTipodocumento(rs.getString("descripcion_documento"));
                ingreso.setDocumento(rs.getString("documento_User"));
                ingreso.setNombre(rs.getString("Nombre"));
                ingreso.setApellido(rs.getString("Apellido"));
                ingreso.setTelefono(rs.getString("telefono"));
                ingreso.setDireccion(rs.getString("direccion"));
                ingreso.setCorreo(rs.getString("correo"));
                ingreso.setPassword(rs.getString("password"));
                ingreso.setRol(rs.getString("DescripcionRol"));
                lista.add(ingreso);
            }// fin while 
        } catch (Exception e) {
            e.printStackTrace();
            //throw new Exception("error de conexion");
        }
        return lista;
    }// fin consultar

    public UserVo getuserById(int iduser) {
        String myQuery = "SELECT * FROM tb_user WHERE isUser = ?";
        try {
            cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, iduser);
            ResultSet rs = conexion.executeQuery();
            while (rs.next()) {
                ingreso.setIduser(rs.getInt("isUser"));
                ingreso.setTipodocumento(rs.getString("tipodocumento_idTipodocumento"));
               ingreso.setDocumento(rs.getString("documento_User"));
                ingreso.setNombre(rs.getString("Nombre"));
                ingreso.setApellido(rs.getString("Apellido"));
                ingreso.setTelefono(rs.getString("telefono"));
                ingreso.setDireccion(rs.getString("direccion"));
                ingreso.setCorreo(rs.getString("correo"));
                ingreso.setPassword(rs.getString("password"));
                ingreso.setRol(rs.getString("rol_idRol"));
               
            }
        } catch (Exception ex) {
        }
        return ingreso;
    } // ver datos por ID 

    public boolean getcrearusuer(int tipodocumento, String documento, String nombre, String apellido, String telefono, String direccion, String correo, String password, int rol) {

        PreparedStatement ps = null;

        String myQuery = "INSERT INTO tb_user(tipodocumento_idTipodocumento,documento_User,Nombre,Apellido,telefono,direccion,correo,PASSWORD,rol_idRol)VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setInt(1, tipodocumento);
            ps.setString(2, documento);
            ps.setString(3, nombre);
            ps.setString(4, apellido);
            ps.setString(5, telefono);
            ps.setString(6, direccion);
            ps.setString(7, correo);
            ps.setString(8, password);
            ps.setInt(9, rol);
            if (ps.executeUpdate() == 1) {

                return true;
            }// fin if 

        } catch (SQLException ex) {
            System.out.println("error"+ex);
        } /*finally {
            try {
                if (conexion.getConexion() != null) {
                    conexion.getConexion().close();
                }
                if (ps!=null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println("error cierre"+ex);
            }
        }// cierre conexion*/
        return false;
    }//  fin crear  user 

    /* public boolean getCrearUsuario(UserVo uservo) {
        String myQuery = "INSERT INTO tb_user(tipodocumento_idTipodocumento,documento_User,Nombre,Apellido,telefono,direccion,correo,password,rol_idRol)VALUES('" + uservo.getTipodocumento() + "','" + uservo.getDocumento() + "','" + uservo.getNombre() + "','" + uservo.getApellido() + "','" + uservo.getTelefono() + "','" + uservo.getDireccion() + "','" + uservo.getCorreo() + "','" + uservo.getPassword() + "','" + uservo.getRol() + "')";
        try {
            cnn = conexion.getConexion();
            PreparedStatement ps = cnn.prepareCall(myQuery);
            ps.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return operacion;
    }*/
    public boolean modificarusuario(int tipodocumento,String documento, String nombre, String apellido, String telefono, String direccion, String correo, String password, int rol, int id) {

        String myQuery = "UPDATE tb_user SET tipodocumento_idTipodocumento = ?,documento_User= ? ,Nombre =?,Apellido=?,telefono=?,direccion=?,correo=?,PASSWORD=?,rol_idRol=? WHERE isUser =?";

        try {
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setInt(1, tipodocumento);
            ps.setString(2, documento);
            ps.setString(3, nombre);
            ps.setString(4, apellido);
            ps.setString(5, telefono);
            ps.setString(6, direccion);
            ps.setString(7, correo);
            ps.setString(8, password);
            ps.setInt(9, rol);
            ps.setInt(10, id);
            if (ps.executeUpdate() == 1) {
                return true;
            }// fin if 
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
        
       
    }// fin actualizar datos 

    public void eliminarUsuario(int usuario) {

        String myQuery = "DELETE FROM tb_user WHERE isUser =?";

        try {
             cnn = conexion.getConexion();
            PreparedStatement conexion = cnn.prepareStatement(myQuery);
            conexion.setInt(1, usuario);
            conexion.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
 
        }

    }// fin elimiar dato  
    public UserVo validar(String correo, String password) {
        UserVo uservo=new UserVo();
        String myQuery = "SELECT * FROM tb_user WHERE correo = ? and password=?";
        try {
            cnn = conexion.getConexion();
            ps = conexion.getConexion().prepareStatement(myQuery);
            ps.setString(2, password);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            while (rs.next()) {
                uservo.setIduser(rs.getInt("isUser"));
                uservo.setTipodocumento(rs.getString("tipodocumento_idTipodocumento"));
                uservo.setDocumento(rs.getString("documento_User"));
                uservo.setNombre(rs.getString("Nombre"));
                uservo.setApellido(rs.getString("Apellido"));
                uservo.setTelefono(rs.getString("telefono"));
                uservo.setDireccion(rs.getString("direccion"));
                uservo.setCorreo(rs.getString("correo"));
                uservo.setPassword(rs.getString("password"));
                uservo.setRol(rs.getString("rol_idRol"));
            }
        } catch (SQLException e) {
            System.out.println("error "+e);
            
        }  
        return uservo;
    }// fin validar 
    
    

}// fin class userDao
