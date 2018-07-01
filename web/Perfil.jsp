<%-- 
    Document   : Perfil
    Created on : 16-feb-2018, 23:29:00
    Author     : LGF
--%>

<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="services.daoImp.UserDaoImp"%>
<%@page import="services.daoImp.AlumnoDaoImp"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MyAcademyLite</title>
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
                    if (!sessionStatus.getAttribute("userRole").equals("admin") && !sessionStatus.getAttribute("userRole").equals("user")) {
                        response.sendRedirect("Login.jsp");
                    }
                } catch (Exception e2) {
                    response.sendRedirect("Login.jsp");
                }
            } catch (Exception e) {
                System.out.println("Redirigiendo de Inicio a Login" + e.getMessage());
                response.sendRedirect("Login.jsp");
            }
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
    <div class="container py-5 mt-5">
        <div class="row mt-5">
            <div class="col-md-12" >
                <div class="row">
                    <div class="col-md-12 mx-auto" >
                        <!--  CARD  -->
                        <div class="card rounded border-0" style=" background: rgba(255, 255, 255, 0.70)">
                            <div class="row card-header">
                                <div class="col-md-10 align-self-center" >
                                    <h3 class="text-center ">Prefil del usuario "<%=sessionStatus.getAttribute("userName")%>"</h3>
                                </div>
                                <div class="col-md-2" >
                                    <button type="button" class="btn btn-link border-0 p-0  mx-auto d-block"  title="Ayuda" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Aqui podrás cambiar tu contraseña. Ten cuidado al escribir la nueva contraseña">
                                        <img class="" src="resources/info.png" width="40" height="40" class="d-inline-block align-right" alt=""/>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body rounded border-0 align-self-center container-fluid" >
                                <table class="table table-sm table-striped rounded mt-2 p-1 container-fluid" style=" background: rgba(255, 255, 255, 0.90)">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Opciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="myTable">
                                        <%
                                            UserDaoImp udi = new UserDaoImp();
                                            List users = udi.listUsers();
                                            for (int i = 0; i < users.size(); i++) {
                                                User u = (User) users.get(i);
                                                if (u.getName().equals(sessionStatus.getAttribute("userName"))) {
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
                                        </td>
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
                                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Nueva Contraseña:</label>
                                                                <input type="text" class="form-control form-control-sm" name="uppasswd" required="true" >
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <label for="" class="row-sm-4 col-form-label col-form-label-sm">Role de usuario:</label>
                                                                <input type="text" class="form-control form-control-sm" value="<%= u.getRole()%>" name="uprole" readonly="true" >
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
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/popover.js"></script>
</body>
</html>