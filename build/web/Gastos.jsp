<%-- 
    Document   : Gastos
    Created on : 13-feb-2018, 20:36:31
    Author     : LGF
--%>

<%@page import="java.util.Date"%>
<%@page import="model.Gastos"%>
<%@page import="model.Gastos"%>
<%@page import="java.util.List"%>
<%@page import="services.daoImp.GastosDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gastos</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <!-- footerSyle  -->
        <link href="css/sticky-footerOriginal.css" rel="stylesheet">
    </head>
    <%
        HttpSession sessionStatus;
        try {
            sessionStatus = request.getSession();
            //Date lastUse = new Date(sessionStatus.getLastAccessedTime());
            Date timeSinceLastUse = new Date(System.currentTimeMillis() - sessionStatus.getLastAccessedTime());
            System.out.println("Tiempo desde el ultimo acceso" + timeSinceLastUse.getMinutes() + ":" + timeSinceLastUse.getSeconds());
            if (timeSinceLastUse.getMinutes() > 30) {
                System.out.println("Han pasado mas de 10 min desde el ultimo acceso a la session anterior. Invalida la sesssion");
                session.invalidate();
                response.sendRedirect("Login.jsp");
            }
            try {
                System.out.println(sessionStatus.getAttribute("userRole"));
                if (!sessionStatus.getAttribute("userRole").equals("admin") && !sessionStatus.getAttribute("userRole").equals("user")) {
                    response.sendRedirect("Login.jsp");
                }
            } catch (Exception e2) {
                response.sendRedirect("Login.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("Login.jsp");
        }
    %>
    <body style="background: url('resources/Library-books-009.png')" >
        <!-- NAVBAR-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" style=" background: rgba(255, 255, 255, 0.93)">
            <a class="navbar-brand" href="#" >
                <div class="container">
                    <img src="http://www.freepngimg.com/download/book/2-books-png-image.png" width="30" height="30" class="d-inline-block align-top" alt=""/>
                    MyAcademy
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/Hibernate/Inicio.jsp">
                            INICIO
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Administración
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Alumnos.jsp">Alumnos</a>
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Personal.jsp">Personal</a>
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/GruposyClases.jsp">Grupos y Clases</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Contabilidad
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Ingresos.jsp">Ingresos</a>
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Gastos.jsp">Gastos</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Configuracion
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="http://localhost:8080/Hibernate/Perfil.jsp">Perfil</a>
                            <% sessionStatus = request.getSession();
                                if (sessionStatus.getAttribute("userRole").equals("admin")) {
                                    out.print("   <a class='dropdown-item' href='http://localhost:8080/Hibernate/Usuarios.jsp'>Usuarios</a> ");
                                }
                            %>                            <div class="dropdown-divider"></div>
                            <form action="UserController" method="GET">
                                <button class="dropdown-item" type="submit" name="salir">Salir</button>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- "BODY" (BUTTON AND TABLES)-->
    <div class="container-fluid " style="margin-top: 60px;">
        <div class="container p-0 border-0" >
            <!-- BOTON -->
            <div class="row justify-content-md-center">
                <div class="btn">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"> Crear Gasto </button>
                    <button type="button" class="btn btn-link border-0 p-0"  title="Ayuda" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Los gastos se moverán mensualmente a una tabla oculta el dia 2 a las 00 horas. ">
                        <img class="" src="resources/info.png" width="37" height="37" class="d-inline-block align-right" alt=""/>
                    </button>
                </div>
            </div>
            <!-- Modales -->
            <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo Gasto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form class="horizontal-form" action="GastosController" method="GET">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-sm-5">
                                        <label  class="row-sm-5 col-form-label col-form-label-sm">Fecha:</label>
                                        <input type="date"  class="form-control form-control-sm" placeholder="" name="fecha" required="true" maxlength="19">
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="row-sm-3 col-form-label col-form-label-sm">Importe:</label>
                                        <div class="input-group ">
                                            <input type="number" step=".01" class="form-control form-control-sm" placeholder="250" name="importe" required="true" maxlength="7">
                                            <div class="input-group-addon form-control-sm">€</div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <label  class="row-sm-4 col-form-label col-form-label-sm">Forma de Pago:</label>
                                        <select id="selectbasic" class="form-control form-control-sm" name="formapago">
                                            <option value="Efectivo" title="Efectivo" selected="true">Efectivo</option>
                                            <option value="Tarjeta de credito" title="Tarjeta de credito">Tarjeta de crédito</option>
                                            <option value="Transferencia" title="Transferencia">Transferencia</option>
                                            <option value="Domiciliacion" title="Domiciliacion">Domiciliación</option>
                                            <option value="Cheque" title="Cheque">Cheque</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-5">
                                        <label class="row-sm-5 col-form-label col-form-label-sm">Concepto:</label>
                                        <input type="text" class="form-control form-control-sm" placeholder="Sueldo enero Jose Luis" name="concepto" required="true" maxlength="40">
                                    </div>
                                    <div class="col-sm-7">
                                        <label class="row-sm-7 col-form-label col-form-label-sm">Descripción:</label>
                                        <input type="text" class="form-control form-control-sm" placeholder="Campo optativo" name="descripcion" maxlength="190">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button class="btn btn-primary" type="submit" name="addGasto">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Listas -->
            <div class="row justify-content-md-center">
                <div id="tabGrupos" class="table-responsive">
                    <input class="form-control" id="myInput" type="text" placeholder="Search.." />
                    <table class="table table-sm table-striped mt-2" style=" background: rgba(255, 255, 255, 0.90)">
                        <thead>
                            <tr>
                                <th scope="col">Id:</th>
                                <th scope="col">Fecha:</th>
                                <th scope="col">Importe</th>
                                <th scope="col">Concepto</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Forma Pago</th>
                                <th scope="col">Opciones</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <%
                                GastosDaoImp idi = new GastosDaoImp();
                                List ingr = idi.listGastos();
                                for (int i = 0; i < ingr.size(); i++) {
                                    Gastos in = (Gastos) ingr.get(i);
                            %>
                            <tr>
                        <form action="GastosController" method="POST">
                            <td  class="align-middle"><%= in.getIdGastos()%></td>
                            <td  class="align-middle"><%= in.getFecha()%></td>
                            <td  class="align-middle"><%= in.getImporte()%> €</td>
                            <td  class="align-middle"><%= in.getConcepto()%></td>
                            <td  class="align-middle"><%= in.getDescripcion()%></td>
                            <td  class="align-middle"><%= in.getFormapago()%></td>
                            <td  class="align-middle">
                                <select name="IdGasto" hidden="true">
                                    <option value="<%= in.getIdGastos()%>" selected="true" hidden="true"><%= in.getIdGastos()%></option>
                                </select>
                                <!--usamos mx-auto d-block para centrar los botones/imagenes -->
                                <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#delGasto<%= in.getIdGastos()%>">
                                    <img src="resources/delete.png" width="30" height="30" alt="delete.png"/>
                                </a>
                            </td>
                            <!-- MODAL PARA EL ELIMINAR-->
                            <div class="modal fade bd-example-modal-lg" id="delGasto<%= in.getIdGastos()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro de que desea eliminar el Gasto "<%= in.getConcepto()%>"?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <div class="col-sm-6">
                                                    <label  class="row-sm-6 col-form-label col-form-label-sm">ID del gasto que desea eliminar:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%= in.getIdGastos()%>" name="delid" readonly="true">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label  class="row-sm-6 col-form-label col-form-label-sm">Importe del gasto que va a eliminar:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%= in.getImporte()%>" name="delimporte" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                            <button class="btn btn-danger" type="submit" name="deleteGastos">Eliminar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
<script src="js/popover.js"></script>
</html>
