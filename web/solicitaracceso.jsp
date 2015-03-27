<%@page import="Dto.RolesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.RolesDAO"%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="Logo.ico" />
        <title>Solicitar acceso</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link href="CSS/EstiloIncio.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <figure> <a href= "index.jsp"> <img src="imagenes/logo.png" alt="logo"/></a> </figure>
           <figcaption> 
                <div id= "logeo2">
                    <h1>Ctrl+G</h1>
                </div>
            </figcaption>
             <div id= "logeo2">
                <h2> Control De Gestión Financiera Para Ingresos</h2>
            </div>
        </header>
        <div id= "contenido">            
            <div class="collapse alert alert-warning alert-dismissible fade" role="alert"  id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModal1" aria-hidden="true" >
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>Atencion!</strong> No se ha registrado la información por favor verifique los campos del formulario.
            </div>
            <div>
            <center>    
            <h3 class="text-primary">Formulario Solicitud de Acceso</h3>
           </center>
           </div>             
          <div id = "ContenidoInternoSolicitud">
                <form id="FormularioRgistro" role="form" method="post" action="Personas"> 
                     <div id="Aleta"><span style="color:red;font-size: 16px;" > *</span>Campos obligatorios</div> 
                     <br>
                    <div class="form-inline">
                        <div class="form-group">
                            <label id = "ConAste"  for="nommail">Dirección de correo</label>
                            <input type="text" class="form-control" id="nommail" name="nommail" placeholder="Enter email" tabindex="1" required="">
                        </div>
                       <div class="form-group">
                        <label  id="name1" for="name1">Nombre y Apellidos</label>
                        <input type="text" class="form-control" id="name1" name="name1" placeholder="Su nombres y apellidos" tabindex="2" required="">
                        </div>
                        <div class="form-group">
                            <label id="cc" for="cc">Identificación personal</label>
                            <input type="text" class="form-control" id="cc" name="cc" placeholder="Número de cédula" tabindex="3" required="" >
                        </div>
                        <div class="form-group">
                            <label id = "celular"  for="celular">Número Celular</label>
                            <input type="text" class="form-control" id="celular" name = "celular" placeholder="3102408796" tabindex="4" required="" >
                        </div>
                         <div class="form-group">
                        <label id = "rol"  for="rol">Seleccione Cargo</label>
                        <%
                                                RolesDAO listRol = new RolesDAO();                                                
                                            %> 
                        <select class="form-control" name="rol" placeholder="Seleccion un Rol" id="rol"  tabindex="5" required=""/>
                        <option selected="true" disabled="disabled" value="no">Seleccione un Cargo</option>
                         <% ArrayList<RolesDTO> listaRoles = listRol.listarRoles();
                                            for (RolesDTO listar : listaRoles) {%>; 
                         <option value="<%=listar.getRolid()%>"><%=listar.getNamerol()%></option>                          
                         <% }%>
                        
                        </select>
                    </div>
                         <div class="form-group">
                            <label id="contra"  for="contra">Su Contraseña</label>
                            <input type="password" class="form-control" id="contra" name="contra" placeholder="Su Contraseña" tabindex="6" required="" >
                        </div>
                    </div>
                         <div class="space"><br></div>
                         <input type="hidden" name="newSolcitud" id="newSolcitud" value="" />
                    <button type="submit" class="btn btn-primary" data-toggle="collapse"   href=".alert-success" data-target="#myModal" tabindex="7" id="solicitudReg" name="solicitudReg" >Solicitar</button>
                    <button type="button" class="btn btn-danger"  tabindex="8" onclick="myFunction();" >Cancelar</button>
                </form>
            </div>              
        </div>
    </center> 
    <footer>Âño 2014 Ctrl+G - proyecto formativo</footer>
    <script>
        $().ready(function () {
            // validaciÃ³n del formulario
            $("#FormularioRgistro").validate({
                rules: {
                    nommail: {required: true, minlength: 5, maxlength: 40},
                    name1:{required: true, minlength: 5, maxlength: 45}
                    clave: {required: true, minlength: 6},
                    telefono: {required: true, minlength: 5, maxlength: 5},
                    celular: {required: true, minlength: 9, maxlength: 9},
                    contra:{required: true, minlength: 5, maxlength: 45}
                }
            });
        });
    </script>
    <script>
      function myFunction() {
          location.href = "index.jsp";
      }
    </script>
 </body>
</html>
