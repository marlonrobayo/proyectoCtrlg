<%
    HttpSession sesion = request.getSession(false);
    if (sesion.getAttribute("varDatosU") == null) {
        response.sendRedirect("index.jsp");
    } else {
        sesion.removeAttribute("varDatosU");
        sesion.removeAttribute("varMenu");
        sesion.removeAttribute("varMenu");
        sesion.removeAttribute("idlistar");
        sesion.invalidate();
        response.sendRedirect("index.jsp");

    }

%>
