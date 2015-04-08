/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Dto.RolesDTO;
import Modelo.RolesDAO;
import Utilidades.MyErrorExcepcion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HenryRG
 */
public class Roles extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, MyErrorExcepcion {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            if(request.getParameter("registraRol")!=null && request.getParameter("newRol")!=null){
               
                // recogemos los datos del formulario mediante el objeto request y los asignamos al objeto dto
                //Recordar que si hay enteros toca hacer cast primero porque por defecto todos los campos del formulario
                //legan como texto
                
                RolesDAO rolCrear = new RolesDAO();
                RolesDTO rolReg = new RolesDTO();
                 
                String[] pag = request.getParameterValues("paginas");
                    if(pag!=null && pag.length>0) {
                        for(int i=0; i<pag.length; i++) {
                         if (pag[i]== "pu"){int idpagina1= 1;}
                         else if (pag[i]== "pc"){int idpagina2= 2;}
                         else if (pag[i]== "pce"){int idpagina3= 3;}
                         else if (pag[i]== "pif"){int idpagina4= 4;}
                         else if (pag[i]== "pmr"){int idpagina5= 5;}
                         else if (pag[i]== "pconc"){int idpagina6= 6;}
                         else {  }
                        }                    
                    }                
                rolReg.setNamerol(request.getParameter("namerol")); 
                    
                    
                    
//Luego de tener el objeto dto creado y "cargado" con los datos del formulario, creamos el DAO
                // y llamamos el metodo para registrar un nuevo profesor. recordar que ese metodo devuelve una cadena
                String mensaje =(rolCrear.crearRegistroRol(rolReg));
                
                //Una vez recibido el mensaje el siguiente paso es reenviarlo al usuario en la interfaz
                response.sendRedirect("gestionrol.jsp?msg="+mensaje);  // lo pasamos como atributo usando el metodo get
                
                
            }else{out.println("Esta intentando acceder de forma fraudulenta");        }         
                
          //////------------------------------------------------------------------------------------------------------------------
            
            if(request.getParameter("btnUpdateRol")!=null && request.getParameter("updateRol")!=null){
               
                // recogemos los datos del formulario mediante el objeto request y los asignamos al objeto dto
                //Recordar que si hay enteros toca hacer cast primero porque por defecto todos los campos del formulario
                //legan como texto
                
                 RolesDAO rolActualizar = new  RolesDAO();
                RolesDTO rolUpdate = new RolesDTO();
                
                rolUpdate.setRolid(Integer.parseInt(request.getParameter("idrol1")));
                rolUpdate.setNamerol(request.getParameter("namerol"));
                
                //Luego de tener el objeto dto creado y "cargado" con los datos del formulario, creamos el DAO
                // y llamamos el metodo para registrar un nuevo profesor. recordar que ese metodo devuelve una cadena
                String mensaje = (rolActualizar.modificarRegistroRol(rolUpdate));

                //Una vez recibido el mensaje el siguiente paso es reenviarlo al usuario en la interfaz
                response.sendRedirect("gestionrol1.jsp?msg=" + mensaje);  // lo pasamos como atributo usando el metodo get
                
                
            }else{  out.println("Esta intentando acceder de forma fraudulenta");       }      
               
        
            //////------------------------------------------------------------------------------------------------------------------
            
              if(request.getParameter("btnEliminaRol")!=null && request.getParameter("EliminaRol")!=null){
            
            int numeroID = Integer.parseInt(request.getParameter("idclie"));
            RolesDAO eliminarRegistro = new RolesDAO();
            String mensaje =(eliminarRegistro.EliminarRegistroRol(numeroID));
            response.sendRedirect("confireliminacion.jsp?msg="+ mensaje);
            
              }
            
              else{ out.println("Esta intentando acceder de forma fraudulenta");}
            
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Roles</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Roles at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | MyErrorExcepcion ex) {
            Logger.getLogger(Roles.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | MyErrorExcepcion ex) {
            Logger.getLogger(Roles.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
