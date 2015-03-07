<%@page import="Dto.UsuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="shortcut icon" href="Logo.ico" />

<title>Cliente parametrizar</title>

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
    <a href= "resultados.jsp">Resultados</a> 
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

<h4> Informe de resultados</h4>
  
    <div id = "ContenidoInterno2">

<div class="form-group">
    <label   for="NomCliente"> Cliente</label>
   <div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "ClienteNom" class="form-control" name="NomCliente" placeholder="Seleccion Cliente" id = "NomCliente" requiered="TRUE" tabindex="1"/>
      <option selected="true" >Todos </option>
      <option value="83947856"> Colombia Telecomunicaciones </option>
      <option value="89758614"> SENA </option>
      <option value="51728202">Claro Colombia </option>
    </select>
    </div>
    </div>

<div class="form-inline">

<div class="form-group">

<label for="NomItem"> Gerente Encargado</label>
<div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "Cecos" class="form-control" name="NomItem" placeholder="Seleccione Item" id = "NomItem" requiered="true" tabindex="2"/>
   <option selected="true" >Todos </option>
      
      <option > Horlando Troncoso</option>
      <option > Manuel Fetiva </option>
       <option > Ricardo Urrego </option>
        <option > Pedro Fermnmadez </option>
      
    </select>
     </div>
 </div>


<div class="form-group">
<label id = "ConAste" for="NomCeCo"> Centro de costos</label>
<div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "Cecos" class="form-control" name="NomCeCo" placeholder="Seleccione CeCo" id = "NomCeCo" requiered="true" tabindex="2"/>
      <option selected="true" > Todos</option>
      <option label="C333"> Datos </option>
      <option label="C75"> Sena </option>
      <option label="C280">Soporte tecnico </option>
    </select>
     </div>
 </div>

<div class="form-group">
<label id = "Mes" for="NomCeCo"> Mes</label>
<div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "Cecos" class="form-control" name="Mes" placeholder="Seleccione CeCo" id = "Mes" requiered="true" tabindex="2"/>
      
      <option >Enero</option>
      <option > Febrero </option>
      <option > Marzo </option>
      
      <option >Abril </option>
      <option >Mayo </option>
      <option >Junio </option>
      <option >Julio </option>
      <option >Agosto </option>
      <option selected="true" > Septiembre</option>
      <option >Septiembre </option>
      <option >Octubre </option>

    </select>
     </div>
 </div>

 <div class="form-group">
<label id = "Mes" for="NomCeCo"> AÃ±o</label>
<div class="input-group">


   <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
    <select = "Cecos" class="form-control" name="Mes" placeholder="Seleccione CeCo" id = "Mes" requiered="true" tabindex="2"/>
  
      <option >2012 </option>
      <option >2013 </option>
      <option selected="true" > 2014</option>
      

    </select>
     </div>
 </div>




</div>
<hr>
<div class ="table-responsive" abindex="2">
<table class = "table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>    
        <th>Centro de costos</th>
        <th>Ingeso</th>
        <th>Anterior</th>
        <th>Reclamar</th>
        
        
      </tr>
  </thead>  
  <tbody>
    <tr>    
      <th>C163 </th>
      <th>  120.250.896 COL </th>
      <th>
        100.250.896 COL</th>
      <th>
     <button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Reclamar</button>
     </th>
      
      
    </tr>

<tr>    
      <th>C218 </th>
      <th>  30.150.896 COL </th>
      <th>
        40.250.896 COL</th>
      <th>
     <button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Reclamar</button>
     </th>
      
      
    </tr>

    <tr>    
      <th>C218 </th>
      <th>  30.150.896 COL </th>
      <th>
        40.250.896 COL</th>
      <th>
     <button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Reclamar</button>
     </th>
      
      
    </tr>
    <tr>    
      <th>C218 </th>
      <th>  30.150.896 COL </th>
      <th>
        40.250.896 COL</th>
      <th>
     <button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Reclamar</button>
     </th>
      
      
    </tr>
    <tr>    
      <th>C218 </th>
      <th>  30.150.896 COL </th>
      <th>
        40.250.896 COL</th>
      <th>
     <button type="button" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-floppy-saved" tabindex="5"> </span>Reclamar</button>
     </th>
      
      
    </tr>

  </tbody>   
</table>
  </div>



     
    

   
  </div>

<div id="GraficaResul">
<h> Meses a graficar</h>
  <div class ="table-responsive">
    <table class = "table table-striped table-bordered table-hover table-condensed">
  <thead>      <tr>    
        <th>Mes</th>
        <th>Mostra</th>
       
        
        
      </tr>
  </thead>  
  <tbody>
    

<tr>    
      <th>Enero
 </th>
      <th>  <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button> </th>
      

      
    </tr>

    <tr>    
      <th>Febrero
</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>

      
    </tr>
    <tr>    
      <th>Marzo
</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>

      
      
    </tr>
    <tr>    
      <th>Abril
</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>
  
      
    </tr>

   
    <tr>    
      <th>Mayo
</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>
 
      
    </tr>
    <tr>    
      <th>Junio
 </th>
      <th>  <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>
 
      
    </tr>


     <tr>    
      <th>Agosto
</th>
      <th>  <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button> L </th>
 
      
    </tr>
        <tr>    
      <th>Septiembre

</th>
      <th>  <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button> </th>
 
      
    </tr>
        <tr>    
      <th>Octubre

</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>
 
      
    </tr>
        <tr>    
      <th>Noviembre

</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>
 
      
    </tr>
        <tr>    
      <th>Diciembre

</th>
      <th>   <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok "> </span></th></button>  </th>
 
      
    </tr>

  </tbody>
</table>
  </div>


</div>


<img src="imagenes/GrafIngresos.jpg">
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
