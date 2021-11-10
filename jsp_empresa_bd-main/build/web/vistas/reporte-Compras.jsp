


<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Compras"%>
<%@page import="modelo.Proveedores"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Clientes"%>
<%@page import="modelo.Ventas"%>
<%@page import="modelo.Puesto"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes Compras</title>
        <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
        <style>
            body{
                background: #02AAB0;  
                background: -webkit-linear-gradient(to left, #00CDAC, #02AAB0); 
                background: linear-gradient(to left, #00CDAC, #02AAB0); 
            }
            h1{
                text-align: center;
            }
            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu>.dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -1px;
                -webkit-border-radius: 0 6px 6px 6px;
                -moz-border-radius: 0 6px 6px;
                border-radius: 0 6px 6px 6px;
            }

            .dropdown-submenu:hover>.dropdown-menu {
                display: block;
            }

            .dropdown-submenu>a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #ccc;
                margin-top: 5px;
                margin-right: -10px;
            }

            .dropdown-submenu:hover>a:after {
                border-left-color: #fff;
            }

            .dropdown-submenu.pull-left {
                float: none;
            }

            .dropdown-submenu.pull-left>.dropdown-menu {
                left: -100%;
                margin-left: 10px;
                -webkit-border-radius: 6px 0 6px 6px;
                -moz-border-radius: 6px 0 6px 6px;
                border-radius: 6px 0 6px 6px;
            }
        </style>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="inicio.jsp">Empresa</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="inicio.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Informacion</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Menú
                        </a>
                       <div class="dropdown" aria-labelledby="navbarDropdownMenuLink">

                                <ul class="dropdown-menu multi-level">
                                    <%
                                        Menu menu = new Menu();
                                        //HashMap<String, String> drop = menu.drop();
                                        List<Menu> drop1 = menu.drop();
                                        List<Menu> drop2 = menu.drop();

                                        for (Menu i : drop1) {
                                            if (!i.getPadre().equals("-")) {
                                                out.print("<li class='dropdown-submenu'>");
                                                out.println("<a href='" + i.getNombre() + ".jsp'>" + "<b>" + i.getNombre().toUpperCase() + "</b>" + "</a>");
                                                out.print("<ul class='dropdown-menu'>");
                                                for (Menu j : drop2) {
                                                    if (i.getPadre().equals(j.getHijo())) {
                                                        out.print("<li class='dropdown-submenu'>");
                                                        out.println("<a href='" + j.getNombre() + ".jsp'>" + j.getNombre().toUpperCase() + "</a>");
                                                        out.print("</li>");
                                                    }

                                                }
                                                out.print("</ul>");

                                                out.print("</li>");
                                            }
                                        }
                                    %>
                                </ul>
                            </div>
                    </li>
                </ul>
            </div>
        </nav>


        <div class="container">
            <h1>Reportes Compras</h1>


            <a  class="btn btn-success " href="javascript:window.print()"> Imprimir</a>


            <div class="modal fade" id="modal_proveedor" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="../sr_compras" method="post" class="form-group">

                                <div class="row">
                                    <div class="col">
                                        <label for="lbl_id" ><b>ID</b></label>
                                        <input type="text" name="txt_id" id="txt_id" class="form-control form-control-sm" value="0"  readonly> 
                                    </div>
                                    <div class="col">
                                        <label for="lbl_factura" ><b>No. Orden</b></label>
                                        <input type="number" name="txt_orden" id="txt_orden" class="form-control form-control-sm" placeholder="001" required>
                                    </div>
                                    <div class="col">
                                        <label for="lbl_proveedor" ><b>Proveedor</b></label>
                                        <select name="drop_proveedor" id="drop_proveedor" class="form-select form-select-sm">
                                            <%
                                                Proveedores proveedor = new Proveedores();
                                                HashMap<String, String> drop = proveedor.drop();
                                                for (String i : drop.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                                }


                                            %>
                                        </select>  
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label for="lbl_fecha" ><b>Fecha-Orden</b></label>
                                        <input type="date" name="txt_fecha" id="txt_fecha" class="form-control form-control-sm"  required>
                                    </div>
                                    <div class="col">
                                        <label for="lbl_ingreso" ><b>Fecha-Ingreso</b></label>
                                        <input type="datetime"  name="txt_ingreso" id="txt_ingreso" class="form-control form-control-sm" required>
                                    </div>
                                </div>



                                <h5>Detalle Compra</h5>
                                <%-- DETALLE Compra --%>
                                <div class="row">
                                    <div class="col">
                                        <label for="lbl_puesto" ><b>Producto</b></label>
                                        <select name="drop_producto" id="drop_producto" class="form-select form-select-sm">
                                            <%                                                Producto producto = new Producto();
                                                HashMap<String, String> drop3 = producto.drop();
                                                for (String i : drop3.keySet()) {
                                                    out.println("<option value='" + i + "'>" + drop3.get(i) + "</option>");
                                                }

                                            %>
                                        </select> 
                                    </div>
                                    <div class="col">
                                        <label for="lbl_cantidad" ><b>Cantidad</b></label>
                                        <input type="number"  name="txt_cantidad" id="txt_cantidad" class="form-control form-control-sm" required>

                                    </div>
                                    <div class="col">
                                        <label for="lbl_precio" ><b>Precio Unitario</b></label>
                                        <input type="number"  name="txt_precio" id="txt_precio" class="form-control form-control-sm" required>

                                    </div>
                                </div>









                                <br>
                                <div class="row">
                                    <div class="col-md-3">
                                        <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-sm">Agregar</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-sm">Modificar</button>
                                    </div>

                                    <div class="col-md-3">
                                        <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-sm" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                                    return false" >Eliminar</button>                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>
            </div>






            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th>Número Orden</th>
                        <th>Proveedor</th>
                        <th>Fecha Orden</th>
                        <th>Fecha Ingreso</th>
                    </tr>
                </thead>
                <tbody id="">
                    <%                        Compras compra = new Compras();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = compra.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id-prov=" + tabla.getValueAt(t, 2) + " data-id-p=" + tabla.getValueAt(t, 6) + " data-id-cant=" + tabla.getValueAt(t, 7) + " data-id-u=" + tabla.getValueAt(t, 8) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");

                            out.println("</tr>");

                        }
                    %>

                </tbody>
            </table>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javascript">
                                            function limpiar() {
                                                $("#txt_id").val(0);
                                                $("#txt_orden").val('');
                                                $("#drop_proveedor").val(0);
                                                $("#txt_fecha").val('');
                                                $("#txt_ingreso").val('');
                                                $("#drop_producto").val(0);
                                                $("#txt_cantidad").val('');
                                                $("#txt_precio").val('');
                                            }

                                            $('#tbl_compras').on('click', 'tr td', function (evt) {
                                                var target, id, orden, fecha, proveedor, ingreso, producto, cantidad, precio;
                                                target = $(event.target);
                                                id = target.parent().data('id');
                                                proveedor = target.parent().data('id-prov');

                                                producto = target.parent().data('id-p');
                                                cantidad = target.parent().data('id-cant');
                                                precio = target.parent().data('id-u');

                                                orden = target.parent("tr").find("td").eq(0).html();
                                                fecha = target.parent("tr").find("td").eq(2).html();
                                                ingreso = target.parent("tr").find("td").eq(3).html();

                                                $("#txt_id").val(id);
                                                $("#txt_orden").val(orden);
                                                $("#drop_proveedor").val(proveedor);
                                                $("#txt_fecha").val(fecha);
                                                $("#txt_ingreso").val(ingreso);

                                                $("#drop_producto").val(producto);
                                                $("#txt_cantidad").val(cantidad);
                                                $("#txt_precio").val(precio);



                                                $("#modal_proveedor").modal('show');
                                            });

        </script>
    </body>
</html>



