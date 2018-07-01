package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import model.Personal;
import services.daoImp.PersonalDaoImp;
import model.Clase;
import services.daoImp.ClaseDaoImp;
import model.Grupo;
import services.daoImp.GrupoDaoImp;
import java.util.List;

public final class GruposyClases_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Grupos y Clases</title>\n");
      out.write("        \n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- footerSyle  -->\n");
      out.write("        <link href=\"css/sticky-footerOriginal.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    ");

        try {
            HttpSession sessionStatus = request.getSession();
            //Date lastUse = new Date(sessionStatus.getLastAccessedTime());
            Date timeSinceLastUse = new Date(System.currentTimeMillis() - sessionStatus.getLastAccessedTime());
            System.out.println("Tiempo desde el ultimo acceso" + timeSinceLastUse.getMinutes() + ":" + timeSinceLastUse.getSeconds());
            if (timeSinceLastUse.getMinutes() > 10) {
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
    
      out.write("\n");
      out.write("    <body style=\"background: url('resources/Library-books-009.png')\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            System.out.println("Recargado GruposyClases.jsp");
            ClaseDaoImp cdi = new ClaseDaoImp();
            List clases = cdi.listClases();
            GrupoDaoImp gdi = new GrupoDaoImp();
            List grupos = gdi.listGrupos();
        
      out.write("\n");
      out.write("        <!-- NAVBAR-->\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-light fixed-top\" style=\" background: rgba(255, 255, 255, 0.93)\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\" >\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <img src=\"http://www.freepngimg.com/download/book/2-books-png-image.png\" width=\"30\" height=\"30\" class=\"d-inline-block align-top\" alt=\"\"/>\n");
      out.write("                    MyAcademy\n");
      out.write("            </a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\">\n");
      out.write("                </span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("                <ul class=\"navbar-nav ml-auto\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"http://localhost:8080/Hibernate/Inicio.jsp\" >\n");
      out.write("                            INICIO\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" id=\"navbarDropdownMenuLink\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Administración\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/Alumnos.jsp\">Alumnos</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/Personal.jsp\">Personal</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"#\">Grupos y Clases</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" id=\"navbarDropdownMenuLink\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Contabilidad\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/Ingresos.jsp\">Ingresos</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/Gastos.jsp\">Gastos</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/General.jsp\">Visión general</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" id=\"navbarDropdownMenuLink\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                            Configuracion\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/Perfil.jsp\">Perfil</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/Usuarios.jsp\">Usuarios</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("                            <form action=\"UserController\" method=\"GET\">\n");
      out.write("                                <button class=\"dropdown-item\" type=\"submit\" name=\"salir\">Salir</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("    <!-- \"BODY\" (BUTTON AND TABLES)-->\n");
      out.write("    <div class=\"container-fluid \" style=\"margin-top: 60px;\">\n");
      out.write("        <div class=\"container p-0 border-0\" >\n");
      out.write("            <!-- BOTONES -->\n");
      out.write("            <div class=\"row justify-content-md-center\">\n");
      out.write("                <div class=\"btn  col-sm-7\">\n");
      out.write("                    <button class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#example2Modal\"> Crear Grupo </button>\n");
      out.write("                    <button type=\"button\" class=\"btn btn-link border-0 p-0 \"  title=\"Ayuda\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"No se puede borrar un grupo si no está vacío\">\n");
      out.write("                        <img class=\"\" src=\"resources/info.png\" width=\"37\" height=\"37\" class=\"d-inline-block align-right\" alt=\"\"/>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"btn col-sm-5\"  >\n");
      out.write("                    <button class=\"btn btn-warning\" data-toggle=\"modal\" data-target=\"#exampleModal\"> Crear Clase </button>\n");
      out.write("                    <button type=\"button\" class=\"btn btn-link border-0 p-0 \"  title=\"Ayuda\" data-container=\"body\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"No se puede borrar una clase si no está vacía\">\n");
      out.write("                        <img class=\"\" src=\"resources/info.png\" width=\"37\" height=\"37\" class=\"d-inline-block align-right\" alt=\"\"/>\n");
      out.write("                    </button>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- Modales -->\n");
      out.write("            <!-- MODAL NUEVA CLASE-->\n");
      out.write("            <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h5 class=\"modal-title\" id=\"exampleModalLabel\">Nueva Clase</h5>\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                        <form class=\"horizontal-form\" action=\"ClaseController\" method=\"GET\">\n");
      out.write("                            <div class=\"modal-body\">\n");
      out.write("\n");
      out.write("                                <div class=\"form-group row\">\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <label for=\"\" class=\"row-sm-6 col-form-label col-form-label-sm\">Nombre del Aula:</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control form-control-sm\" id=\"\"  placeholder=\"Ej: Aula de infantiles\" name=\"nombreclase\" required=\"true\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <label for=\"\" class=\"row-sm-6 col-form-label col-form-label-sm\">Capacidad:</label>\n");
      out.write("                                        <input type=\"number\" class=\"form-control form-control-sm\" id=\"\" placeholder=\"Ej: 25\" name=\"capacidad\" required=\"true\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                                <button class=\"btn btn-primary\" type=\"submit\" name=\"addClase\" value=\"Add\">Guardar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- MODAL NUEVO GRUPO-->\n");
      out.write("            <div class=\"modal fade\" id=\"example2Modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"example2ModalLabel\" aria-hidden=\"true\">\n");
      out.write("                <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h5 class=\"modal-title\" id=\"example2ModalLabel\">Nuevo Grupo</h5>\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                        <form class=\"horizontal-form\" action=\"ClaseController\" method=\"GET\">\n");
      out.write("                            <div class=\"modal-body\">\n");
      out.write("                                <div class=\"form-group row\">\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <label for=\"\" class=\"row-sm-6 col-form-label col-form-label-sm\">Clase:</label>\n");
      out.write("                                        <select id=\"selectbasic\" class=\"form-control form-control-sm\" name=\"clase\" required=\"true\">\n");
      out.write("                                            ");

                                                cdi = new ClaseDaoImp();
                                                clases = cdi.listClases();
                                                for (int i = 0; i < clases.size(); i++) {
                                                    Clase cla = (Clase) clases.get(i);
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print(cla.getIdClase());
      out.write("\" >");
      out.print(cla.getIdClase() + " - " + cla.getNombreclase());
      out.write("</option>         \n");
      out.write("                                            ");
 } 
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <label for=\"\" class=\"row-sm-6 col-form-label col-form-label-sm\">Profesor:</label>\n");
      out.write("                                        <select id=\"selectbasic\" class=\"form-control form-control-sm\" name=\"dniPersonal\" required=\"true\">\n");
      out.write("                                            ");

                                                PersonalDaoImp pdi = new PersonalDaoImp();
                                                List personal = pdi.listPersonal();
                                                for (int i = 0; i < personal.size(); i++) {
                                                    Personal per = (Personal) personal.get(i);
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print(per.getDnipersonal());
      out.write("\" >");
      out.print(per.getDnipersonal() + " - " + per.getNombre() + " " + per.getApellidos());
      out.write("</option>         \n");
      out.write("                                            ");
 } 
      out.write("\n");
      out.write("                                        </select>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group row\">\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <label for=\"\" class=\"row-sm-3 col-form-label col-form-label-sm\">Nombre:</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control form-control-sm\" name=\"nombreGrupo\" placeholder=\"Ej:Junior 4-6 años\" required=\"true\" maxlength=\"28\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <label for=\"\" class=\"row-sm-2 col-form-label col-form-label-sm\">Nivel:</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control form-control-sm\" name=\"nivelGrupo\" placeholder=\"Ej:Ingles B2\" required=\"true\" maxlength=\"28\">\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\" name=\"addGrupo\">Guardar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- 2 Listas -->\n");
      out.write("            <div class=\"row justify-content-md-center\">\n");
      out.write("                <!-- LISTA GRUPOS-->\n");
      out.write("                <div id=\"tabGrupos\" class=\"table-responsive col-sm-7\">\n");
      out.write("                    <input class=\"form-control\" id=\"myInput\" type=\"text\" placeholder=\"Search..\" />\n");
      out.write("                    <table class=\"table table-sm table-striped mt-2 p-1\" style=\" background: rgba(255, 255, 255, 0.90)\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th scope=\"col\">ID Grupo</th>\n");
      out.write("                                <th scope=\"col\">ID Clase</th>\n");
      out.write("                                <th scope=\"col\">DNI Profesor</th>\n");
      out.write("                                <th scope=\"col\">Nombre</th>\n");
      out.write("                                <th scope=\"col\">Nivel</th>\n");
      out.write("                                <th scope=\"col\">Opciones</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody id=\"myTable\">\n");
      out.write("                            ");

                                for (int i = 0; i < grupos.size(); i++) {
                                    Grupo g = (Grupo) grupos.get(i);
                            
      out.write("\n");
      out.write("                            <tr  class=\"align-middle\">\n");
      out.write("                        <form action=\"ClaseController\" method=\"POST\">\n");
      out.write("                            <td  class=\"align-middle\">");
      out.print( g.getIdGrupo());
      out.write("</td>\n");
      out.write("                            <td  class=\"align-middle\">");
      out.print( g.getClase().getIdClase() /*+ ":" + g.getClase().getNombreclase()*/);
      out.write("</td>\n");
      out.write("                            <td  class=\"align-middle\">");
      out.print( g.getPersonal().getDnipersonal());
      out.write("</td>\n");
      out.write("                            <td  class=\"align-middle\">");
      out.print( g.getNombre());
      out.write("</td>\n");
      out.write("                            <td  class=\"align-middle\">");
      out.print( g.getNivel());
      out.write("</td>\n");
      out.write("                            <td  class=\"align-middle\">\n");
      out.write("                                <select name=\"idGrupo\" hidden=\"true\">\n");
      out.write("                                    <option value=\"");
      out.print( g.getIdGrupo());
      out.write("\" selected=\"true\" hidden=\"true\">");
      out.print( g.getIdGrupo());
      out.write("</option>\n");
      out.write("                                </select>\n");
      out.write("                                <a class=\"btn-link border-0 p-0 border-0 p-0 align-middle\" data-toggle=\"modal\" data-target=\"#modalUpdate");
      out.print( g.getIdGrupo());
      out.write("\">\n");
      out.write("                                    <img src=\"resources/edit.png\" width=\"30\" height=\"30\" alt=\"edit.png\"/>\n");
      out.write("                                </a>\n");
      out.write("                                <button  class=\"btn-link border-0 p-0 border-0 p-0 align-middle\" type=\"submit\" id=\"\" name=\"deleteGrupo\">\n");
      out.write("                                    <img src=\"resources/delete.png\" width=\"30px\" height=\"30px\" alt=\"delete.png\"/>\n");
      out.write("                                </button>\n");
      out.write("                            </td>\n");
      out.write("                            <!--UPDATE GRUPO MODAL-->\n");
      out.write("                            <div class=\"modal fade\" id=\"modalUpdate");
      out.print( g.getIdGrupo());
      out.write("\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"example2ModalLabel\" aria-hidden=\"true\">\n");
      out.write("                                <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("                                    <div class=\"modal-content\">\n");
      out.write("                                        <div class=\"modal-header\">\n");
      out.write("                                            <h5 class=\"modal-title\" id=\"example2ModalLabel\">Actualizar Grupo</h5>\n");
      out.write("                                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                                <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                            </button>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"modal-body\">\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <div class=\"col-sm-3\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-3 col-form-label col-form-label-sm\">Id:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print(g.getIdGrupo());
      out.write("\" name=\"uIDgrupo\" readonly=\"true\" disabled=\"true\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-sm-3\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-3 col-form-label col-form-label-sm\">Clase:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print(g.getClase().getIdClase());
      out.write("\" name=\"uclase\" placeholder=\"Ej: 1\" required=\"true\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-sm-6\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-6 col-form-label col-form-label-sm\">Profesor:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print(g.getPersonal().getDnipersonal());
      out.write("\" name=\"uprofesor\" placeholder=\"DNI de profesor\" required=\"true\">\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <div class=\"col-sm-6\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-3 col-form-label col-form-label-sm\">Nombre:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" name=\"unombreGrupo\" value=\"");
      out.print(g.getNombre());
      out.write("\" placeholder=\"Ej:Junior 4-6 años\" required=\"true\" maxlength=\"26\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-sm-6\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-2 col-form-label col-form-label-sm\">Nivel:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print(g.getNivel());
      out.write("\" name=\"univelGrupo\" placeholder=\"Ej:Ingles B2\" required=\"true\" maxlength=\"26\">\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"modal-footer\">\n");
      out.write("                                            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary\" name=\"updateGrupo\">Actualizar</button>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("                <!-- LISTA CLASES-->\n");
      out.write("                <div id=\"tabClase\" class=\"table-responsive col-sm-5\">\n");
      out.write("                    <input class=\"form-control\" id=\"myInput2\" type=\"text\" placeholder=\"Search..\" />\n");
      out.write("                    <table class=\"table table-sm table-striped mt-2 p-1\" style=\" background: rgba(255, 255, 255, 0.90)\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th scope=\"col\">ID Clase</th>\n");
      out.write("                                <th scope=\"col\">Capacidad</th>\n");
      out.write("                                <th scope=\"col\">Nombre</th>\n");
      out.write("                                <th scope=\"col\">Opciones</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody id=\"myTable2\">\n");
      out.write("                            ");

                                for (int i = 0; i < clases.size(); i++) {
                                    Clase c = (Clase) clases.get(i);
                            
      out.write("\n");
      out.write("                        <form action=\"ClaseController\" method=\"POST\">\n");
      out.write("                            <tr class=\"align-middle\">\n");
      out.write("                                <td class=\"align-middle\">");
      out.print( c.getIdClase());
      out.write("</td>\n");
      out.write("                                <td class=\"align-middle\">");
      out.print( c.getCapacidad());
      out.write("</td>\n");
      out.write("                                <td class=\"align-middle\">");
      out.print( c.getNombreclase());
      out.write("</td>\n");
      out.write("                            <select name=\"idClase\" hidden=\"true\">\n");
      out.write("                                <option value=\"");
      out.print( c.getIdClase());
      out.write("\" selected=\"true\" hidden=\"true\">");
      out.print( c.getIdClase());
      out.write("</option>\n");
      out.write("                            </select>\n");
      out.write("                            <td class=\"align-middle\">\n");
      out.write("                                <a class=\"btn-link border-0 p-0 border-0 p-0 align-middle\" data-toggle=\"modal\" data-target=\"#claseUpdate");
      out.print( c.getIdClase());
      out.write("\">\n");
      out.write("                                    <img src=\"resources/edit.png\" width=\"30\" height=\"30\" alt=\"edit.png\"/>\n");
      out.write("                                </a>\n");
      out.write("                                <button  class=\"btn-link border-0 p-0 border-0 p-0 align-middle\" type=\"submit\" id=\"deleteClase\" name=\"deleteClase\">\n");
      out.write("                                    <img src=\"resources/delete.png\" width=\"30px\" height=\"30px\" alt=\"resources/delete.png\"/>\n");
      out.write("                                </button>\n");
      out.write("                            </td>\n");
      out.write("                            </tr> \n");
      out.write("                            <div class=\"modal fade\" id=\"claseUpdate");
      out.print( c.getIdClase());
      out.write("\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                                <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("                                    <div class=\"modal-content\">\n");
      out.write("                                        <div class=\"modal-header\">\n");
      out.write("                                            <h5 class=\"modal-title\" id=\"exampleModalLabel\">Nueva Clase</h5>\n");
      out.write("                                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                                <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                            </button>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"modal-body\">\n");
      out.write("                                            <div class=\"form-group row\">\n");
      out.write("                                                <div class=\"col-sm-3\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-3 col-form-label col-form-label-sm\">Id.Clase:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" id=\"\"  value=\"");
      out.print(c.getIdClase());
      out.write("\" read-only=\"true\" disabled=\"true\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-sm-6\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-6 col-form-label col-form-label-sm\">Nombre del Aula:</label>\n");
      out.write("                                                    <input type=\"text\" class=\"form-control form-control-sm\" id=\"\"  value=\"");
      out.print(c.getNombreclase());
      out.write("\" placeholder=\"Ej: Aula de infantiles\" name=\"unombreclase\" maxlength=\"26\">\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-sm-3\">\n");
      out.write("                                                    <label for=\"\" class=\"row-sm-3 col-form-label col-form-label-sm\">Capacidad:</label>\n");
      out.write("                                                    <input type=\"number\" class=\"form-control form-control-sm\" id=\"\" value=\"");
      out.print(c.getCapacidad());
      out.write("\" placeholder=\"Ej: 25\" name=\"capacidadupdate\" required=\"true\" max=\"999\">\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"modal-footer\">\n");
      out.write("                                            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                                            <button class=\"btn btn-primary\" type=\"submit\" name=\"updateClase\" >Actualizar</button>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script>\n");
      out.write("        $(document).ready(function () {\n");
      out.write("            $(\"#myInput\").on(\"keyup\", function () {\n");
      out.write("                var value = $(this).val().toLowerCase();\n");
      out.write("                $(\"#myTable tr\").filter(function () {\n");
      out.write("                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("            $(\"#myInput2\").on(\"keyup\", function () {\n");
      out.write("                var value = $(this).val().toLowerCase();\n");
      out.write("                $(\"#myTable2 tr\").filter(function () {\n");
      out.write("                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("<script src=\"js/popover.js\"></script>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
