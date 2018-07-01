<%--
    Document   : Usuarios
    Created on : 13-feb-2018, 23:32:08
    Author     : aaron
--%>

<%@page import="java.util.Date"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="services.daoImp.UserDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Usuarios</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <!-- footerSyle  -->
        <link href="css/sticky-footerOriginal.css" rel="stylesheet">
    </head>

    <body style="background: url('resources/Library-books-009.png')" >
        <%            HttpSession sessionStatus;
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
                    if (!sessionStatus.getAttribute("userRole").equals("admin")) {
                        response.sendRedirect("Login.jsp");
                    }
                } catch (Exception e2) {
                    response.sendRedirect("Login.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("Login.jsp");
            }
        %>
        <!--NAVBAR-->
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
                        <a class="nav-link" href="http://localhost:8080/Hibernate/Inicio.jsp" >
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
                            %>
                            <div class="dropdown-divider"></div>
                            <form action="UserController" method="GET">
                                <button class="dropdown-item" type="submit" name="salir">Salir</button>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid " style="margin-top: 60px;">
        <div class="container">
            <div id="accordion">
                <div class="card mb-3 border-0" style="background: rgba(255, 255, 255, 0)">
                    <div class="row">
                        <div class="btn col" id="headingOne">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#crearUser">Nuevo Usuario</button>
                        </div>
                    </div>
                    <!-- Modal -->
                    <!--Formulario-->
                    <div class="modal fade bd-example-modal-lg" id="crearUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Nuevo Usuario</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <!-- FORM ADDUSERS-->
                                <form class="horizontal-form" action="UserController" method="GET">
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Nombre:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Nombre" name="name" required >
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Contraseña:</label>
                                                <input type="text" class="form-control form-control-sm" id="" placeholder="Contraseña" name="passwd" required >
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Role de usuario:</label>
                                                <select id="selectbasic" class="form-control form-control-sm" name="role" >
                                                    <option value="user" title="user">Usuario</option>
                                                    <option value="admin" title="admin">Administrador</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button class="btn btn-primary" type="submit" name="addUser" value="Add">Guardar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--LISTADO DE LOS EMPLEADOS-->
                    <div id="collapseTwo" class="table-responsive collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
                        <table class="table table-sm table-striped rounded mt-2 p-1" style=" background: rgba(255, 255, 255, 0.90)">
                            <thead>
                                <tr>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    UserDaoImp udi = new UserDaoImp();
                                    List users = udi.listUsers();
                                    for (int i = 0; i < users.size(); i++) {
                                        User u = (User) users.get(i);
                                %>
                                <tr>
                            <form action="UserController" method="POST">
                                <td><%= u.getName()%></td>
                                <td><%= u.getRole()%></td>
                                <td>
                                    <select name="namedel" hidden="true">
                                        <option value="<%= u.getName()%>" selected="true" hidden="true"><%= u.getName()%></option>
                                    </select>
                                    <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#modalUpdate<%= u.getName()%>">
                                        <img src="resources/edit.png" width="30" height="30" alt="edit.png"/>
                                    </a>
                                    <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#delUser<%= u.getName()%>">
                                        <img src="resources/delete.png" width="30" height="30" alt="delete.png"/>
                                    </a>
                                </td>
                                <!-- MODAL PARA EL ELIMINAR-->
                                <div class="modal fade bd-example-modal-lg" id="delUser<%= u.getName()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro de que desea eliminar el usuario "<%= u.getName()%>"?</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-sm-6">
                                                        <label  class="row-sm-6 col-form-label col-form-label-sm">Nombre del usuario que desea eliminar:</label>
                                                        <input type="text" class="form-control form-control-sm" value="<%= u.getName()%>" name="deletename" readonly="true">
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label  class="row-sm-6 col-form-label col-form-label-sm">Role del usuario al que va a eliminar:</label>
                                                        <input type="text" class="form-control form-control-sm" value="<%= u.getRole()%>" name="deleterole" readonly="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button class="btn btn-danger" type="submit" name="deleteUser">Eliminar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal para el Update-->
                                <div class="modal fade bd-example-modal-lg" id="modalUpdate<%= u.getName()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modificar Usuario</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group row">
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm">Nombre:</label>
                                                        <input type="text" class="form-control form-control-sm" value="<%= u.getName()%>" name="upname" readonly="true" >
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm">Contraseña:</label>
                                                        <input type="password" class="form-control form-control-sm" value="<%= u.getPassw()%>" name="uppasswd" required >
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label for="" class="row-sm-4 col-form-label col-form-label-sm">Role de usuario:</label>
                                                        <input type="text" class="form-control form-control-sm" value="<%= u.getRole()%>" name="uprole" required >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button class="btn btn-primary" type="submit" name="updateUser">Guardar</button>
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
</html>
