/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Producto;
//import org.omg.CORBA_2_3.portable.InputStream;

/**
 *
 * @author jorge
 */
@WebServlet(name = "sr_productos", urlPatterns = {"/sr_productos"})
public class sr_productos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Producto producto;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_productos</title>");
            out.println("</head>");
            out.println("<body>");
            String fotoName="";
            try{
                Part archivo = request.getPart("txt_img"); //llamada al parámetro foto de mi formulario.
            String context = request.getServletContext().getRealPath("img"); //img es la carpeta que he creado en mi proyecto, dentro de la carpeta Web Content.

            String foto = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

            archivo.write(context + File.separator + foto); // Escribimos el archivo al disco duro del servidor.
            String UPLOAD_DIR = "img/";

             fotoName= UPLOAD_DIR + File.separator + foto;
            System.out.println("-----------------------------"+fotoName);
            }catch(Exception ex){
                System.out.println(ex);
            }
            
            producto = new Producto(Integer.parseInt(request.getParameter("txt_id")), request.getParameter("txt_producto"), Integer.parseInt(request.getParameter("drop_marca")), request.getParameter("txt_descripcion"), fotoName, Integer.parseInt(request.getParameter("txt_costo")), Integer.parseInt(request.getParameter("txt_venta")), Integer.parseInt(request.getParameter("txt_existencia")), request.getParameter("txt_ingreso"));
            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (producto.agregar() > 0) {
                    response.sendRedirect("vistas/productos.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (producto.modificar() > 0) {
                    response.sendRedirect("vistas/productos.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (producto.eliminar() > 0) {
                    response.sendRedirect("vistas/productos.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Elimino xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
