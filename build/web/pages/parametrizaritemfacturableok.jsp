<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />

<title>ITEM facturable parametrizar</title>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery.validate.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">

</head>
<body>
<header>
  <figure> <a href= "parametrizaritemfacturable.jsp"> <img src="imagenes/logo.png" alt="logo" /></a> </figure>
  <figcaption> <a href= "parametrizaritemfacturable.jsp">
    <h1>Ctrl+G</h1>
  <nav> 
    <a href= "parametrizaritemfacturable.jsp">Parámetros</a> 
    <a href= "metas.jsp">Metas mes</a> 
    <a href= "resultados.jsp">Resultados</a> 
    <a href= "conciliacion.jsp">Conciliación</a> </nav>
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
<div id= "contenido"> 
 <div class="alert alert-info alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Recibimos la informaciÃ³n!</strong> Los datos se registraron correctamente.
</div>
  <h2>Parametrizar:</h2>
  <nav id="submenu"> 
     <a href="parametrizarceco.jsp"> Centros de costos </a> 
    <a href="parametrizaritemfacturable.jsp"> Item facturable </a> 
    <a href="parametrizarcliente.jsp">Clientes</a> 
  </nav>
    <div id = "ContenidoInterno">
<div class="collapse alert alert-warning alert-dismissible fade" role="alert"  id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModal1" aria-hidden="true" >
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Atencion!</strong> No se ha registrado la informaciÃ³n por favor verifique los campos del formulario.
</div>

 
    <form id="CrearITEM" role="form" method="get" action="parametrizaritemfacturableok.html">
      <h5>Crear ITEM facturable</h5>
      <div id="Aleta" > <span style="color:red;font-size: 16px;" > *</span> Campos obligatorios   </div> 
      <div class="form-group">
    <label id = "ConAste"  for="NomCliente"> Cliente</label>
   
    <select = "ClienteNom" class="form-control" name="NomCliente" placeholder="Seleccion Cliente" id = "NomCliente" requiered="TRUE" tabindex="1"/>
      <option selected="true" disabled="disabled">Seleccione Cliente </option>
      <option value="83947856"> Colombia Telecomunicaciones </option>
      <option value="89758614"> SENA </option>
      <option value="51728202">Claro Colombia </option>
    </select>
    </div>
<div class="form-group">
<label id = "ConAste" for="NomCeCo"> Centro de costos</label>
   
    <select = "Cecos" class="form-control" name="NomCeCo" placeholder="Seleccione CeCo" id = "NomCeCo" requiered="true" tabindex="2"/>
      <option selected="true" disabled="disabled"> Seleccione Centro de Costos</option>
      <option label="C333"> Datos </option>
      <option label="C75"> Sena </option>
      <option label="C280">Soporte tecnico </option>
    </select>
 </div>
     <div class="form-group">
        <label id = "ConAste"  for="ItemFacturable">Nombre ITEM facturable</label>
        <input type="text" class="form-control" name="ItemFacturable" id="ItemFacturable" placeholder="Back Soporte Banda Ancha" requiered="" tabindex="3">
    </div>
<div class="col-xs-4">
    <label id = "ConAste"  for="monedaTip">Tipo de Moneda</label>
       <select = "Cecos" class="form-control" name="monedaTip" placeholder="Moneda" id = "monedaTip" requiered="true" tabindex="4"/>
      <option selected="true" disabled="disabled"> Seleccione </option>
      <option label="COL Pesos"> Peso Colombiano </option>
      <option label="USD Dolar"> Dolar USA</option>
      <option label="CHI Pesos">Pesos Chilenos tecnico </option>
    </select>
</div>
<div class="col-xs-4">
    <label id = "ConAste"  for="VlorUni">Valor Unitario</label>

    <input type="number" class="form-control" id="VlorUni" name="VlorUni"placeholder="3.250.254" tabindex="5" >
</div>

    <div class="col-xs-4">
    <label id = "ConAste"  for="VariableTipo"> Variable Fac.</label>
   
    <input list = "SelecVariable" class="form-control" name="VariableTipo" placeholder="Seleccione" id = "VariableTipo" requiered="true" tabindex="6"/>
    <datalist id = "SelecVariable">
      <option label="05"> Evento </option>
      <option label="087"> TMO</option>
      <option label="04">Puesto </option>
      <option label="04">Puesto pro conexion</option>
    </datalist>
    </div>
      
<div class="form-inline">
<div class="form-group">
    <label  id = "ConAste" for="Cordinador">Coordinador encargado</label>
    <input type="text" class="form-control" id="Cordinador" name="Cordinador"placeholder="Juan Camilo Medina" tabindex="7">
</div>
 
  <div class="form-group">
    <label id = "ConAste" for="CoteFac">Corte Facturacion</label>
    <input type="number" class="form-control" id="CoteFac" name = "CoteFac" placeholder="Dia De Corte de Factura" tabindex="8" >
  </div>

  </div>



     <p> .</p>
     
        <button type="submit" class="btn btn-default" data-toggle="collapse"   href=".alert-success" data-target="#myModal" tabindex="9" >Solicitar</button>

    </form>
  </div>

<div id="InfoImportante"></div>
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
  <!-- InstanceEndEditable --> 
<div id= "panel"> </div>
</body>
<footer>Â© 2014 Ctrl+G - proyecto formativo</footer>
<!-- InstanceEnd -->
</html>
