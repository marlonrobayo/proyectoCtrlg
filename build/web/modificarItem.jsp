<%-- 
    Document   : nuevoItem
    Created on : Dec 9, 2014, 1:58:34 PM
    Author     : marlo_000
--%>

<%@page import="Dto.PersonasDTO"%>
<%@page import="Dto.ItemDTO"%>
<%@page import="Modelo.ItemDAO"%>
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
        <title>JSP Page</title>
    </head>
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
    <%int idcodigo=0;
    if(request.getParameter("idItem") != null){
            idcodigo = Integer.parseInt(request.getParameter("idItem"));
            }
    ItemDAO actualizaritem = new ItemDAO();
    ItemDTO itemtUndate = actualizaritem.listarItemByID(idcodigo); 
   
    
    %> 
    <body>
     <%                    CecoDAO listcecos = new CecoDAO();
                VariableFacDAO lisvarf = new VariableFacDAO();
                TipoMonedaDAO listmontipo = new TipoMonedaDAO();
                %>                 
<div id = "forModal">      
            <%
            if (request.getParameter("msg") != null) {

        %>
        
         <div class="alert alert-info alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>!<%=request.getParameter("msg")%></strong> 
            </div>
               
        <%
            }
            // si es null el objeto, es decir, no se ha creado aun, no mostramos nada
        %>
                    <h4>Actualizar Item facturable</h4>

                    <form role="form" name="modificartroItem" action="Login" method="POST">

 <div class="form-group">
        <label for ="idFac">ID factura</label>
        <input class="form-control"  type="text" name="idFac" id = "idFac" value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemID());} %>" readonly=""  />
         </div>
                        
                        <div class="form-group">
                            <label id = "ConAste" for="txtNombreItem">Nombre Item</label>
                            <input class="form-control"  type="text"  name="txtNombreItem"
                                   id="txtNombreItem" value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemNombre());} %>"    tabindex="1"/>
                        </div>
                        <div class="form-group">
                            <label id = "ConAste" for="txtValorItem">Valor unitario</label>
                            <input class="form-control"  type="text"  name="txtValorItem"
                                   id="txtValorItem" value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemValorUnit());} %>"    tabindex="2"/>
                        </div>
                       <div class="form-group">
                        <label id = "ConAste" for="txtVariable"> Variable Facturable</label>
                       

                            <select  class="form-control" name="txtVariable" id="txtVariable" tabindex="2">
                                <option value="<%if(itemtUndate !=null){out.print(itemtUndate.getItemVariableFac());} %>"> <%if(itemtUndate !=null){out.print(itemtUndate.getItemVariableFac());} %></option>
                            <% ArrayList<VariableFacDTO> listva = lisvarf.listarTodosVarFac();
                                    for (VariableFacDTO listarTVar : listva) {%> 
                                     <option value="<%=listarTVar.getCodVariableFac()%>"><%=listarTVar.getNombreVariableFac()%></option>  
                                <% }%>
                                

                            </select>
                        
                    </div>
                      <div class="form-group">
                        <label id = "ConAste" for="NomCeCo"> Centro de costos</label>
                        

                            <select class="form-control" name="NomCeCo" id="NomCeCo" tabindex="4">
                                <option value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemCeCo());} %>"><%if(itemtUndate !=null){
            out.print(itemtUndate.getItemCeCo());} %></option>
                                <% ArrayList<CecoDTO> listCe = listcecos.listarTodosCeco();
                                    for (CecoDTO listarTCecos : listCe) {%>  
                                <option value="<%=listarTCecos.getCodCeco()%>"><%=listarTCecos.getCodCeco()+" "+listarTCecos.getNombreCeco()%></option>  
                                <% }%>
                            </select>
                            
                    </div>
                        <div class="form-group">
                            <label id = "ConAste" for="txtFacCli">Factura cliente</label>
                            <input class="form-control"  type="text"  name="txtFacCli"
                                   id="txtFacCli" value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemFacturaClie());} %>"    tabindex="5"/>
                        </div>
                        
                        <div class="form-group">
                        <label id = "ConAste" for="txtTipoMoneda"> Tipo de moneda</label>
                        

                            <select class="form-control" name="txtTipoMoneda" id="txtTipoMoneda" tabindex="7">
                                <option  value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemTipoMoneda());} %>" ><%if(itemtUndate !=null){
            out.print(itemtUndate.getItemTipoMoneda());} %></option>
                                <% ArrayList<TipoMonedaDTO> listMon = listmontipo.listarTodosTipoMoneda();
                                    for (TipoMonedaDTO listarTMon : listMon) {%>  
                                <option value="<%=listarTMon.getIdTipoMoneda()%>"><%=listarTMon.getNombreTipoMoneda()%></option>  
                                <% }%> 

                            </select>
                        
                
                   </div>
                        <div class="form-group">
                            <label for="txtCorte">Corte</label>
                           <input class="form-control"  type="text"  name="txtCorte"
                                   id="txtCorte" value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemCorte());} %>"    tabindex="8"/>
                        </div>
                        <div class="form-group">
                            <label for="txtRangoImpac">Rango impacto</label>
                            <input class="form-control"  type="text"  name="txtRangoImpac"
                                   id="txtRangoImpac" value="<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemRangoImpacto());} %>"    tabindex="9"/>
                        </div>
                        <div class="form-group">
                            <label for="txtCordinadorEn">Coordinador encargado</label>
                            <input class="form-control"  type="text"  name="txtCordinadorEn"
                                   id="txtCordinadorEn" value = "<%if(itemtUndate !=null){
            out.print(itemtUndate.getItemCoordinador());} %>"   placeholder="Soporte Tecnico Tv" tabindex="10"/>
                        </div>

                        <input type="hidden" name="mItem" id="mItem" value=""  />

                        <input type="submit" value="Modificar" name="btnModificarItem" />

                    </form>
</div> 
    </body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
</html>
