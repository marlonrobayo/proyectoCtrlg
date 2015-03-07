<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!doctype html>
<html>
    <head>
        <link rel="shortcut icon" href="logo.ico" />
        <title>Control de gestión financiera</title>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
    </head>
    <body>

        <header>
            <figure> <img src="imagenes/logo.png" alt="logo" /> </figure>
            <figcaption> 
                <h1>Ctrl+G</h1>
            </figcaption>
            <div id= "logeo2">
                <h2> Control De Gestión </h2>

            </div>

        </header>
        <div id= "contenido">

            <div id ="image_index"> 

                <div id = "paraima">
                    <p class = "Lead">Sistema de información diseñado para optimizar los ingresos del Call Center, otorgándole el control total de los ingresos de su empresa.</p>

                </div> 
            </div>
            <div id = "Login">

                <h4>Ingreso al Sistema</h4>
                <form id="FormularioRgistro" role="form" action="Login">
                    
                        <div class="form-group">
                            <label  for="nommail">Correo Corporativo</label>
                            <input type="text" class="form-control" id="nommail" name="nommail" placeholder="carlos.santana" tabindex="1" required="">
                        </div>
                    


                    <div class="form-group">
                        <label for="Clave">Crontraseña</label>
                        <input type="password" class="form-control" id="clave" name="clave" placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;" tabindex="3" required="" >
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">Recordar Contraseña</label>
                    </div>
                    <input type="hidden" name="UserIn" id="UserIn" value=""/>
                    <button type="submit" class="btn btn-default" name="ValidUser" id="ValidUser">Ingresar</button>
                        
                </form>
                <br>
                <div class="text-right"><a href= "solicitaracceso.jsp" class="fontWi">Solicitar acceso</a> </div>
                <%   if (request.getParameter("sal") != null) { %>
                <div id="bg-info"> 
                <%  out.print(request.getParameter("sal"));  %>
             </div>
                <p></p>
                <p><a href= "recuperaclave.jsp">Recuperar contraseña</a> </p>
                <%}
                %>
            </div>
            
        </div>
    </body>

    <footer>©Año 2015 Ctrl+G - PROYECTO FORMATIVO</footer>
    <script>
        $().ready(function () {
            // validaciÃ³n del formulario
            $("#FormularioRgistro").validate({
                rules: {
                    nommail: {required: true, minlength: 5, maxlength: 40},
                    clave: {required: true, minlength: 6},
                },
                // highlight: function(element) {
                //   $(element).closest('.control-group')
                //   .removeClass('success').addClass('error');
                // },
                // success: function(element) {
                //   element
                //   .text('OK!').addClass('help-inline')
                //   .closest('.control-group')
                //   .removeClass('error').addClass('success');
                // }
            });
        });



    </script>



</html>
