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

        <script type="text/javascript">
            $(function () {
            });
            $(document).ready(function () {
                $("#dialog-form").hide();//dialog("close");
            });

            function confirmar(dato) {
                $("#dialog-form").dialog({
                    resizable: false,
                    height: 180,
                    width: 350,
                    modal: true,
                    buttons: {
                        "Borrar Registro": function () {
                            $(this).dialog("close");
                            location.href = "administraritemfacturable.jsp?idFaElim=" + dato;
                        },
                        Cancelar: function () {
                            $(this).dialog("close");
                        }
                    }
                });
                return false;
            }
        </script>  

    </head>
    <body>

        <div id="dialog-form" title="Esta a punto de eliminar regitro" > Esta a punto de eliminar Item facturable </div>

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
            <nav > 

                <%for (PermisosDTO permi : listaPermi) {%> 
                <a href="<%out.print(permi.getUrl());%>"> <%out.print(permi.getNombrePagina());%> </a>
                <%  } %>

            </nav>

        </header>
        <div id= "panel">  
            <div id="logeo">
                     <%            
                PersonasDTO usuarioMostrar = new PersonasDTO();
                usuarioMostrar = (PersonasDTO)sesion.getAttribute("varDatosU");                
               out.print(usuarioMostrar.getNombreCompleto());
            %>
                <a href="cerrarsesion.jsp"><h6>Cerrar Sesión</h6></a> 
            </div>  
        </div>

        <div id= "contenido"> 

            <h4>Item's facturables </h4>
           
            <form role="form" name="hacerFiltro" action="ServletMarlon" method="POST">

                <%  CecoDAO listcecos = new CecoDAO();
                    VariableFacDAO lisvarf = new VariableFacDAO();
                    TipoMonedaDAO listmontipo = new TipoMonedaDAO();
                %> 
                <div class="form-inline">


                    <div class="form-group">
                        <label id = "ConAste" for="NomCeCo"> Centro de costos</label>
                        <div class="input-group">

                            <select class="form-control" name="NomCeCo" id="NomCeCo" tabindex="1">
                                <option selected="" disabled=""></option>
                                <% ArrayList<CecoDTO> listCe = listcecos.listarTodosCeco();
                                    for (CecoDTO listarTCecos : listCe) {%>  
                                <option value="<%=listarTCecos.getCodCeco()%>"><%=listarTCecos.getCodCeco() + " " + listarTCecos.getNombreCeco()%></option>  
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label id = "ConAste" for="txtVariable"> Variable Facturable</label>
                        <div class="input-group">

                            <select class="form-control" name="txtVariable" id="txtVariable" tabindex="2">
                                <option selected="" disabled=""></option>
                                <% ArrayList<VariableFacDTO> listva = lisvarf.listarTodosVarFac();
                                for (VariableFacDTO listarTVar : listva) {%> 
                                <option value="<%=listarTVar.getCodVariableFac()%>"><%=listarTVar.getNombreVariableFac()%></option>  
                                <% }%>


                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label id = "ConAste" for="txtTipoMoneda"> Tipo de moneda</label>
                        <div class="input-group">

                            <select class="form-control" name="txtTipoMoneda" id="txtTipoMoneda" tabindex="1">
                                <option selected="" disabled=""></option>
                                <% ArrayList<TipoMonedaDTO> listMon = listmontipo.listarTodosTipoMoneda();
                                    for (TipoMonedaDTO listarTMon : listMon) {%>  
                                <option value="<%=listarTMon.getIdTipoMoneda()%>"><%=listarTMon.getNombreTipoMoneda()%></option>  
                                <% }%> 

                            </select>
                        </div>
                        <input type="hidden" name="fItem" id="fItem" value=""  />
                        <input class="btn btn-primary "  type="submit" value="Mostrar" name="btnFiltroItem" />
                    </div>
                </div>



            </form>
            <hr>
            <%      if (request.getParameter("idFaElim") != null) {
                    int idcodigo;
                    ItemDAO facdao = new ItemDAO();
                    idcodigo = Integer.parseInt(request.getParameter("idFaElim"));
                    facdao.EliminarRegistroItem(idcodigo);
            %>
            <div class="alert alert-info alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>Se ha eliminado el registro con exito!</strong> 
            </div><%}%>

            <div id="agre" > 

                <button  class="btn btn-primary btn-xs" onclick="myFunction()"><span class="glyphicon glyphicon-plus" > </span> Nuevo  Item</button>
                <a href="pages/generarexcelItem.jsp" class="btn btn-success btn-xs" > Excel <span class="glyphicon glyphicon-arrow-down" ></span></a>
            </div>
            <script>
                function myFunction() {
                    window.open("nuevoItem.jsp", "_blank", "toolbar=0, scrollbars=yes, resizable=no, top=10, left=100, width=580, height=650");
                }
            </script>
            <script>
                       function myFunctionmodi(dato2) {
                           window.open("modificarItem.jsp?idItem="+ dato2, "_blank", "toolbar=0, scrollbars=yes, resizable=no, top=10, left=100, width=580, height=650");
                       }
            </script>

            <%
                String paraFiltro = "";
                if (session.getAttribute("filtroid") != null && session.getAttribute("filtroid") != "") {
                    paraFiltro = (String) session.getAttribute("filtroid");

                }

                ItemDAO listItems = new ItemDAO();
                ArrayList<ItemDTO> listadelosItem = listItems.listarTodosItem(paraFiltro);
            %>
            <div class ="table-responsive">
                <table class = "table table-striped table-bordered table-hover table-condensed">



                    <div class ="table-responsive" >
                        <table class = "table table-striped table-bordered table-hover table-condensed" id="itemLista">
                            <thead>
                                <tr>    
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Valor unitario</th>
                                    <th>Variable Facturable</th>
                                    <th>CeCo</th>
                                    <th>Tipo Moneda</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>  
                            <tbody>
                                <%for (ItemDTO itemss : listadelosItem) {%>
                                <tr>    
                                    <td><%=itemss.getItemID()%></td>
                                    <td><%=itemss.getItemNombre()%></td>
                                    <td><%=itemss.getItemValorUnit()%></td>
                                    <td><%=itemss.getNombreVariableFac()%></td>
                                    <td><%=itemss.getItemCeCo()%></td>

                                    <td><%=itemss.getNombreMoneda()%></td>
                                    <td>
                                        <a class = "btn btn-danger btn-xs" onclick="confirmar(<%=itemss.getItemID()%>)" href="#"  ><span class="glyphicon glyphicon-trash" text-align: center> </span></a>
                                    </td>

                                    <td>
                                        <a class="btn btn-success btn-xs" onclick="myFunctionmodi(<%=itemss.getItemID()%>)"  ><span class="glyphicon glyphicon-refresh"> </span></a>
                                      
                                    </td>
                                </tr>



                                <% }
                                    } %>
                            </tbody> 
                         
                        </table>

                        <div id="pageNavPosition" align = "center"> 
                        </div>

                        <script type="text/javascript">
                            var pager = new Pager('itemLista', 8);
                            pager.init();
                            pager.showPageNav('pager', 'pageNavPosition');
                            pager.showPage(1);
                        </script>

                    </div>


            </div>
        </div>


    </body>
    <footer>Año 2014 Ctrl+G - proyecto formativo</footer>
    <!-- InstanceEnd -->
</html>
