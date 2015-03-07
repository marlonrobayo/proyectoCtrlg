/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Dto.PermisosDTO;
import Dto.PersonasDTO;
import Modelo.LoginDAO;
import Modelo.PermisosDAO;
import Utilidades.MyErrorExcepcion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author HenryRG
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws Utilidades.MyErrorExcepcion
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, MyErrorExcepcion {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            if (request.getParameter("ValidUser") != null && request.getParameter("UserIn") != null) {
            
            String userNombre = request.getParameter("nommail").trim();
            String userContrasena = request.getParameter("clave").trim();
  
                   
            LoginDAO pdo = new LoginDAO();
            HttpSession sesion = request.getSession(true);
            PersonasDTO pdto = new PersonasDTO();
            try {
                pdto = pdo.validarUsuario(userNombre, userContrasena);                
                if(pdto != null){
                    
                    sesion.setAttribute("varDatosU", pdto);
                              
                    PermisosDAO perdao = new PermisosDAO();
                    ArrayList<PermisosDTO> pintarmenu = perdao.listarTodos(userNombre);
                    sesion.setAttribute("varMenu", pintarmenu); 
                    response.sendRedirect("administraritemfacturable.jsp");
                  }  
                    
                else{
                  String msg = "Usuario o clave incorrectos" ;
                  //pintarmenu.clear();
                  response.sendRedirect("index.jsp?sal="+msg);
                          
                }
            } catch (MyErrorExcepcion ex) {
                //throw new ();
                 String msg = "excepción del controldor "+" "+ex;
                 out.println(msg);
            }  
                
            }
            else    {
                
                out.println("Esta intentando acceder de forma fraudulenta");
            }
                
                
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Login</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
