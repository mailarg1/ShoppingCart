<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%-- Importaciones --%>
<%@page import="ar.com.educacionit.webprogramming.sessions.database.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.entities.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.entities.*"%>

<%-- Uso de un bean para el formulario --%>
<jsp:useBean class="ar.com.educacionit.webprogramming.sessions.beans.UsuarioBean" id="loginForm" />
<jsp:setProperty name="loginForm" property="*" />

<%
    // Construye un mensaje
    String mensaje = "";
    
    // Si la acción es login...
    if( loginForm.getAccion().equals("login") )
    {
        // Establece el mensaje
        mensaje = "El usuario no coincide con la contraseña";
        
        // Obtiene el usuario
        Usuario user = Usuario.obtener( ConnectionManager.getConnection(), loginForm.getUsername(), loginForm.getPassword() );
        System.out.println(user);
        // Si el usuario es valido...
        
        if( user != null )
        {
            // Guarda al usuario como session
            System.out.println("ENTRA!");
            session.setAttribute("user", user);
            
            // Redirecciona el usuario a bienvenido.jsp
            response.sendRedirect( response.encodeRedirectURL("bienvenido.jsp") );
        }

    }
    
    // Si la accion es logout...
    if( loginForm.getAccion().equals("logout") )
    {
        session.invalidate();
    }
 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.educacionIT.com.ar :: Proyecto-ShoppingCart</title>
    </head>
    <body>
    <jsp:include page="encabezado.jsp" />
    <div align="center"><h1>Proyecto-ShoppingCart :: Forgot Password</h1></div>
    <hr>
    <div align=center>
    <form method="POST" action="forgot_password.jsp">
        <input type="hidden" name=accion value=login>
        username: <input type="text" name=username>
        <br><br>
        password: <input type="password" name=password>
        <br><br>
        <a href="./bazaar.jsp"><font face="sans-serif" size="2">Forgot password?</font></a>
        <hr>
        <input type=submit value=Login><br>
        <font color="red"><%=mensaje%></font>
    </form>
    </div>
    </body>
</html>
