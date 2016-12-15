/*
 * VentasController.java
 *
 */

package ar.com.educacionit.webprogramming.sessions.controllers;

import ar.com.educacionit.webprogramming.sessions.database.ConnectionManager;
import ar.com.educacionit.webprogramming.sessions.entities.Producto;
import ar.com.educacionit.webprogramming.sessions.entities.ShoppingCart;
import ar.com.educacionit.webprogramming.sessions.entities.ShoppingCartItem;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sebastian S. Sanga
 */
public class VentasController {
    
    /** Creates a new instance of VentasController */
    public VentasController() {
    }
    
    public static void agregarProductoAlCarrito(HttpServletRequest request, int idProducto, int cantidad) throws Exception
    {
        // Obtiene la sesion
        HttpSession session = request.getSession();
        
        // Obtiene el item
        Producto p = Producto.obtenerPorId( ConnectionManager.getConnection(), idProducto );
        
        // Obtiene el carrito de la sesion
        ShoppingCart sc = (ShoppingCart) session.getAttribute("carrito");
        
        // Construye un ShoppingCartItem
        ShoppingCartItem item = new ShoppingCartItem(p, cantidad);
        
        // Actualiza el carrito
        sc.agregarItem(item);
    }
    
    public static void quitarProductoDelCarrito(HttpServletRequest request, int idProducto, int cantidad) throws Exception
    {
        // Obtiene la sesion
        HttpSession session = request.getSession();
        
        // Obtiene el carrito de la sesion
        ShoppingCart sc = (ShoppingCart) session.getAttribute("carrito");
        
        // Obtiene el item
        sc.quitarItem(idProducto, cantidad);
    }
    
    public static ArrayList obtenerElectrodomesticos() throws Exception
    {
        ArrayList productos = Producto.obtener( ConnectionManager.getConnection(), Producto.ELECTRODOMESTICO );
        return productos;
    }
    
    public static ArrayList obtenerDVDs() throws Exception
    {
        ArrayList productos = Producto.obtener( ConnectionManager.getConnection(), Producto.DVD );
        return productos;
    }    
    
    public static ArrayList obtenerProductosDeBazaar() throws Exception
    {
        ArrayList productos = Producto.obtener( ConnectionManager.getConnection(), Producto.BAZAAR );
        return productos;
    }        
}
