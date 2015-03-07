package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"logo.ico\" />\r\n");
      out.write("        <title>Control de gestión financiera</title>\r\n");
      out.write("        <script src=\"js/jquery.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery.validate.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/bootstrap.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/Estilos001.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <header>\r\n");
      out.write("            <figure> <img src=\"imagenes/logo.png\" alt=\"logo\" /> </figure>\r\n");
      out.write("            <figcaption> \r\n");
      out.write("                <h1>Ctrl+G</h1>\r\n");
      out.write("            </figcaption>\r\n");
      out.write("            <div id= \"logeo2\">\r\n");
      out.write("                <h2> Control De Gestión </h2>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </header>\r\n");
      out.write("        <div id= \"contenido\">\r\n");
      out.write("\r\n");
      out.write("            <div id =\"image_index\"> \r\n");
      out.write("\r\n");
      out.write("                <div id = \"paraima\">\r\n");
      out.write("                    <p class = \"Lead\">Sistema de información diseñado para optimizar los ingresos del Call Center, otorgándole el control total de los ingresos de su empresa.</p>\r\n");
      out.write("\r\n");
      out.write("                </div> \r\n");
      out.write("            </div>\r\n");
      out.write("            <div id = \"Login\">\r\n");
      out.write("\r\n");
      out.write("                <h4>Ingreso al Sistema</h4>\r\n");
      out.write("                <form id=\"FormularioRgistro\" role=\"form\" action=\"Login\">\r\n");
      out.write("                    \r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <label  for=\"nommail\">Correo Corporativo</label>\r\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"nommail\" name=\"nommail\" placeholder=\"carlos.santana\" tabindex=\"1\" required=\"\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"Clave\">Crontraseña</label>\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" id=\"clave\" name=\"clave\" placeholder=\"&#9679;&#9679;&#9679;&#9679;&#9679;\" tabindex=\"3\" required=\"\" >\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"checkbox\">\r\n");
      out.write("                        <label>\r\n");
      out.write("                            <input type=\"checkbox\">Recordar Contraseña</label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <input type=\"hidden\" name=\"UserIn\" id=\"UserIn\" value=\"\"/>\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-default\" name=\"ValidUser\" id=\"ValidUser\">Ingresar</button>\r\n");
      out.write("                        \r\n");
      out.write("                </form>\r\n");
      out.write("                <br>\r\n");
      out.write("                <div class=\"text-right\"><a href= \"solicitaracceso.jsp\" class=\"fontWi\">Solicitar acceso</a> </div>\r\n");
      out.write("                ");
   if (request.getParameter("sal") != null) { 
      out.write("\r\n");
      out.write("                <div id=\"bg-info\"> \r\n");
      out.write("                ");
  out.print(request.getParameter("sal"));  
      out.write("\r\n");
      out.write("             </div>\r\n");
      out.write("                <p></p>\r\n");
      out.write("                <p><a href= \"recuperaclave.jsp\">Recuperar contraseña</a> </p>\r\n");
      out.write("                ");
}
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("    <footer>©Año 2015 Ctrl+G - PROYECTO FORMATIVO</footer>\r\n");
      out.write("    <script>\r\n");
      out.write("        $().ready(function () {\r\n");
      out.write("            // validaciÃ³n del formulario\r\n");
      out.write("            $(\"#FormularioRgistro\").validate({\r\n");
      out.write("                rules: {\r\n");
      out.write("                    nommail: {required: true, minlength: 5, maxlength: 40},\r\n");
      out.write("                    clave: {required: true, minlength: 6},\r\n");
      out.write("                },\r\n");
      out.write("                // highlight: function(element) {\r\n");
      out.write("                //   $(element).closest('.control-group')\r\n");
      out.write("                //   .removeClass('success').addClass('error');\r\n");
      out.write("                // },\r\n");
      out.write("                // success: function(element) {\r\n");
      out.write("                //   element\r\n");
      out.write("                //   .text('OK!').addClass('help-inline')\r\n");
      out.write("                //   .closest('.control-group')\r\n");
      out.write("                //   .removeClass('error').addClass('success');\r\n");
      out.write("                // }\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
