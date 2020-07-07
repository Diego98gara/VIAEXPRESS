/**
 *
 * @author mtimote
 */
package co.edu.sena.ViaExpress.persistencia.dao;

import co.edu.sena.ViaExpress.persistencia.conexion.Conexion;
import co.edu.sena.ViaExpress.persistencia.vo.TransportistaVo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TransportistaDao {

    Conexion conexion = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs;

    public List<TransportistaVo> getInfoTrasportista() {
        System.out.println("Estoy dentro del metodo");
        List<TransportistaVo> conductor = new ArrayList<>();
        String sql = "select en.idEnvio,en.NombreEnvio, en.Peso,en.Ancho,en.Alto, en.ValorOferta, \n"
                + "tm.DescricpcionTipomercancia, e.description as Descripcion_subasta \n"
                + "from tb_envio en\n"
                + "join  tb_tipomercancia tm on tm.idTipomercancia =  en.id_tipoMercancia \n"
                + "join estado e on e.id = en.id_estado where id_estado = 2  order by idEnvio";
        try {
            cnn = conexion.getConexion();
            ps = cnn.prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("ingreso al while data puto");
                TransportistaVo tr = new TransportistaVo();
                System.out.println("Desñpues de crear el objet");
                tr.setId(rs.getInt("idEnvio"));
                tr.setNenvio(rs.getNString("NombreEnvio"));
                tr.setPeso(rs.getDouble("peso"));                
                tr.setAncho(rs.getDouble("Ancho"));
                tr.setAltura(rs.getDouble("Alto"));
                tr.setVoferta(rs.getDouble("ValorOferta"));
                tr.setMercancia(rs.getString("DescricpcionTipomercancia"));
                tr.setSubasta(rs.getString("Descripcion_subasta"));
                conductor.add(tr);
                System.out.println("este es dato con cambios tres");
            }
        } catch (Exception e) {

        }
        return conductor;

    }

}//Fin clase $ {name}