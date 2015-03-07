/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

    
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HenryRG
 */
public class PoolConection {
     
    //private static DataSource dataSource;
    private static Connection conexion = null;

    private PoolConection() {
    }
         
    private static  void inicializaDataSource() throws SQLException {
 
        String host = "127.0.0.1";//cambiar por tu host de la base de datos
        String user = "javauser";//cambiar por tu usuario de la base de datos
        String pass = "Colombia.1*";//cambiar por tu contraseña de la base de datos
        String dtbs = "dbctrlgfinal";//cambiar por tu nombre de la base de datos
 
        try { // preparamos la conexión
            Class.forName("com.mysql.jdbc.Driver");
            String newConnectionURL = "jdbc:mysql://" + host + "/" + dtbs + "?"
                    + "user=" + user + "&password=" + pass;
            conexion = DriverManager.getConnection(newConnectionURL);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al abrir la conexión." + e);
        }
    }
           
    public static Connection getInstance() throws SQLException {
        
        if (conexion == null) {
            inicializaDataSource();
        }
        return conexion;
    }
    
    public static void closeConnection() {
        try {
            conexion.close();
            conexion = null;
        } catch (Exception e) {
            System.out.println("Error al cerrar la conexión. "+e);
        }
    }
}     









    
    