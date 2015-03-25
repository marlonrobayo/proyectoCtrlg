<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!doctype html>
<html>
    <head>
        <link rel="" href="logo.ico" />
        <title>Control de gestión financiera de Call Center</title>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="CSS/EstiloIncio.css">
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>              
    </head>
    <body>
        <header>
            <figure> <img src="imagenes/logo.png" alt="logo" /> </figure>
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
        <div id="wowslider-container1">
        <div class="ws_images"><ul>
        <li><img src="imagenes/slide/1.jpg" alt="" title="" id="wows1_0"/></li>
        <li><img src="imagenes/slide/2.png" alt="" title="" id="wows1_1"/></li>
        <li><img src="imagenes/slide/3.jpg" alt="" title="" id="wows1_2"/></li>
        </ul></div>
        <div class="ws_bullets"><div>
        <a href="#" title="1">1</a>
        <a href="#" title="2">2</a>
        <a href="#" title="3">3</a>
        </div></div>
        <div class="ws_shadow"></div>
        </div></div>
        <div id="contenido">            
         <div class="row">
             <div class="col-md-9">
             <nav > 
                <a href="#">Visión</a>
                <a href="#">Misión</a>
             </nav>
                 <div id="image_index">
                   <p class="ext-left">       
                     Toma el control y respira tranquilo
                     Ahora puedes controlar, mejorar la toma decisiones y hacer gestión integral de negocios y tus ingresos con el sistema de gestión de información CTRL+G . 
                     Sus módulos de Ítems Facturables y Metas te permiten tener un seguimiento detallado de cada uno de los indicadores. Con su generador de reportes tienes información actualizada y confiable 
                     asegurándote a tomar decisiones profesionalmente. Además recibes alertas sobre puntos de ataque crítico en tu correo para cuidar tus ingresos.
                    </p> 
                 </div>       
                 
             </div>
         <div class="col-md-3">
             <div id="Login">
                 <fieldset class="text-primary h3">Ingresar al Sistema</fieldset>
             <form id="FormularioRgistro" role="form" action="Login">
                 <div class="form-group">
                     <label for="nommail">Usuario</label>
                     <input type="text" class="form-control" id="nommail" name="nommail" placeholder="Ingrese Usuario" required="">
                 </div>
                 <div class="form-group">
                     <label for="clave">Contraseña</label>
                     <input type="password" class="form-control" id="clave" name="clave" placeholder="Su contraseña" required="">
                 </div>                   
                 <input type="hidden" name="UserIn" id="UserIn" value=""/>
                 <button type="submit" class="btn btn-warning" name="ValidUser" id="ValidUser">Ingresar</button>
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
         </div>
            <div class="spacio"></div>
    </div>
    <footer>©Año 2015 Ctrl+G - PROYECTO FORMATIVO</footer>
  <script src="js/engine/wowslider.js" type="text/javascript"></script>
 <script src="js/engine/script.js" type="text/javascript"></script>
<script>
        $().ready(function () {
            $("#FormularioRgistro").validate({
                rules: {
                    nommail: {required: true, minlength: 5, maxlength: 40},
                    clave: {required: true, minlength: 6}
                }
              
            });
        });
    </script>

 </body>
</html>
