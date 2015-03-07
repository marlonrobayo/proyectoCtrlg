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
public class TipoMonedaDTO {
    
    private int idTipoMoneda = 0 ;
    private String nombreTipoMoneda ="";
    private double trmTipoMoneda = 0;

    public TipoMonedaDTO() {
    }

    /**
     * @return the idTipoMoneda
     */
    public int getIdTipoMoneda() {
        return idTipoMoneda;
    }

    /**
     * @param idTipoMoneda the idTipoMoneda to set
     */
    public void setIdTipoMoneda(int idTipoMoneda) {
        this.idTipoMoneda = idTipoMoneda;
    }

    /**
     * @return the nombreTipoMoneda
     */
    public String getNombreTipoMoneda() {
        return nombreTipoMoneda;
    }

    /**
     * @param nombreTipoMoneda the nombreTipoMoneda to set
     */
    public void setNombreTipoMoneda(String nombreTipoMoneda) {
        this.nombreTipoMoneda = nombreTipoMoneda;
    }

    /**
     * @return the trmTipoMoneda
     */
    public double getTrmTipoMoneda() {
        return trmTipoMoneda;
    }

    /**
     * @param trmTipoMoneda the trmTipoMoneda to set
     */
    public void setTrmTipoMoneda(double trmTipoMoneda) {
        this.trmTipoMoneda = trmTipoMoneda;
    }
    
    
    
}
