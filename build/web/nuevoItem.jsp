<%@page import="Dto.PersonasDTO"%>
<%@page import="Dto.VariableFacDTO"%>
<%@page import="Dto.TipoMonedaDTO"%>
<%@page import="Dto.CecoDTO"%>
<%@page import="Modelo.TipoMonedaDAO"%>
<%@page import="Modelo.VariableFacDAO"%>
<%@page import="Modelo.CecoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.PermisosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <title>Crear Item</title>
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
                        PersonasDTO usuarioMostrar = new PersonasDTO();
                        usuarioMostrar = (PersonasDTO) sesion.getAttribute("varDatosU");
                        out.print("Bienvenido: " + usuarioMostrar.getNombreCompleto());
                    }
                %>
                   
            <%  CecoDAO listcecos = new CecoDAO();
                VariableFacDAO lisvarf = new VariableFacDAO();
                TipoMonedaDAO listmontipo = new TipoMonedaDAO();
                %>                 
<div id = "forModal">       
            <%
            if (request.getParameter("msg") != null) {  %>
        
         <div class="alert alert-info alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>!<%=request.getParameter("msg")%></strong> 
            </div> <%   }   %>
                    <h4>Agregar Item facturable</h4>
                    <form role="form" name="registroItem" action="Login" method="POST">

                        <div class="form-group">
                            <label id = "ConAste" for="txtNombreItem">Nombre Item</label>
                            <input class="form-control"  type="text"  name="txtNombreItem"
                                   id="txtNombreItem" value = ""   placeholder="Soporte Tecnico Tv" tabindex="1"/>
                        </div>
                        <div class="form-group">
                            <label id = "ConAste" for="txtValorItem">Valor unitario</label>
                            <input class="form-control"  type="number"  name="txtValorItem"
                                   id="txtValorItem" value = ""   placeholder="3.587.598" tabindex="2"/>
                        </div>
                       <div class="form-group">
                        <label id = "ConAste" for="txtVariable"> Variable Facturable</label>
                       

                            <select class="form-control" name="txtVariable" id="txtVariable" tabindex="2">
                                <option selected="true" disabled="disabled">Selecione tipo de Variable</option>
                            <% ArrayList<VariableFacDTO> listva = lisvarf.listarTodosVarFac();
                                    for (VariableFacDTO listarTVar : listva) {%> 
                                     <option value="<%=listarTVar.getCodVariableFac()%>"><%=listarTVar.getNombreVariableFac()%></option>  
                                <% }%>

                            </select>
                        
                    </div>
                      <div class="form-group">
                        <label id = "ConAste" for="NomCeCo"> Centro de costos</label>
                        

                            <select class="form-control" name="NomCeCo" id="NomCeCo" tabindex="4">
                                <option selected="true" disabled="disabled">Seleccione CeCo</option>
                                <% ArrayList<CecoDTO> listCe = listcecos.listarTodosCeco();
                                    for (CecoDTO listarTCecos : listCe) {%>  
                                <option value="<%=listarTCecos.getCodCeco()%>"><%=listarTCecos.getCodCeco() + " " + listarTCecos.getNombreCeco()%></option>  
                                <% }%>
                            </select>
                            
                    </div>
                        <div class="form-group">
                            <label id = "ConAste" for="txtFacCli">Factura cliente</label>
                            <input class="form-control"  type="text"  name="txtFacCli"
                                   id="txtFacCli" value = ""   placeholder="Facruracion TT" tabindex="5"/>
                        </div>
                        
                        <div class="form-group">
                        <label id = "ConAste" for="txtTipoMoneda"> Tipo de moneda</label>
                        

                            <select class="form-control" name="txtTipoMoneda" id="txtTipoMoneda" tabindex="7">
                                <option selected="true" disabled="disabled">Seleccione Tipo Moneda</option>
                                <% ArrayList<TipoMonedaDTO> listMon = listmontipo.listarTodosTipoMoneda();
                                    for (TipoMonedaDTO listarTMon : listMon) {%>  
                                <option value="<%=listarTMon.getIdTipoMoneda()%>"><%=listarTMon.getNombreTipoMoneda()%></option>  
                                <% }%> 

                            </select>
                        
                
                   </div>
                        <div class="form-group">
                            <label for="txtCorte">Corte</label>
                            <input class="form-control"  type="number"  name="txtCorte"
                                   id="txtCorte" value = ""   placeholder="Soporte Tecnico Tv" tabindex="8"/>
                        </div>
                        <div class="form-group">
                            <label for="txtRangoImpac">Rango impacto</label>
                            <input class="form-control"  type="number"  name="txtRangoImpac"
                                   id="txtRangoImpac" value = ""   placeholder="Soporte Tecnico Tv" tabindex="9"/>
                        </div>
                        <div class="form-group">
                            <label for="txtCordinadorEn">Coordinador encargado</label>
                            <input class="form-control"  type="text"  name="txtCordinadorEn"
                                   id="txtCordinadorEn" value = ""   placeholder="Soporte Tecnico Tv" tabindex="10"/>
                        </div>

                        <input type="hidden" name="rItem" id="rItem" value=""  />

                        <input type="submit" value="Registrar" name="btnRegistraItem" />

                    </form>
</div>
 
    </body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
</html>
