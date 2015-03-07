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
public class ItemDTO {
    
     private int itemID = 0;
    private String itemNombre = "";
    private double itemValorUnit =0.0;
    private int itemVariableFac = 0;
    private String itemCeCo = "";
    private String itemFacturaClie = "";
    private String itemEstado = "";
    private int itemTipoMoneda = 0;
    private int itemCorte = 0;
    private int itemRangoImpacto = 0;
    private String itemCoordinador = "";
    private String nombreVariableFac="";
    private String nombreMoneda ="";

    public ItemDTO() {
    }

    /**
     * @return the itemID
     */
    public int getItemID() {
        return itemID;
    }

    /**
     * @param itemID the itemID to set
     */
    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    /**
     * @return the itemNombre
     */
    public String getItemNombre() {
        return itemNombre;
    }

    /**
     * @param itemNombre the itemNombre to set
     */
    public void setItemNombre(String itemNombre) {
        this.itemNombre = itemNombre;
    }

    /**
     * @return the itemValorUnit
     */
    public double getItemValorUnit() {
        return itemValorUnit;
    }

    /**
     * @param itemValorUnit the itemValorUnit to set
     */
    public void setItemValorUnit(double itemValorUnit) {
        this.itemValorUnit = itemValorUnit;
    }

    /**
     * @return the itemVariableFac
     */
    public int getItemVariableFac() {
        return itemVariableFac;
    }

    /**
     * @param itemVariableFac the itemVariableFac to set
     */
    public void setItemVariableFac(int itemVariableFac) {
        this.itemVariableFac = itemVariableFac;
    }

    /**
     * @return the itemCeCo
     */
    public String getItemCeCo() {
        return itemCeCo;
    }

    /**
     * @param itemCeCo the itemCeCo to set
     */
    public void setItemCeCo(String itemCeCo) {
        this.itemCeCo = itemCeCo;
    }

    /**
     * @return the itemFacturaClie
     */
    public String getItemFacturaClie() {
        return itemFacturaClie;
    }

    /**
     * @param itemFacturaClie the itemFacturaClie to set
     */
    public void setItemFacturaClie(String itemFacturaClie) {
        this.itemFacturaClie = itemFacturaClie;
    }

    /**
     * @return the itemEstado
     */
    public String getItemEstado() {
        return itemEstado;
    }

    /**
     * @param itemEstado the itemEstado to set
     */
    public void setItemEstado(String itemEstado) {
        this.itemEstado = itemEstado;
    }

    /**
     * @return the itemTipoMoneda
     */
    public int getItemTipoMoneda() {
        return itemTipoMoneda;
    }

    /**
     * @param itemTipoMoneda the itemTipoMoneda to set
     */
    public void setItemTipoMoneda(int itemTipoMoneda) {
        this.itemTipoMoneda = itemTipoMoneda;
    }

    /**
     * @return the itemCorte
     */
    public int getItemCorte() {
        return itemCorte;
    }

    /**
     * @param itemCorte the itemCorte to set
     */
    public void setItemCorte(int itemCorte) {
        this.itemCorte = itemCorte;
    }

    /**
     * @return the itemRangoImpacto
     */
    public int getItemRangoImpacto() {
        return itemRangoImpacto;
    }

    /**
     * @param itemRangoImpacto the itemRangoImpacto to set
     */
    public void setItemRangoImpacto(int itemRangoImpacto) {
        this.itemRangoImpacto = itemRangoImpacto;
    }

    /**
     * @return the itemCoordinador
     */
    public String getItemCoordinador() {
        return itemCoordinador;
    }

    /**
     * @param itemCoordinador the itemCoordinador to set
     */
    public void setItemCoordinador(String itemCoordinador) {
        this.itemCoordinador = itemCoordinador;
    }

    /**
     * @return the nombreVariableFac
     */
    public String getNombreVariableFac() {
        return nombreVariableFac;
    }

    /**
     * @param nombreVariableFac the nombreVariableFac to set
     */
    public void setNombreVariableFac(String nombreVariableFac) {
        this.nombreVariableFac = nombreVariableFac;
    }

    /**
     * @return the nombreMoneda
     */
    public String getNombreMoneda() {
        return nombreMoneda;
    }

    /**
     * @param nombreMoneda the nombreMoneda to set
     */
    public void setNombreMoneda(String nombreMoneda) {
        this.nombreMoneda = nombreMoneda;
    }
    
    
    
}
