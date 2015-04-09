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
public class RolesDTO {
    
     private int rolid;
     private String namerol;
     private int idpagpermi;

    public RolesDTO() {
    }

    /**
     * @return the rolid
     */
    public int getRolid() {
        return rolid;
    }

    /**
     * @param rolid the rolid to set
     */
    public void setRolid(int rolid) {
        this.rolid = rolid;
    }

    /**
     * @return the namerol
     */
    public String getNamerol() {
        return namerol;
    }

    /**
     * @param namerol the namerol to set
     */
    public void setNamerol(String namerol) {
        this.namerol = namerol;
    }

    /**
     * @return the idpagpermi
     */
    public int getIdpagpermi() {
        return idpagpermi;
    }

    /**
     * @param idpagpermi the idpagpermi to set
     */
    public void setIdpagpermi(int idpagpermi) {
        this.idpagpermi = idpagpermi;
    }
     
     
    
}
