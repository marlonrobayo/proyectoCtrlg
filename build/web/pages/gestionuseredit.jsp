<%@page import="Modelo.PersonasDAO"%>
<%@page import="Dto.PersonasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />
<title>Usuario parametrizar</title>
<script src="js/jquery.js"></script>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">
 <script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
 <script src="jQueryAssets/jquery-ui-1.9.2.datepicker.custom.min.js" type="text/javascript"></script>
 <script src="js/paging.js" type="text/javascript"></script>
 <script src="js/jquery-ui.js" type="text/javascript"></script>
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

                        UsuarioDTO usuarioMostrar = new UsuarioDTO();
                        usuarioMostrar = (UsuarioDTO) sesion.getAttribute("varDatosU");

                        out.print("Bienvenido: " + usuarioMostrar.getPernombre());
                    }

                    %><br>
              <div id="logeo"><a href="cerrarsesion.jsp">Cerrar Sesión</a></div>          
            </div> 
</header>
<div id="contenido"> 
    <h4>Administración de Usuarios</h4>
  <nav id="submenu"> 
    <a href="parametrizaritemfacturable.jsp">Inicio</a> 
    <a href="gestionuseredit.jsp">Editar</a>
     <a href="gestionuser.jsp">Volver</a>
      <form class="form-inline" role="form" action="ConsultarId">
       <div class="radio"><label style="padding:2px;">Por ID:</label>
                            </div>
       <label class="sr-only" for="idtextbuscar"></label>
       <input type="text" class="form-control" id="idtextbuscar" placeholder="Termino a buscar" name="idtextbuscar" >
       <input type="hidden" name="CargaSelect" value="">
       <button type="submit" class="btn btn-primary" name="listarId">Buscar</button>
   </form>
 </nav>
  
    <div id ="ContenidoInterno3">
         <%
                            PersonasDAO listc = new PersonasDAO();
                     %>
<table class="table table-striped table-bordered table-hover table-condensed" id="listarpersonas">
                            <tr>
                                <th></th>  
                                <th>ID Persona</th>
                                <th>Nombre Completo</th>
                                <th>Rol</th>
                                <th>Estado</th>
                                <th>Correo</th>
                                <th>Contraseña</th>
                                <th>Editar</th>
                                <th>Eliminar</th>
                            </tr>
                            <% 
                             if(session.getAttribute("idlistar")!= null && !((Integer)session.getAttribute("idlistar")).equals(0)){
                                int pki = (Integer)session.getAttribute("idlistar");
                               PersonasDTO clients = listc.listarById(pki); 
                               if(clients!= null){
                            
                            %>
                               <tr>
                                <td><input name="u[]" type="checkbox" value="1"></td>
                                <td><%=clients.getNumcc()%></td>
                                <td><%=clients.getNombrecompleto()%></td>
                                <td><%=clients.getTiporol()%></td>
                                <td><%=clients.getEstado()%></td>
                                <td><%=clients.getEmail()%></td>
                                <td>*******************</td>
                                <td><div style="display: inline-block;">
                                        <% int getIc = clients.getNumcc();%>
                                        <a href="gestionuser1.jsp?idclie=<%=getIc%>" class="btn btn-default btn-xs btn btn-success" style="text-decoration:none;">Editar</a>
                                    </div></td>
                                <td><div style="display: inline-block" ><button href="#" onclick="confirmar(<%=getIc%>);" class="btn btn-default btn-xs btn btn-warning" style="padding-left:10px; text-decoration:none;">Eliminar</button>
                                    </div></td>    
                            </tr>
                            <%  } } else   {        
                             ArrayList<PersonasDTO> listaClientes = listc.listarTodos();
                            for (PersonasDTO clients : listaClientes) {%>
                            <tr>
                                <td><input name="u[]" type="checkbox" value="1"></td>
                               <td><%=clients.getNumcc()%></td>
                                <td><%=clients.getNombrecompleto()%></td>
                                <td><%=clients.getTiporol()%></td>
                                <td><%=clients.getEstado()%></td>
                                <td><%=clients.getEmail()%></td>
                                <td>*******************</td>
                                <td><div style="display: inline-block;">
                                        <% int getIc = clients.getNumcc();%>
                                        <a href="gestionuser1.jsp?idclie=<%=getIc%>" class="btn btn-default btn-xs btn btn-success" style="text-decoration:none;">Editar</a>
                                    </div></td>
                                    
                                <td><div style="display: inline-block" ><button href="#" onclick="confirmar(<%=getIc%>);" class="btn btn-default btn-xs btn btn-warning" style="padding-left:10px; text-decoration:none;">Eliminar</button>
                                    </div></td>    
                            </tr>
                            <%
                                }}
                                                        %>
                </table>            

 <div id="pageNavPosition" align="center"></div>  
  </div>
</div>
 <div id="dialog-confirm" title="Confirmación..." >
                <p>Este registro se eliminará de forma permanente. Esta seguro?</p>
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
        ItemFacturable :{required: true, minlength: 5, maxlength: 40 },
        monedaTip:{required: true },
        
        VlorUni :{required: true, digits: true, minlength: 1, maxlength: 7 },
        CoteFac :{required: true,digits: true, minlength: 1, maxlength: 7 },
        Cordinador :{required: true,minlength: 8, maxlength: 45 },
        
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
<div id= "panel"> </div>
</body>
<footer>Año 2014 Ctrl+G - proyecto formativo</footer>
<!-- InstanceEnd -->
</html>
