<%@page import="Dto.RolesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.RolesDAO"%>
<%@page import="Dto.PersonasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />
        <title>Crear Usuario</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <script src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
                   <%
                    HttpSession sesion = request.getSession(false);
                    if (sesion.getAttribute("varDatosU") == null) {
                        response.sendRedirect("index.jsp");
                    } else {
                        
                    } %>                     
             
        <div id="contenido1"> 
           <div id ="ContenidoInterno3">
               <% if (request.getParameter("msg") != null) {  %>
                   <div class="bg-info confirmarOK text-center"><%=request.getParameter("msg")%></div>
                <% } %>
               <form id="crearUsuario" role="form" method="post" action="Personas" name="crearUsuario">
                             <h4>Crear Nuevo Usuario:</h4>
                    <div id="Aleta"><span style="color:red;font-size: 12px;" >*</span>Campos Obligatorios</div> 
                    <div class="form-group">
                        <label  for="cc" id="ConAste">Cédula</label>
                        <input type="text" class="form-control" id="cc" name="cc" placeholder="Numero de cedula" tabindex="1" required="">
                    </div>
                    <div class="form-group">
                        <label  id="ConAste" for="name1">Nombre y Apellido</label>
                        <input type="text" class="form-control" id="name1" name="name1" placeholder="su nombres y apellidos" tabindex="2" requiered="">
                    </div>
                    <div class="form-group">
                        <label id = "ConAste"  for="rol">Seleccione un Rol</label>
                        <%
                                                RolesDAO listRol = new RolesDAO();                                                
                                            %> 
                        <select class="form-control" name="rol" placeholder="Seleccion un Rol" id="rol"  tabindex="3" requiered=""/>
                         <option selected="true" disabled="disabled">Seleccione un Rol</option>
                         <% ArrayList<RolesDTO> listaRoles = listRol.listarRoles();
                                            for (RolesDTO listar : listaRoles) {%>; 
                         <option value="<%=listar.getRolid()%>"><%=listar.getNamerol()%></option>                          
                         <% }%>
                        
                        </select>
                    </div>
                    <div class="form-group">
                        <label id = "ConAste" for="estado" >Estado</label>
                        <select class="form-control" name="estado" placeholder="Estado" id="estado" requiered="" tabindex="4" />
                        <option selected="true" disabled="disabled">Seleccione un Estado</option>
                        <option label="Activo" value=1>Activo</option>
                        <option label="Inactivo" value=0>Inactivo</option> 
                        </select>
                    </div>   
                    <div class="form-group">
                        <label  id="ConAste" for="email1">Correo</label>
                        <input type="text" class="form-control" id="email1" name="email1" placeholder="email@dominio.com" tabindex="5" requiered="">
                    </div> 
                    <div class="form-group">
                        <label id="ConAste" for="pass">Contraseña</label>
                        <input type="password" class="form-control" id="pass" name="pass" placeholder="************" tabindex="6" requiered="" >
                    </div>
                <input type="hidden" name="newPer" id="NewClient" value="" />
                <button type="submit" class="btn btn-primary btn-info" tabindex="7" name="registraPer" >Registrar</button>
                </form><br>              
    </div>            
</div>
  
  <script>
    $().ready(function() {
    // validación del formulario
    $("#crearUsuario").validate({
      rules: {
        cc :{required: true, digits: true, minlength:7, maxlength: 12 },  
        name1 :{required: true },
        rol{required: true },  
        estado :{required: true},
        email :{required: true, minlength:8 , maxlength: 25 },
        pass :{required: true,minlength: 8, maxlength: 45 },
        
      } 
    });
  });
  $.validator.addMethod("caracteres", function(value, element) {
  return this.optional(element) || /[a-zA-Z][^W*]/.test(value);
  if ( /[^0-9 \-]+/.test(value) ) {return false;}
  }, "Los numeros no son validos");
  </script>
  
  <!-- InstanceEndEditable --> 
</body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
<!-- InstanceEnd -->
</html>
