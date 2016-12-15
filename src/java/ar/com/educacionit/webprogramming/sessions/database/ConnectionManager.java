/*
 * ConnectionManager.java
 *
 *
 */

package ar.com.educacionit.webprogramming.sessions.database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sebasti�n S. Sanga
 */
public abstract class ConnectionManager {
    
    /** Creates a new instance of ConnectionManager */
    public ConnectionManager() {
    }

    public static Connection getConnection() throws Exception
    {

        // Establece el nombre del driver a utilizar
        String dbDriver = "com.mysql.jdbc.Driver";
        
        // Establece la conexion a utilizar contra la base de datos
        String dbConnString = "jdbc:mysql://localhost/j2ee-web";
        
        // Establece el usuario de la base de datos
        String dbUser = "root";
        
        // Establece la contrase�a de la base de datos
        String dbPassword = "admin";
        
        // Establece el driver de conexion
        Class.forName(dbDriver).newInstance();
        
        // Retorna la conexion
        return DriverManager.getConnection(dbConnString, dbUser, dbPassword);
    }    
    
}
