package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class Menu {
    
     Conexion cn;
    private String nombre,padre,hijo;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPadre() {
        return padre;
    }

    public void setPadre(String padre) {
        this.padre = padre;
    }

    public String getHijo() {
        return hijo;
    }

    public void setHijo(String hijo) {
        this.hijo = hijo;
    }

   
      public List drop() {
        //HashMap<String, String> drop = new HashMap();
        List<Menu>  drop = new ArrayList<Menu>();
       
        try {
            String query = "Select contenido,padre,hijo from menu ORDER by id_menu ASC;";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                 Menu dinamico = new Menu();
                 dinamico.setNombre(consulta.getString("contenido"));
                 dinamico.setPadre(consulta.getString("padre"));
                 dinamico.setHijo(consulta.getString("hijo"));
                 drop.add(dinamico);
                //drop.put(consulta.getString("contenido"), consulta.getString("roles"));
                
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }
}