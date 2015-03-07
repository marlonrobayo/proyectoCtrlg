<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />
        <title>Cliente parametrizar</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <script src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
        <header>
            <figure> <a href= "ParametrizarItemFacturable.html"> <img src="imagenes/logo.png" alt="logo" /></a> </figure>
            <figcaption> <a href= "ParametrizarItemFacturable.html">
                    <h1>Ctrl+G</h1>
                </a> </figcaption>
            <nav> 
                <a href= "parametrizaritemfacturable.jsp">Parámetros</a> 
                <a href= "metas.jsp">Metas mes</a> 
                <a href= "resultados.jsp"> Resultados</a> 
                <a href= "conciliacion.jsp"> Conciliación</a> </nav>
            <div id="logeo">

                <%
                    HttpSession sesion = request.getSession(false);
                    if (sesion.getAttribute("varDatosU") == null) {
                        response.sendRedirect("index.jsp");
                    } else {

                        UsuarioDTO usuarioMostrar = new UsuarioDTO();
                        usuarioMostrar = (UsuarioDTO) sesion.getAttribute("varDatosU");

                        out.print("Bienvenido: " + usuarioMostrar.getPernombre());
                    }

                %><br>
                <div id="logeo"><a href="cerrarsesion.jsp">Cerrar Sesión</a></div>          
            </div> 
        </header>
        <div id="contenido"> 
            <h4>Administración de Usuarios</h4>
            <nav id="submenu"> 
                <a href="parametrizaritemfacturable.jsp">Inicio</a> 
                <a href="gestionuseredit.jsp">Editar Usuarios</a>
            </nav>
            <div id ="ContenidoInterno">
                <% if (request.getParameter("msg") != null) {  %>
                <div class="bg-info confirmarOK"><%=request.getParameter("msg")%></div>
                <% } %>
               <form id="crearUsuario" role="form" method="post" action="Personas" name="crearUsuario">
                             <h4>Crear un Usuario:</h4>
                    <div id="Aleta"><span style="color:red;font-size: 12px;" >*</span>Campos obligatorios</div> 
                    <div class="form-group">
                        <label  for="cc" id="ConAste">Cedula</label>
                        <input type="text" class="form-control" id="cc" name="cc" placeholder="Numero de cedula" tabindex="1" requiered="true">
                    </div>
                    <div class="form-group">
                        <label  id="ConAste" for="name1">Nombre y Apellido</label>
                        <input type="text" class="form-control" id="name1" name="name1" placeholder="su nombres y apellidos" tabindex="2" requiered="true">
                    </div>
                    <div class="form-group">
                        <label id = "ConAste"  for="rol">Seleccione un rol</label>
                        <select class="form-control" name="rol" placeholder="Seleccion un Rol" id = "rol" requiered="TRUE" tabindex="3" requiered="true"/>
                        <option selected="true" disabled="disabled">Seleccione Rol</option>
                        <option value=1>Administrador</option>
                        <option value=2>Analista</option>
                        <option value=3>Gerente</option>
                        <option value=4>Coordinador</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label id = "ConAste" for="estado" >Estado</label>
                        <select class="form-control" name="estado" placeholder="Estado" id="estado" requiered="true" tabindex="4"/>
                        <option selected="true" disabled="disabled">Seleccione un Estado</option>
                        <option label="Activo" value=1>Activo</option>
                        <option label="Inactivo" value=0>Inactivo</option> 
                        </select>
                    </div>   
                    <div class="form-group">
                        <label  id="ConAste" for="email" ConAste>Correo</label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="email@dominio.com" tabindex="5" requiered="true">
                    </div> 
                    <div class="form-group">
                        <label id="ConAste" for="pass">Contraseña</label>
                        <input type="password" class="form-control" id="pass" name="pass" placeholder="************" tabindex="6" requiered="true" >
                    </div>
                <input type="hidden" name="newPer" id="NewClient" value="" />
                <button type="submit" class="btn btn-primary btn-info" href=".alert-success" data-target="#myModal" tabindex="7" name="registraPer" >Registrar nuevo usuario</button>
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
<div id= "panel"> </div>
</body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
<!-- InstanceEnd -->
</html>
