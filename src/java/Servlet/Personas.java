/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Dto.MensajeDTO;
import Dto.PersonasDTO;
import Modelo.EmailDAO;
import Modelo.PersonasDAO;
import Utilidades.Email;
import Utilidades.MyErrorExcepcion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HenryRG
 */
public class Personas extends HttpServlet {

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
            throws ServletException, IOException, MyErrorExcepcion, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            if(request.getParameter("registraPer")!=null && request.getParameter("newPer")!=null){
               
                // recogemos los datos del formulario mediante el objeto request y los asignamos al objeto dto
                //Recordar que si hay enteros toca hacer cast primero porque por defecto todos los campos del formulario
                //legan como texto
                
                
                PersonasDAO personaCrear = new PersonasDAO();
                PersonasDTO personaReg = new PersonasDTO();
                
                String idUserTrae = request.getParameter("cc");
                        
                personaReg.setCc(request.getParameter("cc"));
                personaReg.setNombreCompleto(request.getParameter("name1"));
                personaReg.setEstadouser(Integer.parseInt(request.getParameter("estado")));
                personaReg.setLoginuser(request.getParameter("email1"));
                personaReg.setRoluserint(Integer.parseInt(request.getParameter("rol")));
                personaReg.setContrasena(request.getParameter("pass"));
                
                //Luego de tener el objeto dto creado y "cargado" con los datos del formulario, creamos el DAO
                // y llamamos el metodo para registrar un nuevo profesor. recordar que ese metodo devuelve una cadena
                String mensaje =(personaCrear.crearRegistroPersona(personaReg, idUserTrae));
                //Una vez recibido el mensaje el siguiente paso es reenviarlo al usuario en la interfaz
                
               response.sendRedirect("gestionuser.jsp?msg="+mensaje);  // lo pasamos como atributo usando el metodo get
       
                
                
            }else if(request.getParameter("btnUpdatePersona") != null && request.getParameter("updatePersona") != null) {

                // recogemos los datos del formulario mediante el objeto request y los asignamos al objeto dto
                //Recordar que si hay enteros toca hacer cast primero porque por defecto todos los campos del formulario
                //legan como texto
                
                PersonasDAO personaActualizar = new PersonasDAO();
                PersonasDTO personaUpdate = new PersonasDTO();
                
                personaUpdate.setCc(request.getParameter("cc"));
                personaUpdate.setNombreCompleto(request.getParameter("name1"));
                personaUpdate.setRoluserint(Integer.parseInt(request.getParameter("rol")));
                personaUpdate.setEstadouser(Integer.parseInt(request.getParameter("estado")));
                personaUpdate.setLoginuser(request.getParameter("email"));
                personaUpdate.setContrasena(request.getParameter("pass"));
                
              
                //Luego de tener el objeto dto creado y "cargado" con los datos del formulario, creamos el DAO
                // y llamamos el metodo para registrar un nuevo profesor. recordar que ese metodo devuelve una cadena
                String mensaje = (personaActualizar.modificarRegistro(personaUpdate));

                //Una vez recibido el mensaje el siguiente paso es reenviarlo al usuario en la interfaz
                response.sendRedirect("gestionuser1.jsp?msg=" + mensaje);  // lo pasamos como atributo usando el metodo get
                
            }
            
            else if(request.getParameter("listarId")!=null && request.getParameter("CargaSelect")!=null){
                String numeroID;
                // recogemos los datos del formulario mediante el objeto request y los asignamos al objeto dto
                //Recordar que si hay enteros toca hacer cast primero porque por defecto todos los campos del formulario
                //legan como texto
                if (request.getParameter("idtextbuscar")!= null && !request.getParameter("idtextbuscar").equals("")){
                numeroID = (request.getParameter("idtextbuscar")); 
                session.setAttribute("idlistar", numeroID);
                response.sendRedirect("gestionuseredit.jsp"); }
                else{
                 session.setAttribute("idlistar", "");
                 session.removeAttribute("idlistar");
                 response.sendRedirect("gestionuseredit.jsp"); 
                }                
              
            }      
                        
