/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modelo.Proveedores;
import modelo.VentaDetalle;
import modelo.Ventas;

/**
 *
 * @author jorge
 */
@WebServlet(name = "sr_ventas", urlPatterns = {"/sr_ventas"})
public class sr_ventas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Ventas venta;
    VentaDetalle detalle;
    Producto producto;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_ventas</title>");
            out.println("</head>");
            out.println("<body>");
            int id = Integer.parseInt(request.getParameter("txt_id"));

            venta = new Ventas(id, Integer.parseInt(request.getParameter("txt_factura")), request.getParameter("txt_serie"), request.getParameter("txt_fecha"), Integer.parseInt(request.getParameter("drop_cliente")), Integer.parseInt(request.getParameter("drop_empleado")), request.getParameter("txt_ingreso"));
            detalle = new VentaDetalle(Integer.parseInt(request.getParameter("txt_factura")), Integer.parseInt(request.getParameter("drop_producto")), Integer.parseInt(request.getParameter("txt_cantidad")), Double.parseDouble(request.getParameter("txt_precio")));
            producto = new Producto();
            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (venta.agregar() > 0) {
                    if (detalle.agregar() > 0) {
                        if (producto.modificarStock(Integer.parseInt(request.getParameter("drop_producto")), Integer.parseInt(request.getParameter("txt_cantidad"))) > 0) {
                            response.sendRedirect("vistas/ventas.jsp");
                        }

                    }

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (venta.modificar() > 0) {
                    if (detalle.modificar()> 0) {
                        response.sendRedirect("vistas/ventas.jsp");
                    }

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (venta.eliminar() > 0) {
                    if (detalle.eliminar() > 0) {

                        response.sendRedirect("vistas/ventas.jsp");
                    }

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
