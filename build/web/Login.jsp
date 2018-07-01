<%--
    Document   : Login
    Created on : 09-feb-2018, 19:28:15
    Author     : aaron
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LogIn MyAcademy </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <!-- footerSyle  -->
        <link href="css/sticky-footerOriginal.css" rel="stylesheet">
    </head>
    <body style="background: url('resources/Library-books-009.png')">
        <%
            try {
                //Recogemos el http session creado en el login (o uno nuevo si no hemos logeado)
                HttpSession sessionStatus = request.getSession();
                //Calculamos el tiempo desde el ultimo uso de la sesion (aqui no lo usarmeos todavia)
                Date timeSinceLastUse = new Date(System.currentTimeMillis() - sessionStatus.getLastAccessedTime());
                System.out.println("Tiempo desde el ultimo acceso" + timeSinceLastUse.getMinutes() + ":" + timeSinceLastUse.getSeconds());
                try {
                    System.out.println(sessionStatus.getAttribute("userRole"));
                    //si el userRole es admin o user(eso significa que tenemos iniciada la sesion de antes) nos reenvia al la ventana de inicio
                    if (sessionStatus.getAttribute("userRole").equals("admin") || sessionStatus.getAttribute("userRole").equals("user")) {
                        response.sendRedirect("Inicio.jsp");
                    }
                } catch (Exception e2) {
                    //Si no puede recoger el userRole significa que la sesion es nueva o no ha sido creada. 
                    //No hacemos nada en ese caso pues estamos en el login
                }
            } catch (Exception e) {
                //Si ocurriese algun error nos reenviamos al login nuevamente
                System.out.println(e.getMessage());
                response.sendRedirect("Login.jsp");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light " style=" background: rgba(255, 255, 255, 0.70)" >
            <a class="navbar-brand" href="#" >
                <div class="container">
                    <img src="http://www.freepngimg.com/download/book/2-books-png-image.png" width="30" height="30" class="d-inline-block align-top" alt=""/>
                    My Academy Manager
            </a>
            <!--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                </span>
            </button>-->

        </div>
    </nav>


    <div class="container py-5 mt-5">
        <div class="row mt-5">
            <div class="col-md-12" >
                <div class="row">
                    <div class="col-md-6 mx-auto" >
                        <!--  CARD  -->
                        <div class="card rounded border-0 align-middle" style=" background: rgba(255, 255, 255, 0.70)">
                            <div class="card-header rounded ">
                                <h3 class="mb-0" >My AcademyManager</h3>
                            </div>
                            <div class="card-body rounded border-0" >
                                <form class="form" role="form" autocomplete="off" id="formLogin" action="UserController" method="POST">
                                    <div class="form-group">
                                        <label for="uname1">Username</label>
                                        <input type="text" class="form-control form-control-lg rounded" name="name" required="true" maxlength="15">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control form-control-lg rounded" name="password" required="true">
                                    </div>
                                    </br>
                                    <button type="submit" value="Submit" name="logUser" class="btn btn-success btn-lg container-fluid">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer font-weight-bold"  style=" background: rgba(255, 255, 255, 0.70)">
        <div class="container">
            <span class="">&copy;MyAcademyManager 2017-2018</span>
        </div>
    </footer>

</body>
</html>