            else if(request.getParameter("newSolcitud")!=null && request.getParameter("solicitudReg")!=null){
               
                // recogemos los datos del formulario mediante el objeto request y los asignamos al objeto dto
                //Recordar que si hay enteros toca hacer cast primero porque por defecto todos los campos del formulario
                //legan como texto
                int estadoDefault =0;
                int estadoRolNum =5;
                String mensaje ="";
                String mensajeRTA = "";
                String base = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$";
                int LargoContrasena=8;
                String contrasena="";
                int longitud = base.length();
                for(int i=0; i<LargoContrasena;i++){ 
                int numero = (int)(Math.random()*(longitud)); 
                String caracter=base.substring(numero, numero+1); 
                contrasena=contrasena+caracter; }                          
               
                Date today = new Date();
                SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String date = DATE_FORMAT.format(today);
                
                
                PersonasDAO personaCrear = new PersonasDAO();
                PersonasDTO personaReg = new PersonasDTO();
                
                String idUserTrae = request.getParameter("cc");
                        
                personaReg.setCc(request.getParameter("cc"));
                personaReg.setNombreCompleto(request.getParameter("name1"));
                personaReg.setEstadouser(estadoDefault);
                personaReg.setLoginuser(request.getParameter("nommail"));
                personaReg.setContrasena(contrasena);
                personaReg.setCelu(Integer.parseInt(request.getParameter("celular")));
                personaReg.setFehcaIn(date);                
                personaReg.setRoluserint(estadoRolNum);
                
                mensaje = (personaCrear.crearRegistroSolicitudP(personaReg, idUserTrae));             
                
                if (mensaje != "OKUSER"){
                
                String emailFrom = ("henry.rodriguez@energiaintegralandina.com");
                String emailTo = request.getParameter("nommail");
                String asunto = ("Informacion de Registro");
                String textmensaje = ("Gracias por registrarse en CtrlG, sus datos de ingreso son Usuario: "+ emailTo + ", Su Contraseña:"+ contrasena);
                EmailDAO msjDAO = new EmailDAO();
                MensajeDTO msjDTO = new MensajeDTO(emailTo, emailFrom, asunto, textmensaje);
                                      
                Email envioEmail = new Email("smtpout.secureserver.net", "25", msjDTO);
                mensajeRTA = envioEmail.enviarEmail(asunto, textmensaje);
                msjDAO.crearRegistroMail(msjDTO);
                response.sendRedirect("solicitaracceso.jsp?msg="+ mensaje +",  "+ mensajeRTA );
                }
                else {
                mensaje ="El usuario ya existe con el numero de identificacion ingresado!!";    
                response.sendRedirect("solicitaracceso.jsp?msg="+ mensaje );  
                }      
                
            }
            
            else{
                
                out.println("Esta intentando acceder de forma fraudulenta");
            }
              
            
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Personas</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Personas at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        } 
        catch (SQLException ex) {
            String mensaje1 = "Error SQL: " + ex.getErrorCode() + " - " + ex.getMessage();
            if(ex.getErrorCode() == 1452){
                mensaje1 = "Su e-mail no está registrado para enviar mensajes.";
                response.sendRedirect("solicitaracceso.jsp?msg="+ mensaje1);
            }
            session.setAttribute("mensaje", mensaje1);
        } catch (Exception ex) {
            String mensaje1 = "Error en el servidor: " + ex.getMessage();
            session.setAttribute("mensaje", mensaje1);
            response.sendRedirect("solicitaracceso.jsp?msg="+ mensaje1);
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
        } catch (MyErrorExcepcion | SQLException ex) {
            Logger.getLogger(Personas.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (MyErrorExcepcion | SQLException ex) {
            Logger.getLogger(Personas.class.getName()).log(Level.SEVERE, null, ex);
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
