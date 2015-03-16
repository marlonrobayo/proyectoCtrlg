<%@page import="Modelo.PersonasDAO"%>
<%@page import="Dto.PersonasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.PersonasDTO"%>
<%@page import="Modelo.PermisosDAO"%>
<%@page import="Dto.PermisosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>Administracion de usuarios</title>    
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
        <link href="CSS/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/paging.js" type="text/javascript"></script>
 <script type="text/javascript">

                        $(function () {});
                        $(document).ready(function(){
                            $("#dialog-confirm").hide();//dialog("close");
                        });
                        
                        function confirmar(dato){
                            $("#dialog-confirm").dialog({
                                resizable: false,
                                height: 180,
                                modal: true,
                                buttons: {
                                    "Borrar Registro": function () {
                                        $(this).dialog("close");
                                        location.href = "EliminaPersona?idclie="+dato;
                                    },
                                    Cancelar: function () {
                                        $(this).dialog("close");
                                    }
                                }
                            });
                            return false;
                        }
                        
</script>
<script>
      function myFunction() {
          window.open("gestionuser.jsp", "_blank", "toolbar=no, scrollbars=no, resizable=no, top=10, left=250, width=430, height=700");
      }
</script>
<script>
      function myFunction1(dato1) {
                    window.open("gestionuser1.jsp?idclie="+dato1, "_blank", "toolbar=no, scrollbars=no, resizable=no, top=10, left=250, width=430, height=700");
      }
</script>
<script>
      function myFunction2() {
          window.open("gestionrol.jsp", "_blank", "toolbar=no, scrollbars=no, resizable=no, top=10, left=250, width=400, height=680");
      }
</script>
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
            <nav > 
                <%for (PermisosDTO permi : listaPermi) { %> 
                <a href="<%out.print(permi.getUrl());%>"> <%out.print(permi.getNombrePagina());%> </a>
                <% }  %>               
            </nav>
            
        </header>
        <div id="contenido"> 
    
            <%      if (request.getParameter("idFaElim2") != null) {                
            %>
            <div class="alert alert-info alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>Se ha eliminado el Usuario con exito!</strong> 
            </div><% } %>
    
     <h4>Administración de Usuarios</h4>
      <div ><nav id="submenu">
              <a href="#" onclick="myFunction()">Crear nuevo usuario</a>
                <a href="gestionroledit.jsp" >Administrar roles</a></nav></div>
   <form class="form-inline" role="form" action="Personas" >
     <div class="form-group">
     <label>Por ID Persona:</label>
       
       <input type="text" class="form-control" id="idtextbuscar" placeholder="En blanco carga todo" name="idtextbuscar" >
       <input type="hidden" name="CargaSelect" value="">
       <button type="submit" class="btn btn-primary" name="listarId">Buscar / Carga todo</button>
     
   </div> 
   </form>
 <hr>   
 <div class="row"> 
  <div class="col-md-12">   
    <div id ="ContenidoInterno4">
                   <%
                            PersonasDAO listc2 = new PersonasDAO();                         
                            
                     %>                       
<table class="table table-bordered table-condensed table-hover" id="listarpersonas">
                            <tr>
                                <th>ID Persona</th>
                                <th>Nombre Completo</th>
                                <th>Estado</th>
                                <th>Correo</th>
                                <th>Rol</th>
                                <th>Editar</th>
                                <th>Eliminar</th>
                            </tr>
                            <% 
                             if(session.getAttribute("idlistar")!= null && !((String)session.getAttribute("idlistar")).equals("")){
                                String pki = (String)session.getAttribute("idlistar");
                               PersonasDTO personaList = listc2.listarByIdPer(pki); 
                               if(personaList!= null){ %>
                               <span><%=pki %> <%=personaList.getCc() %></span>
                                 <tr>
                             <td><%=personaList.getCc()%></td>
                             <td><%=personaList.getNombreCompleto()%></td>
                             <td><%=personaList.getEstadouser()%></td>
                             <td><%=personaList.getLoginuser()%></td>
                             <td><%=personaList.getRoluser()%></td>
                             <td><div style="display: inline-block;">
                                   <a href="#" onclick="myFunction1(<%=personaList.getCc() %>)" class="btn btn-default btn-xs btn btn-success" style="text-decoration:none;">Editar</a>
                             </div></td>
                             <td><div style="display: inline-block" ><button href="#" onclick="confirmar(<%=personaList.getCc() %>);" class="btn btn-default btn-xs btn btn-warning" style="padding-left:10px; text-decoration:none;">Eliminar</button>
                                    </div></td>      
                            </tr>  
                            <% }} else {
                            ArrayList<PersonasDTO> listaPersonas = listc2.listarTodos();
                            for (PersonasDTO personaList : listaPersonas) {  %>
                            <tr>
                             <td><%=personaList.getCc()%></td>
                             <td><%=personaList.getNombreCompleto()%></td>
                             <td><%=personaList.getEstadouser()%></td>
                             <td><%=personaList.getLoginuser()%></td>
                             <td><%=personaList.getRoluser() %></td>
                              <td><div style="display: inline-block;">
                                   <a href="#" onclick="myFunction1(<%=personaList.getCc() %>)" class="btn btn-default btn-xs btn btn-success" style="text-decoration:none;">Editar</a>
                             </div></td>
                             <td><div style="display: inline-block" ><button href="#" onclick="confirmar(<%=personaList.getCc() %>);" class="btn btn-default btn-xs btn btn-warning" style="padding-left:10px; text-decoration:none;">Eliminar</button>
                                    </div></td>      
                            </tr>
                            <% } } %>
                                                        
                </table>            
           <br>     
 <div id="pageNavPosition" align="center"></div>  
  </div>
  </div>               
</div>
</div>
<div id="dialog-confirm" title="Confirmación..." >
    <p>Este registro se elimina de forma permanente. ¿Está seguro?</p>
</div>   
 
   <script type="text/javascript">
                var pager = new Pager('listarpersonas', 5);
                pager.init();
                pager.showPageNav('pager', 'pageNavPosition');
                pager.showPage(1);
            </script>
  <!-- InstanceEndEditable --> 
<div id= "panel">   
    <div id="logeo">
                     <%     
                  if (sesion.getAttribute("varDatosU") == null) {
                response.sendRedirect("index.jsp");
            } else {             
                PersonasDTO usuarioMostrar = new PersonasDTO();
                usuarioMostrar = (PersonasDTO)sesion.getAttribute("varDatosU");                
                out.print(usuarioMostrar.getNombreCompleto());}
            %>
                <a href="cerrarsesion.jsp"><h6>Cerrar Sesión</h6></a> 
            </div>  
           </div>
   <%   } %>           
</body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
<!-- InstanceEnd -->
</html>
