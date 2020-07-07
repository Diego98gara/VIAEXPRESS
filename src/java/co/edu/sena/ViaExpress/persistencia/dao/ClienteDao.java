/**
 *
 * @author mtimote
*/
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.ClienteVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDao {
    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;
    
    
    public List<ClienteVo> getInfoCliente(int idlogueado){
        List<ClienteVo> cliente =  new  ArrayList<>();
        String sql = "SELECT en.idEnvio,en.NombreEnvio, en.ValorOferta, tm.DescricpcionTipomercancia,e.description FROM tb_envio en\n" +
"JOIN tb_tipomercancia tm ON tm.idTipomercancia = en.id_tipoMercancia  JOIN estado e ON e.id= en.id_estado "
                + "where en.usuario_idUsuario="+idlogueado+" ORDER BY idEnvio";
        try{
        cnn = conexion.getConexion();
        ps = cnn.prepareCall(sql);
        rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("entro al while");
                ClienteVo cl = new ClienteVo();
                cl.setId(rs.getInt("idEnvio"));
                cl.setNenvio(rs.getNString("NombreEnvio"));
                cl.setValor(rs.getInt("ValorOferta"));
                cl.setMercancia(rs.getNString("DescricpcionTipomercancia"));
                cl.setEstado(rs.getString("description"));
                cliente.add(cl);
                
            }
       } catch (SQLException e) {
            System.out.println(e);
        }
        return cliente;
    }

}//Fin clase $ {name}
