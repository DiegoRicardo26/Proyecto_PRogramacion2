
<%@page import="java.util.List"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Puesto"%>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
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
            <h1>Formulario Empleados</h1>

            <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>

            <a class="btn btn-warning btn-block" href="puestos.jsp">Ingresar Puesto</a>
            <a class="btn btn-danger " href="ventas.jsp">Ingresar Venta</a> 

            <div class="modal fade" id="modal_empleado" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="../sr_empleados" method="post" class="form-group">
                                <label for="lbl_id" ><b>ID</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 
                                <label for="lbl_codigo" ><b>Codigo</b></label>
                                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" pattern="[E]{1}[0-9]{3}" required>
                                <label for="lbl_nombres" ><b>Nombres</b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
                                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
                                <label for="lbl_direccion" ><b>Direccion</b></label>
                                <input type="text"  name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa calle zona ciudad" required>
                                <label for="lbl_telefono" ><b>Telefono</b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>
                                <label for="lbl_fn" ><b>Nacimiento</b></label>
                                <input type="date"  name="txt_fn" id="txt_fn" class="form-control" required>
                                <label for="lbl_puesto" ><b>Puesto</b></label>
                                <select name="drop_puesto" id="drop_puesto" class="form-select">
                                    <%
                                        Puesto puesto = new Puesto();
                                        HashMap<String, String> drop = puesto.drop();
                                        for (String i : drop.keySet()) {
                                            out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                        }


                                    %>
                                </select>
                                <br>
                                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary ">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success ">Modificar</button>
                                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger " onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false" >Eliminar</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>






            <table class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Nacimiento</th>
                        <th>Puesto</th>
                    </tr>
                </thead>
                <tbody id="tbl_empleados">
                    <%            Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 8) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
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
                                        $("#txt_codigo").val('');
                                        $("#txt_nombres").val('');
                                        $("#txt_apellidos").val('');
                                        $("#txt_direccion").val('');
                                        $("#txt_telefono").val('');
                                        $("#txt_fn").val('');
                                        $("#drop_puesto").val(1);
                                    }

                                    $('#tbl_empleados').on('click', 'tr td', function (evt) {
                                        var target, id, id_p, codigo, nombres, apellidos, direccion, telefono, nacimiento;
                                        target = $(event.target);
                                        id = target.parent().data('id');
                                        id_p = target.parent().data('id_p');
                                        codigo = target.parent("tr").find("td").eq(0).html();
                                        nombres = target.parent("tr").find("td").eq(1).html();
                                        apellidos = target.parent("tr").find("td").eq(2).html();
                                        direccion = target.parent("tr").find("td").eq(3).html();
                                        telefono = target.parent("tr").find("td").eq(4).html();
                                        nacimiento = target.parent("tr").find("td").eq(5).html();
                                        $("#txt_id").val(id);
                                        $("#txt_codigo").val(codigo);
                                        $("#txt_nombres").val(nombres);
                                        $("#txt_apellidos").val(apellidos);
                                        $("#txt_direccion").val(direccion);
                                        $("#txt_telefono").val(telefono);
                                        $("#txt_fn").val(nacimiento);
                                        $("#drop_puesto").val(id_p);
                                        $("#modal_empleado").modal('show');
                                    });

        </script>
    </body>
</html>


