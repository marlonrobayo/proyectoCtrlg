<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <title>Confirmación del Proceso</title>       
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link href="CSS/EstiloIncio.css" rel="stylesheet" type="text/css"/>
         <script src="js/bootstrap.js"></script>
        <link rel="shortcut icon" href="Logo.ico" />
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
          
           <div id="contenido">
               <br><br>
            <div class="row"> 
                <div class="col-sm-1"></div>
                <div class="col-md-10"><nav id="submenu"> <a href="index.jsp">Pagina de Inicio</a></nav>
                <%  if (request.getParameter("msg") != null) {%>
                    <div class="alert alert-info text-center confirmarOK" role="alert"><%=request.getParameter("msg")%></div>        
                    <% }%>
                
                </div>                    
                <div class="col-md-1"></div>
            </div>            
           
        </div>       
    <footer>Año 2014 Ctrl+G - proyecto formativo</footer>
   </body>
</html>
