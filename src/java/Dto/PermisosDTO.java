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
public class PermisosDTO {
    
    private int idPagina=0;
    private String url = "";
    private String nombrePagina = "";
    private  String padre = "";
    private String rolNombrePermi ="";
    private int rolIdPermi=0;

    public PermisosDTO() {
    }

    /**
     * @return the idPagina
     */
    public int getIdPagina() {
        return idPagina;
    }

    /**
     * @param idPagina the idPagina to set
     */
    public void setIdPagina(int idPagina) {
        this.idPagina = idPagina;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return the nombrePagina
     */
    public String getNombrePagina() {
        return nombrePagina;
    }

    /**
     * @param nombrePagina the nombrePagina to set
     */
    public void setNombrePagina(String nombrePagina) {
        this.nombrePagina = nombrePagina;
    }

    /**
     * @return the padre
     */
    public String getPadre() {
        return padre;
    }

    /**
     * @param padre the padre to set
     */
    public void setPadre(String padre) {
        this.padre = padre;
    }

    /**
     * @return the rolNombrePermi
     */
    public String getRolNombrePermi() {
        return rolNombrePermi;
    }

    /**
     * @param rolNombrePermi the rolNombrePermi to set
     */
    public void setRolNombrePermi(String rolNombrePermi) {
        this.rolNombrePermi = rolNombrePermi;
    }

    /**
     * @return the rolIdPermi
     */
    public int getRolIdPermi() {
        return rolIdPermi;
    }

    /**
     * @param rolIdPermi the rolIdPermi to set
     */
    public void setRolIdPermi(int rolIdPermi) {
        this.rolIdPermi = rolIdPermi;
    }
    
    
    
}
