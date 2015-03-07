package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Dto.ClientesDTO;
import Modelo.ClienteDAO;
import Dto.TipoMonedaDTO;
import Modelo.TipoMonedaDAO;
import Dto.VariableFacDTO;
import Modelo.VariableFacDAO;
import Modelo.CecoDAO;
import Dto.CecoDTO;
import Dto.ItemDTO;
import Modelo.ItemDAO;
import Modelo.PermisosDAO;
import Dto.PermisosDTO;
import java.util.ArrayList;
import Dto.PersonasDTO;

public final class administrarCliente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/bootstrap.css\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"Logo.ico\" />\r\n");
      out.write("\r\n");
      out.write("        <title>Administrar Item facturable</title>\r\n");
      out.write("\r\n");
      out.write("        <script src=\"js/jquery.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery.js\"></script>\r\n");
      out.write("        <script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery-ui.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery.validate.js\"></script>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/Estilos001.css\">\r\n");
      out.write("        <link href=\"CSS/jquery-ui.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <script src=\"js/paging.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        ");

            HttpSession sesion = request.getSession(false);

            if (sesion.getAttribute("varDatosU") == null) {
                response.sendRedirect("index.jsp");
            } else {
                ArrayList<PermisosDTO> listaPermi = (ArrayList) sesion.getAttribute("varMenu");
        
      out.write("\r\n");
      out.write("        <header>\r\n");
      out.write("            <figure> <a href= \"administraritemfacturable.jsp\"> <img src=\"imagenes/logo.png\" alt=\"logo\" /></a> </figure>\r\n");
      out.write("            <figcaption> <a href= \"parametrizaritemfacturable.jsp\">\r\n");
      out.write("                    <h1>Ctrl+G</h1>\r\n");
      out.write("                </a> </figcaption>\r\n");
      out.write("            <nav> \r\n");
      out.write("\r\n");
      out.write("                ");
for (PermisosDTO permi : listaPermi) {
      out.write(" \r\n");
      out.write("\r\n");
      out.write("                <a href=\"");
out.print(permi.getUrl());
      out.write("\"> ");
out.print(permi.getNombrePagina());
      out.write(" </a>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                ");
}
      out.write("                \r\n");
      out.write("\r\n");
      out.write("            </nav>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </header>\r\n");
      out.write("        <div id= \"panel\">  \r\n");
      out.write("\r\n");
      out.write("            <div id=\"logeo\">\r\n");
      out.write("                ");

                    PersonasDTO usuarioMostrar = new PersonasDTO();
                    usuarioMostrar = (PersonasDTO) sesion.getAttribute("varDatosU");
                    out.print(usuarioMostrar.getNombreCompleto());

                
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <a href=\"cerrarsesion.jsp\"><h6>Cerrar Sesión</h6></a> \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>  \r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div id= \"contenido\"> \r\n");
      out.write("\r\n");
      out.write("            <h4>Clientes Corporativos</h4>\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-sm-6 col-md-4\">\r\n");
      out.write("                    <div class=\"thumbnail\">\r\n");
      out.write("                        <img src=\"...\" alt=\"...\">\r\n");
      out.write("                        <div class=\"caption\" id=\"cap2\">\r\n");
      out.write("                            \r\n");
      out.write("                            <p>texto de ejemplo</p>\r\n");
      out.write("                            <p><a href=\"#\" class=\"btn btn-primary\" role=\"button\">Button</a> <a href=\"#\" class=\"btn btn-default\" role=\"button\">Button</a></p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            <hr>\r\n");
      out.write("            ");
 ClienteDAO listf = new ClienteDAO();
                ArrayList<ClientesDTO> listarClies = listf.listarTodosClientes();
            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class =\"table-responsive\" >\r\n");
      out.write("                <table class = \"table table-striped table-bordered table-hover table-condensed\" id=\"itemLista\">\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr>    \r\n");
      out.write("                            <th>Nit</th>\r\n");
      out.write("                            <th>Nombre</th>\r\n");
      out.write("                            <th>Código SAP</th>\r\n");
      out.write("                            <th>Radicación Factura</th>\r\n");
      out.write("                            <th>Tipo Radicación</th>\r\n");
      out.write("\r\n");
      out.write("                            <th>Analista</th>\r\n");
      out.write("\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>  \r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        ");
for (ClientesDTO cliesss : listarClies) {
      out.write("\r\n");
      out.write("                        <tr>    \r\n");
      out.write("                            <td>");
      out.print(cliesss.getNitCliente());
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print(cliesss.getNombreCliente());
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print(cliesss.getSapCodigoCliente());
      out.write("</td>\r\n");
      out.write("                            <td>                     \r\n");
      out.write("\r\n");
      out.write("                                <select   name=\"txtVariable\" id=\"txtVariable\" tabindex=\"2\">\r\n");
      out.write("                                    <option value=\"\" selected=\"\" disabled=\"\" >Seleccione Analista </option>\r\n");
      out.write("\r\n");
      out.write("                                    <option value=\"\"></option>  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                </select>\r\n");
      out.write("\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td></td>\r\n");
      out.write("\r\n");
      out.write("                            <td></td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        </tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                        ");
 }
                                    }
      out.write("\r\n");
      out.write("                    </tbody>   \r\n");
      out.write("                </table>\r\n");
      out.write("\r\n");
      out.write("                <div id=\"pageNavPosition\" align = \"center\"> \r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <script type=\"text/javascript\">\r\n");
      out.write("                    var pager = new Pager('itemLista', 15);\r\n");
      out.write("                    pager.init();\r\n");
      out.write("                    pager.showPageNav('pager', 'pageNavPosition');\r\n");
      out.write("                    pager.showPage(1);\r\n");
      out.write("                </script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("    <footer>Â© 2014 Ctrl+G - proyecto formativo</footer>\r\n");
      out.write("    <!-- InstanceEnd -->\r\n");
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
