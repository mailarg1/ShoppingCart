<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%-- Importaciones --%>
<%@page import="ar.com.educacionit.webprogramming.sessions.database.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.entities.*"%>
<%@page import="ar.com.educacionit.webprogramming.sessions.entities.*"%>

<%-- Uso de un bean para el formulario --%>
<jsp:useBean class="ar.com.educacionit.webprogramming.sessions.beans.UsuarioBean" id="signInForm" />
<jsp:setProperty name="signInForm" property="*" />

<%
    // Construye un mensaje
    String mensaje = "";
    
    // Si la acción es login...
    if( signInForm.getAccion().equals("signin") )
    {
        // Establece el mensaje
        mensaje = "El usuario no coincide con la contraseña";
        
        // Obtiene el usuario
        Usuario user = Usuario.crear( ConnectionManager.getConnection(), signInForm.getUsername(), signInForm.getPassword(), signInForm.getEmail() );
        System.out.println(user);
        // Si el usuario es valido...
        
        if( user != null )
        {
            // Guarda al usuario como session
            System.out.println("ENTRA!");
            session.setAttribute("user", user);
            
            // Redirecciona el usuario a bienvenido.jsp
            response.sendRedirect( response.encodeRedirectURL("index.jsp") );
        }

    }
    
    // Si la accion es logout...
    if( signInForm.getAccion().equals("logout") )
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
    <div align="center"><h1>Proyecto-ShoppingCart :: Sign In</h1></div>
    <hr>
    <div align=center>
    <form method="POST" action="user_sign_in.jsp">
        <input type="hidden" name=accion value=signin>
        username: <input type="text" name=username>
        <br><br>
        password: <input type="password" name=password>
        <br><br>
        confirm password: <input type="password" name=password_confirm>
        <br><br>
        nombre <input type="text" name=nombre>
        <br><br>
        apellido <input type="text" name=apellido> 
        <br><br>
        email: <input type="text" name=email>         
        <hr>
        <input type=submit value=Register><br>
        <font color="red"><%=mensaje%></font>
    </form>
    </div>
    </body>
</html>
