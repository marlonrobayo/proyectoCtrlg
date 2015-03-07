<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />
<title>Administrar Item facturable</title>
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

    <h4>Item facturable administrar</h4>
<div class="form-inline">
<div class="form-group">
    <label id = "ConAste"  for="NomCliente"> Cliente</label>
   <div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "ClienteNom" class="form-control" name="NomCliente" placeholder="Seleccion Cliente" id = "NomCliente" requiered="TRUE" tabindex="1"/>
      <option selected="true" disabled="disabled">Seleccione Cliente </option>
      <option value="83947856"> Colombia Telecomunicaciones </option>
      <option value="89758614"> SENA </option>
      <option value="51728202">Claro Colombia </option>
    </select>
    </div>
    </div>

<div class="form-group">
<label id = "ConAste" for="NomCeCo"> Centro de costos</label>
<div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "Cecos" class="form-control" name="NomCeCo" placeholder="Seleccione CeCo" id = "NomCeCo" requiered="true" tabindex="2"/>
      <option selected="true" disabled="disabled"> Seleccione Centro de Costos</option>
      <option label="C333"> Datos </option>
      <option label="C75"> Sena </option>
      <option label="C280">Soporte tecnico </option>
    </select>
     </div>
 </div>




  </div>
<hr>


<a href="parametrizaritemfacturable.jsp"><button type="button" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-plus 
" tabindex="4"> </span>Agregar</button></a>


<button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Guardar</button>




<hr>


<div class ="table-responsive">
<table class = "table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>    
        <th>Item facturable</th>
        
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
      <th>Residencial Tradicional </th>
      
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
      <th>Chat Residencial </th>
      
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
      <th>Residencial Rescate </th>
      
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
      <th>Residencial Preferencial </th>
      
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
      <th>Out Pgc </th>
      
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
      <th>Mesa De Fidelizacion </th>
      
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
      <th>LiquidaciÃ³n Conmutador</th>
      
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
      <th>Ventas Cliente Nuevos</th>
     
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
      <tr class="warning">    
      <th>Ventas Plus </th>
      
      <th><label class="checkbox-inline">
          <input type="checkbox" id="inlineCheckbox1" value="option1">
            
            </label>


          </th> 
      <th>

 <button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-trash"> </span></th></button>

      <th>15/07/2013</th>
      <th>
<button type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-refresh"> </span></th></button>
        </th>
    </tr>


  </tbody>   
</table>


<a href="parametrizaritemfacturable.jsp"><button type="button" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-plus 
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
