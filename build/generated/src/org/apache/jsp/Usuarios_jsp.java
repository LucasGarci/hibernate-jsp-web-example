package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.User;
import java.util.List;
import services.daoImp.UserDaoImp;

public final class Usuarios_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Personal</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- footerSyle  -->\n");
      out.write("        <link href=\"css/sticky-footerOriginal.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body style=\"background: url('resources/Library-books-009.png')\" >\n");
      out.write("        <!--NAVBAR-->\n");
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
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link\" href=\"http://localhost:8080/Hibernate/Inicio.jsp\" id=\"navbarDropdownMenuLink\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
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
      out.write("                            <a class=\"dropdown-item\" href=\"http://localhost:8080/Hibernate/GruposyClases.jsp\">Grupos y Clases</a>\n");
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
      out.write("                            <a class=\"dropdown-item\" href=\"#\">Usuarios</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"#\">Salir</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"container-fluid \" style=\"margin-top: 60px;\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div id=\"accordion\">\n");
      out.write("                <div class=\"card mb-3 border-0\" style=\"background: rgba(255, 255, 255, 0)\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"btn col\" id=\"headingOne\">\n");
      out.write("                            <button class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#crearUser\">Nuevo Usuario</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Modal -->\n");
      out.write("                    <!--Formulario-->\n");
      out.write("                    <div class=\"modal fade bd-example-modal-lg\" id=\"crearUser\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                        <div class=\"modal-dialog modal-lg\" role=\"document\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("                                <div class=\"modal-header\">\n");
      out.write("                                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">Nuevo Usuario</h5>\n");
      out.write("                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                        <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                    </button>\n");
      out.write("                                </div>\n");
      out.write("                                <!-- FORM ADDUSERS-->\n");
      out.write("                                <form class=\"horizontal-form\" action=\"UserController\" method=\"GET\">\n");
      out.write("                                    <div class=\"modal-body\">\n");
      out.write("                                        <div class=\"form-group row\">\n");
      out.write("                                            <div class=\"col-sm-4\">\n");
      out.write("                                                <label for=\"\" class=\"row-sm-4 col-form-label col-form-label-sm\">Nombre:</label>\n");
      out.write("                                                <input type=\"text\" class=\"form-control form-control-sm\" id=\"\" placeholder=\"Nombre\" name=\"name\" required >\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-sm-4\">\n");
      out.write("                                                <label for=\"\" class=\"row-sm-4 col-form-label col-form-label-sm\">Contraseña:</label>\n");
      out.write("                                                <input type=\"text\" class=\"form-control form-control-sm\" id=\"\" placeholder=\"Contraseña\" name=\"passwd\" required >\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-sm-4\">\n");
      out.write("                                                <label for=\"\" class=\"row-sm-4 col-form-label col-form-label-sm\">Role de usuario:</label>\n");
      out.write("                                                <select id=\"selectbasic\" class=\"form-control form-control-sm\" name=\"nacionalidad\" >\n");
      out.write("                                                    <option value=\"user\" title=\"user\">Usuario</option>\n");
      out.write("                                                    <option value=\"admin\" title=\"admin\">Administrador</option>\n");
      out.write("                                                </select>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"modal-footer\">\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                                        <button class=\"btn btn-primary\" type=\"submit\" name=\"addUser\" value=\"Add\">Guardar</button>\n");
      out.write("                                    </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!--LISTADO DE LOS EMPLEADOS-->\n");
      out.write("                    <div id=\"collapseTwo\" class=\"table-responsive collapse show\" aria-labelledby=\"headingTwo\" data-parent=\"#accordion\">\n");
      out.write("                        <table class=\"table table-sm table-striped rounded mt-2 p-1\" style=\" background: rgba(255, 255, 255, 0.90)\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th scope=\"col\">Nombre</th>\n");
      out.write("                                    <th scope=\"col\">Contraseña</th>\n");
      out.write("                                    <th scope=\"col\">Role</th>\n");
      out.write("                                    <th scope=\"col\">Opciones</th>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                ");

                                    UserDaoImp udi = new UserDaoImp();
                                    List users = udi.listUsers();
                                    for (int i = 0; i < users.size(); i++) {
                                        User u = (User) users.get(i);
                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                            <form action=\"UserController\" method=\"POST\">\n");
      out.write("                                <td>");
      out.print( u.getName());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( u.getPassw());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( u.getRole());
      out.write("</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <select name=\"DNIPersonal\" hidden=\"true\">\n");
      out.write("                                        <option value=\"");
      out.print( u.getName());
      out.write("\" selected=\"true\" hidden=\"true\">");
      out.print( u.getName());
      out.write("</option>\n");
      out.write("                                    </select>\n");
      out.write("                                    <a class=\"btn-link border-0 p-0 border-0 p-0 align-middle\" data-toggle=\"modal\" data-target=\"#modalUpdate");
      out.print( u.getName());
      out.write("\">\n");
      out.write("                                        <img src=\"resources/edit.png\" width=\"30\" height=\"30\" alt=\"edit.png\"/>\n");
      out.write("                                    </a>\n");
      out.write("                                    <button class=\"btn-link border-0 p-0 border-0 p-0 align-middle\" type=\"submit\" id=\"\" name=\"deleteUser\">\n");
      out.write("                                        <img src=\"resources/delete.png\" width=\"30\" height=\"30\" alt=\"delete.png\"/>\n");
      out.write("                                    </button>\n");
      out.write("                                </td>\n");
      out.write("                                <!--Modal para el Update-->\n");
      out.write("                                <div class=\"modal fade bd-example-modal-lg\" id=\"modalUpdate");
      out.print( u.getName());
      out.write("\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("                                    <div class=\"modal-dialog modal-lg\" role=\"document\">\n");
      out.write("                                        <div class=\"modal-content\">\n");
      out.write("                                            <div class=\"modal-header\">\n");
      out.write("                                                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modificar Usuario</h5>\n");
      out.write("                                                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                                                    <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                                                </button>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"modal-body\">\n");
      out.write("                                                <div class=\"form-group row\">\n");
      out.write("                                                    <div class=\"col-sm-4\">\n");
      out.write("                                                        <label for=\"\" class=\"row-sm-4 col-form-label col-form-label-sm\">Nombre:</label>\n");
      out.write("                                                        <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print( u.getName());
      out.write("\" name=\"upname\" required >\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\">\n");
      out.write("                                                        <label for=\"\" class=\"row-sm-4 col-form-label col-form-label-sm\">Contraseña:</label>\n");
      out.write("                                                        <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print( u.getPassw());
      out.write("\" name=\"passwd\" required >\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"col-sm-4\">\n");
      out.write("                                                        <label for=\"\" class=\"row-sm-4 col-form-label col-form-label-sm\">Role de usuario:</label>\n");
      out.write("                                                        <input type=\"text\" class=\"form-control form-control-sm\" value=\"");
      out.print( u.getRole());
      out.write("\" name=\"passwd\" required >\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"modal-footer\">\n");
      out.write("                                                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Cancelar</button>\n");
      out.write("                                                <button class=\"btn btn-primary\" type=\"submit\" name=\"updateUser\">Guardar</button>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>                    \n");
      out.write("                            </form>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <!--<footer class=\"\" style=\"height: 30px;  background: rgba(255, 255, 255, 0.8)\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("    <span class=\"text-muted\">&copy;MyAcademyManager 2017-2018</span>\n");
      out.write("</div>\n");
      out.write("</footer>-->\n");
      out.write("</body>\n");
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
