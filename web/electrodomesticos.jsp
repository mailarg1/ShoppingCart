<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%-- Importaciones --%>
<%@page import="java.util.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.controllers.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.entities.*"%>

<%
    // Constrola que exista la sesion de usuario
    if( session.getAttribute("user") == null )
        response.sendRedirect("index.jsp");

    // Obtiene los electrodomesticos
    ArrayList items = VentasController.obtenerElectrodomesticos();

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
        <b><font color="red"><h2>Listado de Electrodomesticos</h2></font></b>
        <table border="1" cellpadding="5" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">
        <tr>
          <td width="5%" bgcolor="#0000FF"><b><font color="#FFFFFF">#</font></b></td>
          <td width="15%" bgcolor="#0000FF"><b><font color="#FFFFFF">Nombre</font></b></td>
          <td width="40%" bgcolor="#0000FF"><b><font color="#FFFFFF">Descripcion</font></b></td>
          <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Precio</font></b></td>      
          <td width="10%" bgcolor="#0000FF"><b><font color="#FFFFFF">Stock</font></b></td>
          <td width="20%" bgcolor="#0000FF"><b><font color="#FFFFFF">Carrito</font></b></td>
        </tr>    
  
<%  
    // Informa los items si hay al menos uno
    if( items.size() != 0 )
    {
        // Variables
        Iterator it = items.iterator();
        int contador = 0;
        
        // Informa los datos de cada item
        while( it.hasNext() )
        {
            contador++;
            Producto p = (Producto) it.next();
%>
            <tr>
                <td width="5%"><B><%=contador%>.</B></td>
                <td width="15%"><%=p.getNombre()%></td>
                <td width="40%"><%=p.getDetalle()%></td>
                <td width="10%">$<%=p.getPrecio()%></td>
                <td width="10%"><%=p.getStock()%></td>                
                <td width="20%">
                    <a href=bienvenido.jsp?accion=agregar_al_carrito&id=<%=p.getId()%> >Agregar</a>
                </td>
            </tr>
<%
        }
    }
%>
        </table>    
    
    </div>
    </body>
</html>
