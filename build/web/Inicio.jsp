<%-- 
    Document   : Inicio
    Created on : 15-feb-2018, 17:58:47
    Author     : aaron
--%>

<%@page import="services.daoImp.GastosDaoImp"%>
<%@page import="services.daoImp.IngresosDaoImp"%>
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
                //recogemos la sesion
                sessionStatus = request.getSession();
                //calculamos el tiempo desde su ultimo uso
                Date timeSinceLastUse = new Date(System.currentTimeMillis() - sessionStatus.getLastAccessedTime());
                System.out.println("Tiempo desde el ultimo acceso" + timeSinceLastUse.getMinutes() + ":" + timeSinceLastUse.getSeconds());
                //si hace mas de 10 min la cerramos y enviamos al login
                if (timeSinceLastUse.getMinutes() > 30) {
                    System.out.println("Han pasado mas de 10 min desde el ultimo acceso a la session anterior. Invalida la sesssion");
                    session.invalidate();
                    response.sendRedirect("Login.jsp");
                }
                //probamos si la session corresponde a algun usuario o administrador
                try {
                    System.out.println(sessionStatus.getAttribute("userRole"));
                    //si no es asi enviamos al login
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
            //Declaramos los siguientes elementos que usaremos a continuacion
            AlumnoDaoImp adi = new AlumnoDaoImp();
            IngresosDaoImp idi = new IngresosDaoImp();
            GastosDaoImp gdi = new GastosDaoImp();
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
                                    <h3 class="text-center ">Bienvenid@ a MyAcademyLite</h3>
                                </div>
                                <div class="col-md-2" >
                                    <button type="button" class="btn btn-link border-0 p-0  mx-auto d-block"  title="Ayuda" data-container="body" data-toggle="popover" data-placement="bottom" data-content="Pulsa este botón cuando desees ver informacion o ayuda sobre lo que tengas más cerca">
                                        <img class="" src="resources/info.png" width="60" height="60" class="d-inline-block align-right" alt=""/>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body rounded border-0 align-self-center" >

                                <h4>INFORMACION GENERAL</h4>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th >Alumnos Matriculados</th>
                                            <th ><%= adi.numAlMat()%></th>
                                        </tr>
                                        <tr>
                                            <th>Alumnos NO matriculados</th>
                                            <th><%= adi.numAlNoMat()%> </th>
                                        </tr>
                                        <tr>
                                            <th >Ingresos Mensuales</th>
                                            <th><%=idi.getImporteTotal()%> €</th>
                                        </tr>
                                        <tr>
                                            <th >Gastos Mensuales</th>
                                            <th><%=gdi.getImporteTotal()%> €</th>
                                        </tr>
                                        <tr>
                                            <th >Ganancias Mensuales</th>
                                            <th><%=(idi.getImporteTotal() - gdi.getImporteTotal())%> €</th>
                                        </tr>
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
