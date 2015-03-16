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
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
    </head>
    <body>
        <header>
            <figure> <a href= "index.jsp"> <img src="imagenes/logo.png" alt="logo"/></a> </figure>
            <figcaption> <a href="index.jsp">
                    <h1>Ctrl+G</h1>
                </a> </figcaption>
            <div id= "logeo2">
                <h2>Control De Gestión</h2>
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
                <form id="FormularioRgistro" role="form" method="get" action="index.jsp"> 
                     <div id="Aleta"><span style="color:red;font-size: 16px;" > *</span> Campos obligatorios</div> 
                     <br>
                    <div class="form-inline">
                        <div class="form-group">
                            <label id = "ConAste"  for="nommail">Dirección de correo</label>
                            <input type="text" class="form-control" id="nommail" name="nommail"placeholder="Enter email" tabindex="1" required="">
                        </div>
                        <div class="form-group">
                            <label  for="exampleInputEmail2">Dominio</label>
                            <div class="input-group">
                                <div class="input-group-addon">@</div>
                                <input class="form-control" type="email" placeholder="callcentercsc.com" disabled tabindex="2" required="">
                            </div>
                        </div>
                         <div class="form-group">
                        <label  id="ConAste" for="name1">Nombre y Apellidos</label>
                        <input type="text" class="form-control" id="name1" name="name1" placeholder="Su nombres y apellidos" tabindex="2" requiered="">
                        </div>
                        <div class="form-group">
                            <label id = "ConAste" for="Clave">Identificación personal</label>
                            <input type="text" class="form-control" id="Clave" name = "clave" placeholder="Número de cédula" tabindex="3" required="" >
                        </div>
                        <div class="form-group">
                            <label id = "ConAste"  for="celular">Número Celular</label>
                            <input type="text" class="form-control" id="celular" name = "celular" placeholder="3102408796" tabindex="5" required="" >
                        </div>
                         <div class="form-group">
                        <label id = "ConAste"  for="rol">Seleccione Cargo</label>
                        <%
                                                RolesDAO listRol = new RolesDAO();                                                
                                            %> 
                        <select class="form-control" name="rol" placeholder="Seleccion un Rol" id="rol"  tabindex="3" requiered=""/>
                         <option selected="true" disabled="disabled">Seleccione un Cargo</option>
                         <% ArrayList<RolesDTO> listaRoles = listRol.listarRoles();
                                            for (RolesDTO listar : listaRoles) {%>; 
                         <option value="<%=listar.getRolid()%>"><%=listar.getNamerol()%></option>                          
                         <% }%>
                        
                        </select>
                    </div>
                    </div>
                         <div class="space"><br><br></div>
                    <button type="submit" class="btn btn-primary" data-toggle="collapse"   href=".alert-success" data-target="#myModal" tabindex="6" >Solicitar</button>
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
                    clave: {required: true, minlength: 6},
                    telefono: {required: true, minlength: 5, maxlength: 5},
                    celular: {required: true, minlength: 9, maxlength: 9},
                    Cargo: {required: true}
                }
            });
        });
    </script>
 </body>
</html>
