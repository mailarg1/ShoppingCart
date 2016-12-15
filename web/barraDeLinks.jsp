<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%-- Obtiene el carrito de compras como session --%>
<jsp:useBean class="ar.com.educacionit.webprogramming.sessions.entities.ShoppingCart" id="carrito" scope="session" />

<div align="right">
    Bienvenido, <i><b><%=session.getAttribute("user")%></b></i>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="index.jsp?accion=logout">[Logout]</a>
</div>
<hr>
<div align="right">
    <a href="<%=response.encodeURL("bienvenido.jsp")%>">[Ver carrito]</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=response.encodeURL("dvds.jsp")%>">[DVDs]</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=response.encodeURL("bazaar.jsp")%>">[Bazaar]</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=response.encodeURL("electrodomesticos.jsp")%>">[Electrodomesticos]</a>
</div>