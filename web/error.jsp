<%-- 
    Document   : error
    Created on : 13/11/2014, 06:36:00 PM
    Author     : Angelica
--%>

<%@page import="Utilidades.MiExcepcion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.PermisosDTO"%>
<%@page import="Dto.UsuarioDTO"%>
<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />

        

        <script src="js/jquery.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <link href="CSS/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/paging.js" type="text/javascript"></script>

        <title>Error.............</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(false);

            if (sesion.getAttribute("varDatosU") == null) {
                response.sendRedirect("page/error.jsp");
            } else {
                ArrayList<PermisosDTO> listaPermi = (ArrayList) sesion.getAttribute("varMenu");
        %>
        <header>
            <figure> <a href= "administraritemfacturable.jsp"> <img src="imagenes/logo.png" alt="logo" /></a> </figure>
            <figcaption> <a href= "parametrizaritemfacturable.jsp">
                    <h1>Ctrl+G</h1>
                </a> </figcaption>
            <nav > 

                <%for (PermisosDTO permi : listaPermi) {%> 

                <a href="<%out.print(permi.getUrl());%>"> <%out.print(permi.getNombrePagina());%> </a>


                <%}%>
                

            </nav>
            

        </header>
                <div id= "panel">  
                    
                    <div id="logeo">
                        <%
                            UsuarioDTO usuarioMostrar = new UsuarioDTO();
                            usuarioMostrar = (UsuarioDTO) sesion.getAttribute("varDatosU");
                            out.print(usuarioMostrar.getPernombre());
            }

                        %>


                <a href="cerrarsesion.jsp"><h6>Cerrar Sesión</h6></a> 
               

            </div>  
</div>

        
        <div id="error">
            
            <h2>Se produjo un ERROR inténtelo de nuevo más tarde o contáctese con el administrador.!
                <strong>
            <%= exception.toString()%>
            <%exception.printStackTrace();%>
            </strong>
            </h2>
            
        </div>
        
    </body>
</html>
