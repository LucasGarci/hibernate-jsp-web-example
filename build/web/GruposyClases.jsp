<%--
    Document   : Clase
    Created on : 06-feb-2018, 19:45:16
    Author     : aaron
--%>

<%@page import="java.util.Date"%>
<%@page import="model.Personal"%>
<%@page import="services.daoImp.PersonalDaoImp"%>
<%@page import="model.Clase"%>
<%@page import="services.daoImp.ClaseDaoImp"%>
<%@page import="model.Grupo"%>
<%@page import="services.daoImp.GrupoDaoImp"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Grupos y Clases</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="utf-8">
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



        <%
            System.out.println("Cargando GruposyClases.jsp");
            //Cargamos las listas de grupos y de clases
            ClaseDaoImp cdi = new ClaseDaoImp();
            List clases = cdi.listClases();
            GrupoDaoImp gdi = new GrupoDaoImp();
            List grupos = gdi.listGrupos();
        %>
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
                            <a class="dropdown-item" href="#">Grupos y Clases</a>
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
            <!-- BOTONES -->
            <div class="row justify-content-md-center">
                <div class="btn  col-sm-7">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#example2Modal"> Crear Grupo </button>
                    <button type="button" class="btn btn-link border-0 p-0 "  title="Ayuda" data-container="body" data-toggle="popover" data-placement="bottom" data-content="No se puede borrar un grupo si no está vacío">
                        <img class="" src="resources/info.png" width="37" height="37" class="d-inline-block align-right" alt=""/>
                    </button>
                </div>
                <div class="btn col-sm-5"  >
                    <button class="btn btn-warning" data-toggle="modal" data-target="#exampleModal"> Crear Clase </button>
                    <button type="button" class="btn btn-link border-0 p-0 "  title="Ayuda" data-container="body" data-toggle="popover" data-placement="bottom" data-content="No se puede borrar una clase si no está vacía">
                        <img class="" src="resources/info.png" width="37" height="37" class="d-inline-block align-right" alt=""/>
                    </button>
                </div>
            </div>
            <!-- Modales -->
            <!-- MODAL NUEVA CLASE-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nueva Clase</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form class="horizontal-form" action="ClaseController" method="GET">
                            <div class="modal-body">

                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label for="" class="row-sm-6 col-form-label col-form-label-sm">Nombre del Aula:</label>
                                        <input type="text" class="form-control form-control-sm" id=""  placeholder="Ej: Aula de infantiles" name="nombreclase" required="true">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="" class="row-sm-6 col-form-label col-form-label-sm">Capacidad:</label>
                                        <input type="number" class="form-control form-control-sm" id="" placeholder="Ej: 25" name="capacidad" required="true">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button class="btn btn-primary" type="submit" name="addClase" value="Add">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- MODAL NUEVO GRUPO-->
            <div class="modal fade" id="example2Modal" tabindex="-1" role="dialog" aria-labelledby="example2ModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="example2ModalLabel">Nuevo Grupo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form class="horizontal-form" action="ClaseController" method="GET">
                            <div class="modal-body">
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label for="" class="row-sm-6 col-form-label col-form-label-sm">Clase:</label>
                                        <select id="selectbasic" class="form-control form-control-sm" name="clase" required="true">
                                            <%
                                                //Recogemos los datos de las clases y rellenamos con ellos los campos de los formularios
                                                cdi = new ClaseDaoImp();
                                                clases = cdi.listClases();
                                                for (int i = 0; i < clases.size(); i++) {
                                                    Clase cla = (Clase) clases.get(i);
                                            %>
                                            <option value="<%=cla.getIdClase()%>" ><%=cla.getIdClase() + " - " + cla.getNombreclase()%></option>         
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="" class="row-sm-6 col-form-label col-form-label-sm">Profesor:</label>
                                        <select id="selectbasic" class="form-control form-control-sm" name="dniPersonal" required="true">
                                            <%
                                                //Recogemos los datos de personal y rellenamos con ellos los campos de los formularios
                                                PersonalDaoImp pdi = new PersonalDaoImp();
                                                List personal = pdi.listPersonal();
                                                for (int i = 0; i < personal.size(); i++) {
                                                    Personal per = (Personal) personal.get(i);
                                            %>
                                            <option value="<%=per.getDnipersonal()%>" ><%=per.getDnipersonal() + " - " + per.getNombre() + " " + per.getApellidos()%></option>         
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label for="" class="row-sm-3 col-form-label col-form-label-sm">Nombre:</label>
                                        <input type="text" class="form-control form-control-sm" name="nombreGrupo" placeholder="Ej:Junior 4-6 años" required="true" maxlength="28">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="" class="row-sm-2 col-form-label col-form-label-sm">Nivel:</label>
                                        <input type="text" class="form-control form-control-sm" name="nivelGrupo" placeholder="Ej:Ingles B2" required="true" maxlength="28">
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary" name="addGrupo">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 2 Listas -->
            <div class="row justify-content-md-center">
                <!-- LISTA GRUPOS-->
                <div id="tabGrupos" class="table-responsive col-sm-7">
                    <input class="form-control" id="myInput" type="text" placeholder="Search.." />
                    <table class="table table-sm table-striped mt-2 p-1" style=" background: rgba(255, 255, 255, 0.90)">
                        <thead>
                            <tr>
                                <th scope="col">ID Grupo</th>
                                <th scope="col">ID Clase</th>
                                <th scope="col">DNI Profesor</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Nivel</th>
                                <th scope="col">Opciones</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <%
                                //listamos y generamos todo lo necesario para cada elemento grupo
                                for (int i = 0; i < grupos.size(); i++) {
                                    Grupo g = (Grupo) grupos.get(i);
                            %>
                            <tr  class="align-middle">
                        <form action="ClaseController" method="POST">
                            <td  class="align-middle"><%= g.getIdGrupo()%></td>
                            <td  class="align-middle"><%= g.getClase().getIdClase() /*+ ":" + g.getClase().getNombreclase()*/%></td>
                            <td  class="align-middle"><%= g.getPersonal().getDnipersonal()%></td>
                            <td  class="align-middle"><%= g.getNombre()%></td>
                            <td  class="align-middle"><%= g.getNivel()%></td>
                            <td  class="align-middle">
                                <select name="idGrupo" hidden="true">
                                    <option value="<%= g.getIdGrupo()%>" selected="true" hidden="true"><%= g.getIdGrupo()%></option>
                                </select>
                                <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#modalUpdate<%= g.getIdGrupo()%>">
                                    <img src="resources/edit.png" width="30" height="30" alt="edit.png"/>
                                </a>
                                <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#delGrupo<%= g.getIdGrupo()%>">
                                    <img src="resources/delete.png" width="30" height="30" alt="delete.png"/>
                                </a>
                            </td>
                            <!-- MODAL PARA EL ELIMINAR-->
                            <div class="modal fade bd-example-modal-lg" id="delGrupo<%= g.getIdGrupo()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro de que desea eliminar al grupo "<%= g.getNombre()%>"?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <div class="col-sm-6">
                                                    <label  class="row-sm-6 col-form-label col-form-label-sm">El ID del grupo que desea eliminar es:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%= g.getIdGrupo()%>" name="delid" readonly="true">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label  class="row-sm-6 col-form-label col-form-label-sm">El nivel del grupo que desea eliminar es:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%= g.getNivel()%>" name="delnivel" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                            <button class="btn btn-danger" type="submit" name="deleteGrupo">Eliminar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--UPDATE GRUPO MODAL-->
                            <div class="modal fade" id="modalUpdate<%= g.getIdGrupo()%>" tabindex="-1" role="dialog" aria-labelledby="example2ModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="example2ModalLabel">Actualizar Grupo</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <div class="col-sm-3">
                                                    <label for="" class="row-sm-3 col-form-label col-form-label-sm">Id:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%=g.getIdGrupo()%>" name="uIDgrupo" readonly="true" disabled="true">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="" class="row-sm-3 col-form-label col-form-label-sm">Clase:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%=g.getClase().getIdClase()%>" name="uclase" placeholder="Ej: 1" required="true">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="" class="row-sm-6 col-form-label col-form-label-sm">Profesor:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%=g.getPersonal().getDnipersonal()%>" name="uprofesor" placeholder="DNI de profesor" required="true">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-6">
                                                    <label for="" class="row-sm-3 col-form-label col-form-label-sm">Nombre:</label>
                                                    <input type="text" class="form-control form-control-sm" name="unombreGrupo" value="<%=g.getNombre()%>" placeholder="Ej:Junior 4-6 años" required="true" maxlength="26">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="" class="row-sm-2 col-form-label col-form-label-sm">Nivel:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%=g.getNivel()%>" name="univelGrupo" placeholder="Ej:Ingles B2" required="true" maxlength="26">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                            <button type="submit" class="btn btn-primary" name="updateGrupo">Actualizar</button>
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
                <!-- LISTA CLASES-->
                <div id="tabClase" class="table-responsive col-sm-5">
                    <input class="form-control" id="myInput2" type="text" placeholder="Search.." />
                    <table class="table table-sm table-striped mt-2 p-1" style=" background: rgba(255, 255, 255, 0.90)">
                        <thead>
                            <tr>
                                <th scope="col">ID Clase</th>
                                <th scope="col">Capacidad</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Opciones</th>
                            </tr>
                        </thead>
                        <tbody id="myTable2">
                            <%
                                //Con este ciclo listamos todos los elementos de la tabla y generamos sus modales para el update
                                // y los botones para el borrado, confirmaciones, etc
                                for (int i = 0; i < clases.size(); i++) {
                                    Clase c = (Clase) clases.get(i);
                            %>
                        <form action="ClaseController" method="POST">
                            <tr class="align-middle">
                                <td class="align-middle"><%= c.getIdClase()%></td>
                                <td class="align-middle"><%= c.getCapacidad()%></td>
                                <td class="align-middle"><%= c.getNombreclase()%></td>
                            <select name="idClase" hidden="true">
                                <option value="<%= c.getIdClase()%>" selected="true" hidden="true"><%= c.getIdClase()%></option>
                            </select>
                            <!--BOTONES BORRAR Y ACTUALIZAR-->
                            <td class="align-middle">
                                <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#claseUpdate<%= c.getIdClase()%>">
                                    <img src="resources/edit.png" width="30" height="30" alt="edit.png"/>
                                </a>
                                <a class="btn-link border-0 p-0 border-0 p-0 align-middle" data-toggle="modal" data-target="#delClase<%= c.getIdClase()%>">
                                    <img src="resources/delete.png" width="30" height="30" alt="delete.png"/>
                                </a>
                            </td>
                            <!-- MODAL PARA EL ELIMINAR-->
                            <div class="modal fade bd-example-modal-lg" id="delClase<%= c.getIdClase()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">¿Estas seguro de que desea eliminar la clase "<%= c.getNombreclase()%>"?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <div class="col-sm-6">
                                                    <label  class="row-sm-6 col-form-label col-form-label-sm">La ID de la clase que desea eliminar es:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%= c.getIdClase()%>" name="delidc" readonly="true">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label  class="row-sm-6 col-form-label col-form-label-sm">La capacidad de la clase que desea eliminar es:</label>
                                                    <input type="text" class="form-control form-control-sm" value="<%= c.getCapacidad()%>" name="delcap" readonly="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                            <button class="btn btn-danger" type="submit" name="deleteClase">Eliminar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- MODAL UPDATE CLSES-->
                            <div class="modal fade" id="claseUpdate<%= c.getIdClase()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Nueva Clase</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <div class="col-sm-3">
                                                    <label for="" class="row-sm-3 col-form-label col-form-label-sm">Id.Clase:</label>
                                                    <input type="text" class="form-control form-control-sm" id=""  value="<%=c.getIdClase()%>" read-only="true" disabled="true">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="" class="row-sm-6 col-form-label col-form-label-sm">Nombre del Aula:</label>
                                                    <input type="text" class="form-control form-control-sm" id=""  value="<%=c.getNombreclase()%>" placeholder="Ej: Aula de infantiles" name="unombreclase" maxlength="26">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label for="" class="row-sm-3 col-form-label col-form-label-sm">Capacidad:</label>
                                                    <input type="number" class="form-control form-control-sm" id="" value="<%=c.getCapacidad()%>" placeholder="Ej: 25" name="capacidadupdate" required="true" max="999">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                            <button class="btn btn-primary" type="submit" name="updateClase" >Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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
            $("#myInput2").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable2 tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
<script src="js/popover.js"></script>
</html>
