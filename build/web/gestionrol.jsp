<%@page import="Dto.PersonasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />
        <title>Crear Rol</title>
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

                        PersonasDTO usuarioMostrar = new PersonasDTO();
                        usuarioMostrar = (PersonasDTO) sesion.getAttribute("varDatosU");
                        //out.print("Bienvenido: " + usuarioMostrar.getNombreCompleto());
                    }

                %>            
                   
        <div id="contenido1"> 
           <div id ="ContenidoInterno3">
                <% if (request.getParameter("msg") != null) {  %>
                <div class="bg-info confirmarOK"><%=request.getParameter("msg")%></div>
                <% } %>
               <form id="crearUsuario" role="form" method="post" action="Roles" name="crearUsuario">
                             <h4>Crear Nuevo Rol</h4>
                    <div id="Aleta"><span style="color:red;font-size: 12px;" >*</span>Campos obligatorios</div> 
                    <div class="form-group">
                        <label  for="idrol1" id="ConAste">Id Rol</label>
                        <input type="text" class="form-control" id="idrol1" name="idrol1" placeholder="ID rol" tabindex="1" requiered="true">
                    </div>
                    <div class="form-group">
                        <label  for="namerol" id="ConAste">Nombre Rol</label>
                        <input type="text" class="form-control" id="namerol" name="namerol" placeholder="Como se llamará el rol" tabindex="2" requiered="true">
                    </div>
                     <h4 class="text-capitalize">Permisos del Rol:</h4>
                    <div class="form-group">
                         <div class="col-sm-offset-2 col-sm-10">
                             <div class="checkbox">
                                 <label>
                                     <input type="checkbox"> Página Usuario
                                 </label>
                             </div>
                         </div>
                     </div>
                     <div class="form-group">
                         <div class="col-sm-offset-2 col-sm-10">
                             <div class="checkbox">
                                 <label>
                                     <input type="checkbox"> Página Clientes
                                 </label>
                             </div>
                         </div>
                     </div>
                      <div class="form-group">
                         <div class="col-sm-offset-2 col-sm-10">
                             <div class="checkbox">
                                 <label>
                                     <input type="checkbox"> Página CeCos
                                 </label>
                             </div>
                         </div>
                     </div>
                      <div class="form-group">
                         <div class="col-sm-offset-2 col-sm-10">
                             <div class="checkbox">
                                 <label>
                                     <input type="checkbox"> Item's Facturables
                                 </label>
                             </div>
                         </div>
                     </div>
                      <div class="form-group">
                         <div class="col-sm-offset-2 col-sm-10">
                             <div class="checkbox">
                                 <label>
                                     <input type="checkbox"> Metas y Resultados
                                 </label>
                             </div>
                         </div>
                     </div>
                      <div class="form-group">
                         <div class="col-sm-offset-2 col-sm-10">
                             <div class="checkbox">
                                 <label>
                                     <input type="checkbox"> Página Conciliación
                                 </label>
                             </div>
                         </div>
                     </div>
                      
                <input type="hidden" name="newRol" id="NewClient" value="" />
                <button type="submit" class="btn btn-primary btn-info" href=".alert-success" data-target="#myModal" tabindex="7" name="registraRol" >Registrar nuevo Rol</button>
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
