/**
 *
 * @author mtimote
*/
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.RolVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RolDao {
    
    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    RolVo registro = new RolVo();
    private boolean operacion = false;
    
    public List<RolVo> getOrdenarId(){
    List<RolVo> consulta = new ArrayList<>();
    String sql = "SELECT * FROM tb_ROl ORDER BY idRol";
    try{
        cnn = conexion.getConexion();
        ps =  cnn.prepareCall(sql);
        rs =  ps.executeQuery();
        while (rs.next()) {
            RolVo registro = new RolVo();
            registro.setIdrol(rs.getInt("idRol"));
            registro.setDescripcion(rs.getString("DescripcionRol"));
            consulta.add(registro);
        }   
    }catch (Exception e) {
        e.printStackTrace();
            
        }
    return consulta;
    }
    
    public RolVo getRolById(int id ){
        String sql = "SELECT * FROM tb_rol WHERE idRol = ?";
        try{
        cnn = conexion.getConexion();
        PreparedStatement  conexion = cnn.prepareStatement(sql);
        conexion.setInt(1, id);
        rs = conexion.executeQuery();
            while (rs.next()) {
                registro.setIdrol(rs.getInt("idRol"));
                registro.setDescripcion(rs.getString("DescripcionRol"));
            }
        }catch (Exception e) {
            
        }
        return registro;
    }
    
    public boolean getCrearRol( String Descripcion){
        String sql = "INSERT INTO tb_rol (DescripcionRol) VALUES (?)";
        try{
            ps = conexion.getConexion().prepareStatement(sql);
            ps.setString(1, Descripcion);
            if (ps.executeUpdate() == 1) {
                return true;
            }
        }catch (Exception e) {
            System.out.println("error "+e);
        }
        return false;
    }
    
    public boolean getActualizarRol( String descripcion, int id){
        String sql = "UPDATE  tb_rol SET DescripcionRol = ? WHERE idRol = ?";
        try{
            ps = conexion.getConexion().prepareStatement(sql);
            ps.setInt(2, id);
            ps.setString(1, descripcion);
            if (ps.executeUpdate() == 1) {
                return true;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    
    }
    
    public void getEliminarRol(int rol){
        String sql = "DELETE FROM tb_rol WHERE idRol =?";
        int id = rol;
        try{
            cnn = conexion.getConexion();
            ps = cnn.prepareStatement(sql);
            ps.setInt(1, rol);
            ps.executeUpdate();
                  
        }catch (Exception e) {
            e.getMessage();
        }
    
    }

}//Fin clase $ {name}