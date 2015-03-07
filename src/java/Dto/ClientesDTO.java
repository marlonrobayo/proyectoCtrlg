/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

/**
 *
 * @author HenryRG
 */
public class ClientesDTO {
    
    private String nitCliente="";
    private String nombreCliente ="";
    private  String sapCodigoCliente ="";
    private String radicacionCliente ="";
    private String tipoRadCliente = "";
    private String analistacliente = "";

    public ClientesDTO() {
    }

    /**
     * @return the nitCliente
     */
    public String getNitCliente() {
        return nitCliente;
    }

    /**
     * @param nitCliente the nitCliente to set
     */
    public void setNitCliente(String nitCliente) {
        this.nitCliente = nitCliente;
    }

    /**
     * @return the nombreCliente
     */
    public String getNombreCliente() {
        return nombreCliente;
    }

    /**
     * @param nombreCliente the nombreCliente to set
     */
    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    /**
     * @return the sapCodigoCliente
     */
    public String getSapCodigoCliente() {
        return sapCodigoCliente;
    }

    /**
     * @param sapCodigoCliente the sapCodigoCliente to set
     */
    public void setSapCodigoCliente(String sapCodigoCliente) {
        this.sapCodigoCliente = sapCodigoCliente;
    }

    /**
     * @return the radicacionCliente
     */
    public String getRadicacionCliente() {
        return radicacionCliente;
    }

    /**
     * @param radicacionCliente the radicacionCliente to set
     */
    public void setRadicacionCliente(String radicacionCliente) {
        this.radicacionCliente = radicacionCliente;
    }

    /**
     * @return the tipoRadCliente
     */
    public String getTipoRadCliente() {
        return tipoRadCliente;
    }

    /**
     * @param tipoRadCliente the tipoRadCliente to set
     */
    public void setTipoRadCliente(String tipoRadCliente) {
        this.tipoRadCliente = tipoRadCliente;
    }

    /**
     * @return the analistacliente
     */
    public String getAnalistacliente() {
        return analistacliente;
    }

    /**
     * @param analistacliente the analistacliente to set
     */
    public void setAnalistacliente(String analistacliente) {
        this.analistacliente = analistacliente;
    }
    
    
    
}
