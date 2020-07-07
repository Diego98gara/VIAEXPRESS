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
public class DetalleEnvioVo {
    
    private int Documento; 
    private String  Nombre; 
    private String telefono ; 
    private int departamento; 
    private int ciudad; 
    private String Direccion ;
    private String observaciones; 
    private int entregaOrecoge;
    private int idpedido;

    public DetalleEnvioVo() {
    }

    public int getDocumento() {
        return Documento;
    }

    public void setDocumento(int Documento) {
        this.Documento = Documento;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getDepartamento() {
        return departamento;
    }

    public void setDepartamento(int departamento) {
        this.departamento = departamento;
    }

    public int getCiudad() {
        return ciudad;
    }

    public void setCiudad(int ciudad) {
        this.ciudad = ciudad;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public int getEntregaOrecoge() {
        return entregaOrecoge;
    }

    public void setEntregaOrecoge(int entregaOrecoge) {
        this.entregaOrecoge = entregaOrecoge;
    }

    public int getIdpedido() {
        return idpedido;
    }

    public void setIdpedido(int idpedido) {
        this.idpedido = idpedido;
    }
    
    
    
    
    
    
}
