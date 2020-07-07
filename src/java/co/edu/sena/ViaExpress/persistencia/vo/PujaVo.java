/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.ViaExpress.persistencia.vo;

/**
 *
 * @author Diego Alejandro
 */
public class PujaVo {
    private   String ValorPuja ;
    private String FechaPuja;
    private String Comentario;
    private  int idenvio ;     
    private  int idPuja ; 

    private int idusuario; 
    private int estadoPuja;

    public int getIdPuja() {
        return idPuja;
    }

    public void setIdPuja(int idPuja) {
        this.idPuja = idPuja;
    }

    
    public int getEstadoPuja() {
        return estadoPuja;
    }

    public void setEstadoPuja(int estadoPuja) {
        this.estadoPuja = estadoPuja;
    }

    public PujaVo() {
    }

    public String getValorPuja() {
        return ValorPuja;
    }

    public void setValorPuja(String ValorPuja) {
        this.ValorPuja = ValorPuja;
    }

    public String getFechaPuja() {
        return FechaPuja;
    }

    public void setFechaPuja(String FechaPuja) {
        this.FechaPuja = FechaPuja;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    public int getIdenvio() {
        return idenvio;
    }

    public void setIdenvio(int idenvio) {
        this.idenvio = idenvio;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }
    
    
    
    
}
