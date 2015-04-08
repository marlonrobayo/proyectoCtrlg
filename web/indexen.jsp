<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!doctype html>
<html>
    <head>
         <link rel="shortcut icon" href="Logo.ico" />
        <title>Financial Management Control Call Center</title>
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="CSS/EstiloIncio.css">
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
        function cargarobjeto(objeto, id)
        {
        if (objeto.readyState == 4) //si se ha cargado completamente
        document.getElementById(id).innerHTML=objeto.responseText
        else //en caso contrario, mostramos un gif simulando una precarga
        //document.write();                     
        document.getElementById(id).innerHTML=''
        }
        </script>
    </head>
    <body>
        <header>
            <figure><img src="imagenes/logo.png" alt="logo"/> </figure>
            <figcaption> 
                <div id= "logeo2">
                    <h1>Ctrl+G</h1>
                </div>
            </figcaption>
            <div id= "logeo2">
               <h2>Financial Control For Income</h2>
            </div>
        </header>
        <div id= "contenido">
        <div id="wowslider-container1">
        <div class="ws_images"><ul>
        <li><img src="imagenes/slide/1.jpg" alt="" title="" id="wows1_0"/></li>
        <li><img src="imagenes/slide/2.png" alt="" title="" id="wows1_1"/></li>
        <li><img src="imagenes/slide/3.jpg" alt="" title="" id="wows1_2"/></li>
        </ul></div>
        <div class="ws_bullets"><div>
        <a href="#" title="1">1</a>
        <a href="#" title="2">2</a>
        <a href="#" title="3">3</a>
        </div></div>
        <div class="ws_shadow"></div>
        </div></div>
        <div id="contenido">            
         <div class="row">
             <div class="col-md-9">
            <nav> 
                <a href="#" onclick="myFunction();">Initiation</a> 
                <a href="javascript:Carga('mision.jsp','mainContent')">Mision</a>
                <a href="javascript:Carga('vision.jsp','mainContent')">Vision</a>
            </nav>
                 <div class="spacio"></div>
                 <div id="image_index">
                  <div id="mainContent">   
                     <dl>
                         <dt><p class="fontWi2 text-success"> Take control and breathe easy,</p> </dt>
                         <dd>Now you can control, improve decision making and make comprehensive management business and your income with information management system CTRL + G.
Its modules Billable Items and Goals allow you to have a detailed discussion of each of the indicators tracking. <br> 
With its report generator making sure you have updated and reliable information to make decisions professionally. In addition you receive alerts on critical attack points in your mailbox to look your income.</dd> 
                    </dl> 
                 </div>
                 </div>                        
             </div>
         <div class="col-md-3">
             <div id="Login">
                 <fieldset class="text-primary h3">Enter the System</fieldset>
             <form id="FormularioRgistro" role="form" action="Login">
                 <div class="form-group">
                     <label for="nommail">User</label>
                     <input type="text" class="form-control" id="nommail" name="nommail" placeholder="Enter User" required="">
                 </div>
                 <div class="form-group">
                     <label for="clave">Password</label>
                     <input type="password" class="form-control" id="clave" name="clave" placeholder="Your Password" required="">
                 </div>                   
                 <input type="hidden" name="UserIn" id="UserIn" value=""/>
                 <button type="submit" class="btn btn-warning" name="ValidUser" id="ValidUser">Sign In</button>
             </form>
                     <br>
                <div class="text-right"><a href= "solicitaracceso.jsp" class="fontWi">Request Access</a> </div>
                <%   if (request.getParameter("sal") != null) { %>
                <div id="bg-info"> 
                <%  out.print(request.getParameter("sal"));  %>
             </div>
                <p></p>
                <p><a href= "recuperaclave.jsp" class="fontWi">Recover Password</a> </p>
                <%}
                %>
         </div>
         </div>
         </div>
            <div class="spacio"></div>
    </div>
    <footer>©Year 2015 Ctrl+G - TRAINING PROJECT</footer>
  <script src="js/engine/wowslider.js" type="text/javascript"></script>
 <script src="js/engine/script.js" type="text/javascript"></script>
 <script src="js/ajax.js" type="text/javascript"></script>
<script>
        $().ready(function () {
            $("#FormularioRgistro").validate({
                rules: {
                    nommail: {required: true, minlength: 5, maxlength: 40},
                    clave: {required: true, minlength: 6}
                }
              
            });
        });
    </script>
    <script>
      function myFunction() {
          location.href = "index.jsp";
      }
    </script>
 </body>
</html>
