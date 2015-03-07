<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="Logo.ico" />
<title>Recuperar contraseÃ±a</title>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
<link rel="stylesheet" type="text/css" href="CSS/Estilos001.css">

</head>
<body>
  
   <header>
  <figure> <a href= "parametrizaritemfacturable.jsp"> <img src="imagenes/logo.png" alt="logo" /></a> </figure>
  <figcaption> <a href= "parametrizaritemfacturable.jsp">
    <h1>Ctrl+G</h1>
    </a> </figcaption>
    
   <div id= "logeo2">
    <h2> Control De Gestión </h2>
    
    </div>
 
</header>
<div id= "contenido">

    

 

<div class="collapse alert alert-warning alert-dismissible fade" role="alert"  id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModal1" aria-hidden="true" >
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Atencion!</strong> No se ha registrado la información por favor verifique los campos del formulario.
</div>
 
 


  <h4>Recuperar contraseña</h4>


<form id="FormularioRgistro" role="form" method="get" action="index.jsp"> 




<div class="form-inline">
<div class="form-group">
    <label  for="nommail">Dirección de correo</label>
    <input type="text" class="form-control" id="nommail" name="nommail"placeholder="Enter email" tabindex="1">
</div>
  <div class="form-group">
     <label  for="exampleInputEmail2">Dominio</label>
    <div class="input-group">
      <div class="input-group-addon">@</div>
      <input class="form-control" type="email" placeholder="callcentercsc.com" disabled tabindex="2">
    </div>
  </div>

  <div class="form-group">
    <label for="Clave">Identificación personal</label>
    <input type="text" class="form-control" id="Clave" name = "clave" placeholder="numero de cedula" tabindex="3" >
  </div>

  </div>
  <p></p>

  <button type="submit" class="btn btn-default" data-toggle="collapse"   href=".alert-success" data-target="#myModal" tabindex="4" >Recuperar</button>
  
  






  </form>







  <!-- <button type="button" data-toggle="collapse" data-target=".alert-success" >Launch modal</button>
 -->

  </div>

</body>

<footer>Â© 2014 Ctrl+G - proyecto formativo</footer>
 <script>
    $().ready(function() {
    // validaciÃ³n del formulario
    $("#FormularioRgistro").validate({
      rules: {
        nommail: {required: true, minlength: 5, maxlength: 40 },
                 clave: {required: true, minlength: 6}, 
      } ,
    // highlight: function(element) {
    //   $(element).closest('.control-group')
    //   .removeClass('success').addClass('error');
    // },
    // success: function(element) {
    //   element
    //   .text('OK!').addClass('help-inline')
    //   .closest('.control-group')
    //   .removeClass('error').addClass('success');
    // }
    });
  });



  </script>


    
</html>
