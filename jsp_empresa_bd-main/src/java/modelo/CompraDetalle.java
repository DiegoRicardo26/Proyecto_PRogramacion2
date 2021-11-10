package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CompraDetalle {

    Conexion cn;

    private int idCompra_detalle, idCompra, idProducto, cantidad;
    private double precio_unitario;

    public CompraDetalle() {
    }

    public CompraDetalle( int idCompra, int idProducto, int cantidad, double precio_unitario) {
       // this.idCompra_detalle = idCompra_detalle;
        this.idCompra = idCompra;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
    }

    public int getIdCompra_detalle() {
        return idCompra_detalle;
    }

    public void setIdCompra_detalle(int idCompra_detalle) {
        this.idCompra_detalle = idCompra_detalle;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
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
            String query = "INSERT INTO compras_detalle( idCompra, idProducto, Cantidad, Precio_costo_unitario) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdCompra());
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
            String query = "UPDATE compras_detalle SET idProducto=?,Cantidad=? ,Precio_costo_unitario=? WHERE idCompra= ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdProducto());
            parametro.setInt(2, getCantidad());
            parametro.setDouble(3, getPrecio_unitario());
            parametro.setInt(4, getIdCompra());
            
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
            String query = "DELETE FROM compras_detalle WHERE idCompra = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdCompra());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
}
