package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class Compras {

    Conexion cn;

    private int idCompra, ordenCompra, idProveedor;
    private String fecha, ingreso;

    public Compras() {
    }

    public Compras(int idCompra, int ordenCompra, int idProveedor, String fecha, String ingreso) {
        this.idCompra = idCompra;
        this.ordenCompra = ordenCompra;
        this.idProveedor = idProveedor;
        this.fecha = fecha;
        this.ingreso = ingreso;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getOrdenCompra() {
        return ordenCompra;
    }

    public void setOrdenCompra(int ordenCompra) {
        this.ordenCompra = ordenCompra;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getIngreso() {
        return ingreso;
    }

    public void setIngreso(String ingreso) {
        this.ingreso = ingreso;
    }
    
     public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT c.idCompra, c.No_orden_compra, c.idProveedor,p.proveedor, c.Fecha_orden, c.Fechaingreso,d.idProducto,d.cantidad,d.Precio_costo_unitario FROM compras as c INNER JOIN proveedores as p on c.idProveedor=p.idProveedor INNER JOIN compras_detalle as d on c.No_orden_compra=d.idCompra;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"ID", "Proveedor", "NIT", "Direccion", "telefono", "Proveedor", "NIT", "Direccion", "telefono","Direccion", "telefono","telefono"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[12];
            while (consulta.next()) {
                datos[0] = consulta.getString("idCompra");
                datos[1] = consulta.getString("No_orden_compra");
                datos[2] = consulta.getString("idProveedor");
                datos[3] = consulta.getString("proveedor");
                datos[4] = consulta.getString("Fecha_orden");
                datos[5] = consulta.getString("Fechaingreso");
                datos[6] = consulta.getString("idProducto");
                datos[7] = consulta.getString("cantidad");
                datos[8] = consulta.getString("Precio_costo_unitario");

                tabla.addRow(datos);

            }

            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return tabla;
    }

    public int agregar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO compras( No_orden_compra, idProveedor, Fecha_orden, Fechaingreso) VALUES   (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getOrdenCompra());
            parametro.setInt(2, getIdProveedor());
            parametro.setString(3, getFecha());
            parametro.setString(4, getIngreso());

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
            String query = "UPDATE compras SET No_orden_compra=?,idProveedor=?,Fecha_orden=?,Fechaingreso=? WHERE idCompra=?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getOrdenCompra());
            parametro.setInt(2, getIdProveedor());
            parametro.setString(3, getFecha());
            parametro.setString(4, getIngreso());
            parametro.setInt(5, getIdCompra());
            
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
            String query = "DELETE FROM compras WHERE idCompra = ?;";
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
