<%@page import="Modelo.PermisosDAO"%>
<%@page import="Dto.PermisosDTO"%>
<%@page import="Modelo.RolesDAO"%>
<%@page import="Dto.RolesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.PersonasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />
<title>Admin. Roles y permisos</title>
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
                                        location.href = "EliminaRol?idclie="+dato;
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
          window.open("gestionrol.jsp", "_blank", "toolbar=no, scrollbars=no, resizable=no, top=20, left=250, width=400, height=650");
      }
</script>
<script>
      function myFunction2(dato2) {
          window.open("gestionrol1.jsp?idclie="+dato2, "_blank", "toolbar=no, scrollbars=no, resizable=no, top=20, left=250, width=400, height=650");
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

                <%for (PermisosDTO permi : listaPermi) {%> 
                <a href="<%out.print(permi.getUrl());%>"> <%out.print(permi.getNombrePagina());%> </a>
                <% }  %>
               
            </nav>
          <% } %>
        </header>
                   
<div id="contenido"> 
     <h4>Administración de Roles y Permisos</h4>
  <div class="row"> 
      <div class="col-sm-4"></div>
      <div class="col-md-6"><nav id="submenu"> <a href="gestionuseredit.jsp">Voler</a> 
              <a href="#" onclick="myFunction()">Crear un nuevo rol</a></nav>
     </div>      
  <div class="col-md-2"></div>
  </div>  
<hr> 
  <div class="row"> 
  <div class="col-sm-3"></div>
  <div class="col-md-9">   
  <div id="ContenidoInterno5">
         <%                 
                            RolesDAO listc1 = new RolesDAO();
                            ArrayList<RolesDTO> listaRoles = listc1.listarRoles();
                     %>
<table class="table table-striped table-bordered table-hover table-condensed" id="listarpersonas">
                            <tr>
                                <th>ID Rol</th>
                                <th>Rol</th>
                                <th>Editar</th>
                                <th>Eliminar</th>
                                
                            </tr>
                            <%                               
                            for (RolesDTO roles : listaRoles) { %>
                            <tr>
                                <td><%=roles.getRolid()%></td>
                                <td><%=roles.getNamerol() %></td>                                
                                <td><div style="display: inline-block;">
                                        <a href="#" onclick="myFunction2(<%=roles.getRolid()%>)" class="btn btn-default btn-xs btn btn-success" style="text-decoration:none;">Editar</a>
                                    </div></td>
                                    <td><div style="display: inline-block" ><button href="#" onclick="confirmar(<%=roles.getRolid() %>);" class="btn btn-default btn-xs btn btn-warning" style="padding-left:10px; text-decoration:none;">Eliminar</button>
                                    </div></td>    
                            </tr>
                            <% } %>
                </table>            
    <br>
 <div id="pageNavPosition" align="center"></div>  
  </div>
  </div>     
 <div class="col-md-0"></div>               
</div>
</div>
 <div id="dialog-confirm" title="Confirmación..." >
                <p>Este registro se elimina de forma permanente. ¿Está seguro?</p>
</div> 
             
  <script>
    $().ready(function() {
    // validaciÃ³n del formulario
    $("#CrearITEM").validate({
      rules: {
        ItemFacturable: {required: true, minlength: 5, maxlength: 40 },
    
        ValorItem: {required: true, digits: true, minlength: 1, maxlength: 15},
        NomCeCo :{required: true },
 VariableTipo :{required: true },

        NomCliente :{required: true },
        monedaTip:{required: true },
        
        VlorUni :{required: true, digits: true, minlength: 1, maxlength: 7 },
        CoteFac :{required: true,digits: true, minlength: 1, maxlength: 7 },
        Cordinador :{required: true,minlength: 8, maxlength: 45 }
        
      } 
    });
  });
  $.validator.addMethod("caracteres", function(value, element) {
  return this.optional(element) || /[a-zA-Z][^W*]/.test(value);
  if ( /[^0-9 \-]+/.test(value) ) {return false;}
  }, "Los numeros no son validos");
  </script>
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
</body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
<!-- InstanceEnd -->
</html>
