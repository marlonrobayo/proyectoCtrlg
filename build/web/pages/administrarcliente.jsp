<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />

<title>Administrar Cliente</title>

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
<div id= "contenido"> 

 
  
    <h4>Cliente administrar</h4>

<hr>


<a href="parametrizarcliente.jsp"><button type="button" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-plus 
" tabindex="4"> </span>Agregar</button></a>


<button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Guardar</button>




<hr>


<div class ="table-responsive">
<table class = "table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>    
        <th>Cliente</th>
        
        <th> <label class="checkbox-inline">
          <input type="checkbox" id="inlineCheckbox1" value="option1">
            <span class="glyphicon glyphicon-ok"> </span>
            </label></th>
        <th>Fin</th>
        <th>Fecha fin</th>
        <th>Mod</th>
      </tr>
  </thead>  
  <tbody>
    <tr>    
      <th>Telmex Colombia </th>
      
      <th><label class="checkbox-inline">
          <input type="checkbox" id="inlineCheckbox1" value="option1">
            
            </label>


          </th> 
      <th>

 <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash"> </span></th></button>

      <th>Activo</th>
      <th>
<button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh"> </span></th></button>
        </th>
    </tr>
<tr>    
      <th>Pizzas XY </th>
      
      <th><label class="checkbox-inline">
          <input type="checkbox" id="inlineCheckbox1" value="option1">
            
            </label>


          </th> 
      <th>

 <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash"> </span></th></button>

      <th>Activo</th>
      <th>
<button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh"> </span></th></button>
        </th>
    </tr>
   


    <tr>    
      <th>Sena </th>
      
      <th><label class="checkbox-inline">
          <input type="checkbox" id="inlineCheckbox1" value="option1">
            
            </label>


          </th> 
      <th>

 <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash"> </span></th></button>

      <th>Activo</th>
      <th>
<button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh"> </span></th></button>
        </th>
    </tr>
    <tr>    
      <th>Colombia telecumunicaciones </th>
      
      <th><label class="checkbox-inline">
          <input type="checkbox" id="inlineCheckbox1" value="option1">
            
            </label>


          </th> 
      <th>

 <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash"> </span></th></button>

      <th>Activo</th>
      <th>
<button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh"> </span></th></button>
        </th>
    </tr>
   


  </tbody>   
</table>


<a href="parametrizarcliente.jsp"><button type="button" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-plus 
" tabindex="4"> </span>Agregar</button></a>

<button type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Guardar</button>






  </div>

  


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
