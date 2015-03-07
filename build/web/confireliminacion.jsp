<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.PersonasDTO"%>
<!doctype html>
<html>
    <head>
        <title>Confirmación de Eliminación</title>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <link href="CSS/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/paging.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />
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

                        PersonasDTO usuarioMostrar = new PersonasDTO();
                        usuarioMostrar = (PersonasDTO) sesion.getAttribute("varDatosU");

                        out.print("Bienvenido: " + usuarioMostrar.getNombreCompleto());
                    }

                %><br>
                <div id="logeo"><a href="cerrarsesion.jsp">Cerrar Sesión</a></div>          
            </div> 
        </header>

        <div class="container">      
            <div class="row"> 
                <div class="col-sm-2"></div>
                <div class="col-md-10"><nav id="submenu"> <a href="gestionuseredit.jsp">Volver</a>
                <%  if (request.getParameter("msg") != null) {%>
                    <div class="alert alert-info text-center confirmarOK" role="alert"><%=request.getParameter("msg")%></div>        
                    <% }%>
                
                </div>                    
                <div class="col-md-0"></div>
            </div>  
           
            <div><p class="space"></p></div>

        </div>
    </body>
    <footer>Año 2014 Ctrl+G - proyecto formativo</footer>
</html>
