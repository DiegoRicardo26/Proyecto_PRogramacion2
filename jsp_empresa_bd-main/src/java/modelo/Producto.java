package modelo;

import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;
//import org.omg.CORBA_2_3.portable.InputStream;

public class Producto {

    Conexion cn;

    private int idProducto;
    private String producto;
    private int idMarca;
    private String descripcion;
    private String imagen;
    private int costo, venta, existencia;
    private String ingreso;

    public Producto() {
    }

    public Producto(int idProducto, String producto, int idMarca, String descripcion, String imagen, int costo, int venta, int existencia, String ingreso) {
        this.idProducto = idProducto;
        this.producto = producto;
        this.idMarca = idMarca;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.costo = costo;
        this.venta = venta;
        this.existencia = existencia;
        this.ingreso = ingreso;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public int getVenta() {
        return venta;
    }

    public void setVenta(int venta) {
        this.venta = venta;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getIngreso() {
        return ingreso;
    }

    public void setIngreso(String ingreso) {
        this.ingreso = ingreso;
    }

    public HashMap drop() {
        HashMap<String, String> drop = new HashMap();
        try {
            String query = "Select idProducto,producto from productos ORDER by idProducto ASC";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("idProducto"), consulta.getString("producto"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT p.idProducto as id, p.producto,  m.Marca as marca, p.descripcion, p.imagen,"
                    + " p.precio_costo as Costo, p.precio_venta as Venta, p.existencia, fecha_ingreso as Ingreso,m.idMarca from productos "
                    + "as p inner join marcas as m on p.idMarca = m.idMarca;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id", "DPI", "nombres", "apellidos", "direccion", "telefono", "nacimiento", "puesto", "id_puesto", "id_puesto"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[11];
            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("producto");
                datos[2] = consulta.getString("marca");
                datos[3] = consulta.getString("descripcion");
                datos[4] = consulta.getString("imagen");
                datos[5] = consulta.getString("costo");
                datos[6] = consulta.getString("venta");
                datos[7] = consulta.getString("existencia");
                datos[8] = consulta.getString("Ingreso");
                datos[9] = consulta.getString("idMarca");
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
            String query = "INSERT INTO productos (producto, idMarca, descripcion, imagen, precio_costo, precio_venta, existencia, fecha_ingreso) VALUES (?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setInt(2, getIdMarca());
            parametro.setString(3, getDescripcion());
            parametro.setString(4, getImagen());
            parametro.setInt(5, getCosto());
            parametro.setInt(6, getVenta());
            parametro.setInt(7, getExistencia());
            parametro.setString(8, getIngreso());

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
            String query = "UPDATE productos set producto=?, idMarca=?, descripcion=?, imagen=?, precio_costo=?,precio_venta=?,existencia=?,fecha_ingreso=? WHERE idProducto = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setInt(2, getIdMarca());
            parametro.setString(3, getDescripcion());
            parametro.setString(4, getImagen());
            parametro.setInt(5, getCosto());
            parametro.setInt(6, getVenta());
            parametro.setInt(7, getExistencia());
            parametro.setString(8, getIngreso());
            parametro.setInt(9, getIdProducto());
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
            String query = "DELETE FROM productos WHERE idProducto = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getIdProducto());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

    public int modificarStock(int id, int stock) {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE productos as p set existencia =(\n"
                    + "SELECT SUM(p.existencia)-SUM(?) FROM ventas_detalle AS d\n"
                    + "WHERE p.idProducto=?)\n"
                    + "AND p.idProducto = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, stock);
            parametro.setInt(2, id);
            parametro.setInt(3, id);

            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

}
