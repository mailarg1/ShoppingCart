/*
 * ShoppingCartItem.java
 *
 */

package ar.com.educacionit.webprogramming.sessions.entities;

/**
 *
 * @author Sebastian S. Sanga
 */
public class ShoppingCartItem {
    
    // Atributos
    private Producto producto;
    private int cantidad;
    
    /** Creates a new instance of ShoppingCartItem */
    public ShoppingCartItem() {
    }
    
    public ShoppingCartItem(Producto p, int cant)
    {
        setProducto(p);
        setCantidad(cant);
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
