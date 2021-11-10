package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class Ventas {

    Conexion cn;
    private int id, noFactura;
    private String serie, fecha;
    private int idCliente, idEmpleado;
    private String ingreso;

    public Ventas() {
    }

    public Ventas(int id, int noFactura, String serie, String fecha, int idCliente, int idEmpleado, String ingreso) {
        this.id = id;
        this.noFactura = noFactura;
        this.serie = serie;
        this.fecha = fecha;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.ingreso = ingreso;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNoFactura() {
        return noFactura;
    }

    public void setNoFactura(int noFactura) {
        this.noFactura = noFactura;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
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
            String query = "SELECT v.idVenta, v.Nofactura, v.Serie, v.Fechafactura, v.idCliente, v.idEmpleado, v.Fechaingreso,c.nombres as clien,e.nombres as emp,d.idProducto,d.cantidad,d.precio_unitario FROM ventas as v INNER JOIN empleados as e on v.idEmpleado=e.idEmpleado INNER JOIN clientes as c on v.idCliente=c.idCliente INNER JOIN ventas_detalle as d on v.Nofactura=d.idVenta;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"ID", "Proveedor", "NIT", "Direccion", "telefono", "Proveedor", "NIT", "Direccion", "telefono","Direccion", "telefono","telefono"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[12];
            while (consulta.next()) {
                datos[0] = consulta.getString("idVenta");
                datos[1] = consulta.getString("Nofactura");
                datos[2] = consulta.getString("Serie");
                datos[3] = consulta.getString("Fechafactura");
                datos[4] = consulta.getString("idCliente");
                datos[5] = consulta.getString("idEmpleado");
                datos[6] = consulta.getString("Fechaingreso");
                datos[7] = consulta.getString("clien");
                datos[8] = consulta.getString("emp");
                datos[9] = consulta.getString("idProducto");
                datos[10] = consulta.getString("cantidad");
                datos[11] = consulta.getString("precio_unitario");

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
            String query = "INSERT INTO ventas( Nofactura, Serie, Fechafactura, idCliente, idEmpleado, Fechaingreso) VALUES  (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNoFactura());
            parametro.setString(2, getSerie());
            parametro.setString(3, getFecha());
            parametro.setInt(4, getIdCliente());
            parametro.setInt(5, getIdEmpleado());
            parametro.setString(6, getIngreso());

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
            String query = "UPDATE ventas SET Nofactura=?,Serie=?,Fechafactura=?,idCliente=?,idEmpleado=?,Fechaingreso=? WHERE idVenta= ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNoFactura());
            parametro.setString(2, getSerie());
            parametro.setString(3, getFecha());
            parametro.setInt(4, getIdCliente());
            parametro.setInt(5, getIdEmpleado());
            parametro.setString(6, getIngreso());
            parametro.setInt(7, getId());
            
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
            String query = "DELETE FROM ventas WHERE idVenta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

}
