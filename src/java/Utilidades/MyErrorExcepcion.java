/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author HenryRG
 */
public class MyErrorExcepcion extends Exception {

   /**
    * Constructor for NotFoundException. The input message is
    * returned in toString() message.
     * @param msg
    */
    public MyErrorExcepcion(String msg) {
           super(msg);
    }

}
