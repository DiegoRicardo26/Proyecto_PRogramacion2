
package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VentaDetalle {
    Conexion cn;
    private int idVenta_detalle,idVenta,idProducto,cantidad;
    private double precio_unitario;

    public VentaDetalle() {
    }

    public VentaDetalle(int idVenta, int idProducto, int cantidad, double precio_unitario) {
        this.idVenta = idVenta;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
    }

    public int getIdVenta_detalle() {
        return idVenta_detalle;
    }

    public void setIdVenta_detalle(int idVenta_detalle) {
        this.idVenta_detalle = idVenta_detalle;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(double precio_unitario) {
        this.precio_unitario = precio_unitario;
    }
    
     public int agregar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO ventas_detalle( idVenta, idProducto, Cantidad, Precio_unitario) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdVenta());
            parametro.setInt(2, getIdProducto());
            parametro.setInt(3, getCantidad());
            parametro.setDouble(4, getPrecio_unitario());
          

            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

    public int modificar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE ventas_detalle SET idProducto=?,Cantidad=?,Precio_unitario=? WHERE idVenta= ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdProducto());
            parametro.setInt(2, getCantidad());
            parametro.setDouble(3, getPrecio_unitario());
            parametro.setInt(4, getIdVenta());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

    public int eliminar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM ventas_detalle WHERE idVenta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdVenta());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
    
    
}
