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
import modelo.CompraDetalle;
import modelo.Compras;

/**
 *
 * @author jorge
 */
@WebServlet(name = "sr_compras", urlPatterns = {"/sr_compras"})
public class sr_compras extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Compras compra;
    CompraDetalle detalle;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_compras</title>");
            out.println("</head>");
            out.println("<body>");
            int id = Integer.parseInt(request.getParameter("txt_id"));

            compra = new Compras(id, Integer.parseInt(request.getParameter("txt_orden")), Integer.parseInt(request.getParameter("drop_proveedor")), request.getParameter("txt_fecha"), request.getParameter("txt_ingreso"));
            detalle = new CompraDetalle(Integer.parseInt(request.getParameter("txt_orden")), Integer.parseInt(request.getParameter("drop_producto")), Integer.parseInt(request.getParameter("txt_cantidad")), Double.parseDouble(request.getParameter("txt_precio")));
            //producto = new Producto();
            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (compra.agregar() > 0) {
                    if (detalle.agregar() > 0) {
                        //if (producto.modificarStock(Integer.parseInt(request.getParameter("drop_producto")), Integer.parseInt(request.getParameter("txt_cantidad"))) > 0) {
                        response.sendRedirect("vistas/compras.jsp");
                        //}
                    }
                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (compra.modificar() > 0) {
                    if (detalle.modificar()> 0) {
                    response.sendRedirect("vistas/compras.jsp");
                    }

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }

            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (compra.eliminar() > 0) {
                    if (detalle.eliminar() > 0) {
                        response.sendRedirect("vistas/compras.jsp");
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
