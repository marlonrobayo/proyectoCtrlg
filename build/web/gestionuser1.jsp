<%@page import="Dto.RolesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.RolesDAO"%>
<%@page import="Modelo.PersonasDAO"%>
<%@page import="Dto.PersonasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
   
    <%   HttpSession sesion = request.getSession(false);
        if (sesion.getAttribute("varDatosU") == null) {
            response.sendRedirect("index.jsp");
        } else {
                
        }
        
        String idcodigouser;
        idcodigouser = (request.getParameter("idclie"));
        if (idcodigouser != "" && idcodigouser != null) {
            idcodigouser = (request.getParameter("idclie"));
            }  
        
        PersonasDAO perActualizar = new PersonasDAO();
        PersonasDTO perUpdate = perActualizar.listarByIdPer(idcodigouser);       
     %>     
         
    <head>
         <title>Modificar Usuario</title>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />
        <script src="js/jquery.js"></script>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="js/paging.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
    </head>
    <body>                  
 
        <div id="contenido1"> 
            <div class="row"> 
                <div class="col-md-2"></div> 
                <div class="col-md-8">
                       <div id ="ContenidoInterno3">
                <% if (request.getParameter("msg") != null) {  %>
                <div class="bg-info confirmarOK"><%=request.getParameter("msg")%></div>
                <% } %>
                
                <form id="crearUsuario" role="form" method="post" action="Personas" name="UpdateUser">
                    <h4>Modificación de Usuario</h4>
                    <div id="Aleta"><span style="color:red;font-size: 12px;" >*</span>Campos Obligatorios</div> 
                    <div class="form-group">
                        <label  for="cc" id="ConAste">Cédula</label>
                        <input type="text" class="form-control" id="cc" name="cc" placeholder="Numero de cedula" tabindex="1" requiered="true" value="<% if (perUpdate != null) {
                                out.print(perUpdate.getCc());
                            }%>">
                    </div>
                    <div class="form-group">
                        <label  id="ConAste" for="name1">Nombre y Apellido</label>
                        <input type="text" class="form-control" id="name1" name="name1" placeholder="su nombres y apellidos" tabindex="2" requiered="true" value="<% if (perUpdate != null) {
                                out.print(perUpdate.getNombreCompleto());
                            }%>">
                    </div>
                   <div class="form-group">
                        <label id = "ConAste"  for="rol">Seleccione un Rol</label>
                                            <%
                                                RolesDAO listRol = new RolesDAO();                                                
                                            %> 
                        <select class="form-control" name="rol" placeholder="Seleccion un Rol" id="rol"  tabindex="3" requiered=""/>
                         <option selected="true" value="<% if (perUpdate != null) { out.print(perUpdate.getRoluserint()); } %>"><% if (perUpdate != null) { out.print(perUpdate.getRoluser()); } %></option>
                         <% ArrayList<RolesDTO> listaRoles = listRol.listarRoles();
                                            for (RolesDTO listar : listaRoles) {%>; 
                         <option  value="<%=listar.getRolid()%>"><%=listar.getNamerol()%></option>                          
                         <% }%>
                        
                        </select>
                    </div>
                    <div class="form-group">
                        <label id = "ConAste" for="estado" >Estado</label>
                        <select class="form-control" name="estado" placeholder="Estado" id="estado" requiered="true" tabindex="4"/>                        
                        <% if (perUpdate != null) {
                        int idEstado = (perUpdate.getEstadouser());
                             if (idEstado == 1) { %>
                        <option value=1 selected="true">Activo</option>
                        <%   } else if (idEstado == 0) {  %>
                        <option value=0 selected="true">Inactivo</option>                                            
                        <%   } else { %>
                        <option selected="true" disabled="disabled">Seleccione Estado</option>
                        <%  } }%> 
                        <option label="Activo" value=1>Activo</option>
                        <option label="Inactivo" value=0>Inactivo</option> 
                        </select>
                    </div>   
                    <div class="form-group">
                        <label  id="ConAste" for="email" ConAste>Correo</label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="email@dominio.com" tabindex="5" requiered="true" value="<% if (perUpdate != null) {
                                out.print(perUpdate.getLoginuser());
                            }%>">
                    </div> 
                    <div class="form-group">
                        <label id="ConAste" for="pass">Contraseña</label>
                        <input type="password" class="form-control" id="pass" name="pass" placeholder="*********" tabindex="6" requiered="true" value="<% if (perUpdate != null) {
                                out.print(perUpdate.getContrasena());
                            }%>" >
                    </div>
                    <input type="hidden" name="updatePersona" id="updatePersona" value="" />
                    <button type="submit" class="btn btn-default" tabindex="7" name="btnUpdatePersona" >Guardar Cambios</button>
                </form><br>
              </div>
             </div>
           <div class="col-md-2"></div>         
           </div>
        </div>

        <script>
                    $().ready(function() {
            // validación del formulario
            $("#UpdateUser").validate({
            rules: {
                    
                    cc :{required: true },
                    name1 :{ required: true},
                    estado :{required: true},
                    email :{required: true, minlength:8, maxlength: 25 },
                    pass :{required: true, minlength: 8, maxlength: 45 }
            }
            });
            });
                    $.validator.addMethod("caracteres", function(value, element) {
                    return this.optional(element) || /[a-zA-Z][^W*]/.test(value);
                            if (/[^0-9 \-]+/.test(value)) {return false; }
                    }, "Los numeros no son validos");
        </script>
        <!-- InstanceEndEditable --> 
    
    </body>
    <footer>Año 2014 Ctrl+G - proyecto formativo</footer>
    <!-- InstanceEnd -->
</html>
