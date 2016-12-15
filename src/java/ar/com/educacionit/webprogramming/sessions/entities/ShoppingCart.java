/*
 * ShoppingCart.java
 *
 */

package ar.com.educacionit.webprogramming.sessions.entities;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Sebastian S. Sanga
 */
public class ShoppingCart {
    
    private HashMap items = new HashMap();
    private float precioTotal;
    
    /** Creates a new instance of ShoppingCart */
    public ShoppingCart() {
    }

    public void agregarItem(ShoppingCartItem item)
    {
        // Si el producto esta, incrementa la cantidad
        if( items.containsKey( new Integer(item.getProducto().getId()) ) )
        {
            ShoppingCartItem cartItem = (ShoppingCartItem) items.get( new Integer(item.getProducto().getId()) );
            cartItem.setCantidad( cartItem.getCantidad() + item.getCantidad() );
        }
        // Si el producto no esta, lo agrega
        else
        {
            items.put( new Integer(item.getProducto().getId()), item );
        }
        
        // Actualiza el precio total
        setPrecioTotal( getPrecioTotal() + (item.getProducto().getPrecio() * item.getCantidad()) );
    }

    public ShoppingCartItem obtenerItemPorId(int id)
    {
        // Si el producto esta, lo retorna
        if( items.containsKey( new Integer(id) ) )
            return (ShoppingCartItem) items.get( new Integer(id) );
        
        // Si el producto no esta, retorna null
        return null;
    }
    
    public void quitarItem(int id, int cant)
    {
        // Si el producto esta, decrementa su cantidad
        if( items.containsKey( new Integer(id) ) )
        {
            ShoppingCartItem item = (ShoppingCartItem) items.get( new Integer(id) );
            item.setCantidad( item.getCantidad() - cant );
            
            // Si la cantidad es cero, quita el producto definitivamente
            if( item.getCantidad() <= 0 )
                items.remove( new Integer(id) );
            
            // Actualiza el precio total
            setPrecioTotal( getPrecioTotal() - (item.getProducto().getPrecio() * cant) );
            
            // Si el precio es menor a cero, establecer cero
            if( getPrecioTotal() < 0 )
                setPrecioTotal(0);
        }
    }
    
    public HashMap getProductos() {
        return items;
    }

    public void setProductos(HashMap productos) {
        this.items = productos;
    }

    public float getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(float precioTotal) {
        this.precioTotal = precioTotal;
    }
    
}
