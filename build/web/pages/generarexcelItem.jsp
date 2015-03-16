<%-- 
    Document   : generarexcel
    Created on : 26-ago-2014, 9:27:18
    Author     : Aprendiz
--%>


<%@page import="Dto.ItemDTO"%>
<%@page import="Modelo.ItemDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=UTF-8">
        <title>JSP Page</title>
        <!--esto debe ir en todas la paginas JSP para no almacenar cache-->
        <% response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);%>

    </head>
    <body>
        <%
                String paraFiltro = "";
                if (session.getAttribute("filtroid") != null && session.getAttribute("filtroid") != "") {
                    paraFiltro = (String) session.getAttribute("filtroid");

                }

                ItemDAO listItems = new ItemDAO();
                ArrayList<ItemDTO> listadelosItem = listItems.listarTodosItem(paraFiltro);
            %>
        


        <table border="1">

            <thead>
                                <tr>    
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Valor unitario</th>
                                    <th>Variable Facturable</th>
                                    <th>CeCo</th>

                                  
                                    <th>Tipo Moneda</th>
                                    

                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>  
    
            <tbody>



                <%
                    String nombreArchivo = "ItemsFacturables" +   new  Date() + ".xls";
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivo + "\"");
                   for (ItemDTO itemss : listadelosItem) {%>
                <tr>    
                                    <td><%=itemss.getItemID()%></td>
                                    <td><%=itemss.getItemNombre()%></td>
                                    <td><%=itemss.getItemValorUnit()%></td>
                                    <td><%=itemss.getNombreVariableFac()%></td>
                                    <td><%=itemss.getItemCeCo()%></td>
                                  
                                    <td><%=itemss.getNombreMoneda()%></td>
                                    <td>
                                    </td>

                                    <td>
                                        
                                    </td>
                                </tr>



                                <% }
                                    %>
            </tbody>
        </table> 
    </body>
</html>
