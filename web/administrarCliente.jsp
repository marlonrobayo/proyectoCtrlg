<%@page import="Dto.ClientesDTO"%>
<%@page import="Modelo.ClienteDAO"%>
<%@page import="Dto.TipoMonedaDTO"%>
<%@page import="Modelo.TipoMonedaDAO"%>
<%@page import="Dto.VariableFacDTO"%>
<%@page import="Modelo.VariableFacDAO"%>
<%@page import="Modelo.CecoDAO"%>
<%@page import="Dto.CecoDTO"%>
<%@page import="Dto.ItemDTO"%>
<%@page import="Modelo.ItemDAO"%>
<%@page import="Modelo.PermisosDAO"%>
<%@page import="Dto.PermisosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.PersonasDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!doctype html>


<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="shortcut icon" href="Logo.ico" />

        <title>Administrar Item facturable</title>

        <script src="js/jquery.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <link href="CSS/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/paging.js" type="text/javascript"></script>


    </head>
    <body>



        <%
            HttpSession sesion = request.getSession(false);

            if (sesion.getAttribute("varDatosU") == null) {
                response.sendRedirect("index.jsp");
            } else {
                ArrayList<PermisosDTO> listaPermi = (ArrayList) sesion.getAttribute("varMenu");
        %>
        <header>
            <figure> <a href= "administraritemfacturable.jsp"> <img src="imagenes/logo.png" alt="logo" /></a> </figure>
            <figcaption> <a href= "parametrizaritemfacturable.jsp">
                    <h1>Ctrl+G</h1>
                </a> </figcaption>
            <nav> 

                <%for (PermisosDTO permi : listaPermi) {%> 

                <a href="<%out.print(permi.getUrl());%>"> <%out.print(permi.getNombrePagina());%> </a>


                <%}%>                

            </nav>


        </header>
        <div id= "panel">  

            <div id="logeo">
                <%
                    PersonasDTO usuarioMostrar = new PersonasDTO();
                    usuarioMostrar = (PersonasDTO) sesion.getAttribute("varDatosU");
                    out.print(usuarioMostrar.getNombreCompleto());

                %>


                <a href="cerrarsesion.jsp"><h6>Cerrar Sesión</h6></a> 


            </div>  
        </div>

        <div id= "contenido"> 

            <h4>Clientes Corporativos prueba de cambios</h4>
            
            
            
            
            <hr>
            <% ClienteDAO listf = new ClienteDAO();
                ArrayList<ClientesDTO> listarClies = listf.listarTodosClientes();
            %>

            <div class ="table-responsive" >
                <table class = "table table-striped table-bordered table-hover table-condensed" id="itemLista">
                    <thead>
                        <tr>    
                            <th>Nit</th>
                            <th>Nombre</th>
                            <th>Código SAP</th>
                            <th>Radicación Factura</th>
                            <th>Tipo Radicación</th>

                            <th>Analista</th>

                        </tr>
                    </thead>  
                    <tbody>
                        <%for (ClientesDTO cliesss : listarClies) {%>
                        <tr>    
                            <td><%=cliesss.getNitCliente()%></td>
                            <td><%=cliesss.getNombreCliente()%></td>
                            <td><%=cliesss.getSapCodigoCliente()%></td>
                            <td>                     

                                <select   name="txtVariable" id="txtVariable" tabindex="2">
                                    <option value="" selected="" disabled="" >Seleccione Analista </option>

                                    <option value=""></option>  



                                </select>

                            </td>
                            <td></td>

                            <td></td>



                        </tr>



                        <% }
                                    }%>
                    </tbody>   
                </table>

                <div id="pageNavPosition" align = "center"> 
                </div>

                <script type="text/javascript">
                    var pager = new Pager('itemLista', 15);
                    pager.init();
                    pager.showPageNav('pager', 'pageNavPosition');
                    pager.showPage(1);
                </script>


            </div>


        </div>



    </body>
    <footer>Â© 2014 Ctrl+G - proyecto formativo</footer>
    <!-- InstanceEnd -->
</html>
