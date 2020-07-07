/**
 *
 * @author mtimote
*/
package co.edu.sena.ViaExpress.persistencia.vo;

public class ClienteVo {
        
    private int id;
    private String nenvio; 
    private int valor;
    private String mercancia;
    private String estado;
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public ClienteVo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public String getNenvio() {
        return nenvio;
    }

    public void setNenvio(String nenvio) {
        this.nenvio = nenvio;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public String getMercancia() {
        return mercancia;
    }

    public void setMercancia(String mercancia) {
        this.mercancia = mercancia;
    }
    
    
}//Fin clase $ {name}
