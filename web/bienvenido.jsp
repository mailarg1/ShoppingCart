<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%-- Importaciones --%>
<%@page import="java.util.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.entities.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.controllers.*"%>

<%-- Obtiene el carrito de compras como session --%>
<jsp:useBean class="ar.com.educacionit.webprogramming.sessions.entities.ShoppingCart" id="carrito" scope="session" />

<%
    // Controla que exista la sesion de usuario
    if( session.getAttribute("user") == null )
        response.sendRedirect("index.jsp");
%>

<%
   // Si la accion es "agregar_al_carrito", agrega el item
   if( request.getParameter("accion") != null && request.getParameter("accion").equals("agregar_al_carrito") )
   {
        VentasController.agregarProductoAlCarrito(request, Integer.parseInt(request.getParameter("id")), 1);
   }
   // Si la accion es "agregar_al_carrito", agrega el item
   else if( request.getParameter("accion") != null && request.getParameter("accion").equals("quitar_del_carrito") )
   {
        VentasController.quitarProductoDelCarrito(request, Integer.parseInt(request.getParameter("id")), 1);
   }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>educacionIT :: Proyecto-Sessions</title>
    </head>
    <body>
    <jsp:include page="encabezado.jsp" />
    <div align="right"><h1>Proyecto-Sessions-ShoppingCart :: Bienvenido</h1><div>
    <hr>
    <jsp:include page="barraDeLinks.jsp" />
    <hr>
    <div align="center">
        <b><font color="green"><h2>Estado del carrito de compras</h2></font></b><br><br>
<%
        if( carrito.getProductos().size() == 0 )
        {
            out.println("El carrito de compras está vacío...");
        }
        else
        {
%>
            <table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
                <tr>
                  <td width="5%" bgcolor="#0000FF"><b><font color="#FFFFFF">#</font></b></td>
                  <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Nombre</font></b></td>
                  <td width="35%" bgcolor="#0000FF"><b><font color="#FFFFFF">Descripcion</font></b></td>
                  <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Tipo</font></b></td>      
                  <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Precio</font></b></td>      
                  <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Cantidad</font></b></td>
                  <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Subtotal</font></b></td>
                  <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Quitar</font></b></td>
                </tr>    
<%
            // Variables
            Iterator it = carrito.getProductos().values().iterator();
            int contador = 0;
            
            // Informa los datos de cada item
            while( it.hasNext() )
            {
                contador++;
                ShoppingCartItem item = (ShoppingCartItem) it.next();
                Producto p = item.getProducto();
%>
                <tr>
                    <td width="5%"><B><%=contador%>.</B></td>
                    <td width="10%"><%=p.getNombre()%></td>
                    <td width="35%"><%=p.getDetalle()%></td>
                    <td width="10%"><%=p.getTipoAsString()%></td>
                    <td width="10%">$<%=p.getPrecio()%></td>
                    <td width="10%"><%=item.getCantidad()%></td>
                    <td width="10%">$<%=( p.getPrecio() * item.getCantidad() )%></td>
                    <td width="10%">
                        <a href=bienvenido.jsp?accion=quitar_del_carrito&id=<%=p.getId()%> >[ - ]</a>
                    </td>
                </tr>
<%
            }
        }
    %>
            </table>
            <br><br>El precio total es: <font color="blue"><b>$ <%=carrito.getPrecioTotal()%></B></font>
    </div>
    </body>
</html>
