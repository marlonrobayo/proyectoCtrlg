/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Dto.ItemDTO;
import Modelo.ItemDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author HenryRG
 */
public class ServletMarlon extends HttpServlet {

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
            
            if (request.getParameter("btnRegistraItem") != null && request.getParameter("rItem")!= null){
           ItemDTO nuevoItem = new ItemDTO();
           nuevoItem.setItemNombre(request.getParameter("txtNombreItem"));
           nuevoItem.setItemValorUnit(Double.parseDouble(request.getParameter("txtValorItem")));
           nuevoItem.setItemVariableFac(Integer.parseInt(request.getParameter("txtVariable")));
           nuevoItem.setItemCeCo(request.getParameter("NomCeCo"));
           nuevoItem.setItemFacturaClie(request.getParameter("txtFacCli"));
           nuevoItem.setItemTipoMoneda(Integer.parseInt(request.getParameter("txtTipoMoneda")));
           nuevoItem.setItemCorte(Integer.parseInt(request.getParameter("txtCorte")));
           nuevoItem.setItemRangoImpacto(Integer.parseInt(request.getParameter("txtRangoImpac")));
           nuevoItem.setItemCoordinador(request.getParameter("txtCordinadorEn"));
           ItemDAO itemdao = new ItemDAO();
           String mensaje = itemdao.creaItem(nuevoItem);
           response.sendRedirect("nuevoItem.jsp?msg="+mensaje);
           
           }else if(request.getParameter("btnFiltroItem") != null && request.getParameter("fItem")!= null){
           
           String filtro ="";
           if (request.getParameter("NomCeCo")!= null && !"".equals(request.getParameter("NomCeCo"))){
           filtro+=  "WHERE tbIdCECO_Cod='"+request.getParameter("NomCeCo")+"'";
                   
           }else{
           filtro+=" WHERE tbIdCECO_Cod like('%')";
           }if(request.getParameter("txtVariable")!=null && !"".equals(request.getParameter("txtVariable")) ){
           
           filtro+="AND variablesfacturables.CodVariablesFacturables like('%"+request.getParameter("txtVariable")+"%')";
           }if(request.getParameter("txtTipoMoneda")!=null && !"".equals(request.getParameter("txtTipoMoneda")) ){
           
           filtro+="AND itemfacturable.tbidtiposmoneda like('%"+request.getParameter("txtTipoMoneda")+"%')";
           }
                      
                 HttpSession session = request.getSession();
                 session.setAttribute("filtroid", filtro);
                 response.sendRedirect("administraritemfacturable.jsp");
           
                 
           }else if(request.getParameter("btnModificarItem") != null && request.getParameter("mItem")!= null){
              int prim;
              ItemDTO modtem = new ItemDTO();
              prim = Integer.parseInt(request.getParameter("idFac"));
              modtem.setItemNombre(request.getParameter("txtNombreItem"));
           
              modtem.setItemValorUnit(Double.parseDouble(request.getParameter("txtValorItem")));
           
           
        modtem.setItemVariableFac(Integer.parseInt(request.getParameter("txtVariable")));
           
           modtem.setItemCeCo(request.getParameter("NomCeCo"));
           modtem.setItemFacturaClie(request.getParameter("txtFacCli"));
           modtem.setItemTipoMoneda(Integer.parseInt(request.getParameter("txtTipoMoneda")));
           modtem.setItemCorte(Integer.parseInt(request.getParameter("txtCorte")));
           modtem.setItemRangoImpacto(Integer.parseInt(request.getParameter("txtRangoImpac")));
           modtem.setItemCoordinador(request.getParameter("txtCordinadorEn"));
           
           ItemDAO itemdao = new ItemDAO();
           String mensaje = itemdao.modificarItem(modtem, prim);
           response.sendRedirect("modificarItem.jsp?msg=" + mensaje + " ***** " + prim);
           
           }
                
        else    {
                
                out.println("Esta intentando acceder de forma fraudulenta.....");
            }
            
  
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ServletMarlon</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ServletMarlon at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(ServletMarlon.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServletMarlon.class.getName()).log(Level.SEVERE, null, ex);
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
