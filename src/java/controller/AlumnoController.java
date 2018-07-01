package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Alumno;
import model.Grupo;
import services.daoImp.AlumnoDaoImp;
import services.daoImp.GrupoDaoImp;

public class AlumnoController extends HttpServlet {

    //Al implementar la interfaz HttpServlet adquirimos las clases doGet y doPost, con estas clases haremos peticiones o recogeremos datos
    Alumno alumno = new Alumno();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    AlumnoDaoImp alumnodaoimp = new AlumnoDaoImp();
    GrupoDaoImp grupodaoimp = new GrupoDaoImp();

    /**
     * @param request //nuestra peticion
     * @param response // la respuesta
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Cada if(request.getParameter("addAlumno") != null) salta si el string corresponde 
        //al "name" del "submit" que realizamos
        if (request.getParameter("addAlumno") != null) {
            //Recogemos los diferentes datos de los inputs
            String dnialumno = request.getParameter("DNIAlumno");
            int grup = Integer.parseInt(request.getParameter("IDGrupo"));
            Grupo grupo = grupodaoimp.searchGrupo(grup);
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String fn = request.getParameter("fechnac");
            System.out.println(fn);
            Date fechnac = null;
            //Parseamos la fecha dle input a la que corresponde a java.Date
            try {
                fechnac = sdf.parse(fn);
            } catch (ParseException ex) {
                Logger.getLogger(AlumnoController.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(fechnac);
            String nacionalidad = request.getParameter("nacionalidad");
            String email = request.getParameter("email");
            int telefonopersonal = Integer.parseInt(request.getParameter("telefonopersonal"));
            String direccion = request.getParameter("direccion");
            int codpostal;
            //Ponermos try catch en los numeros ya que el campo vacio bloquearia la app
            try {
                codpostal = Integer.parseInt(request.getParameter("codpostal"));
            } catch (NumberFormatException e) {
                codpostal = 00000;
                System.err.println("Campo CodPOstal Vacio, autocompletado con 0");
            }
            int telefonofijo;
            try {
                telefonofijo = Integer.parseInt(request.getParameter("telefonofijo"));
            } catch (NumberFormatException ex) {
                telefonofijo = 000000000;
            }
            String nombrefamiliar = request.getParameter("nombrefamiliar");
            String apellidofamiliar = request.getParameter("apellidofamiliar");
            Integer telefonofamiliar;
            try {
                telefonofamiliar = Integer.parseInt(request.getParameter("telefonofamiliar"));
            } catch (Exception e) {
                telefonofamiliar = 000000000;
            }
            String emailfamiliar = request.getParameter("emailfamiliar");
            
            //Asignamos todos los datos al alumno que tenemos creado arriba
            alumno.setDnialumno(dnialumno);
            alumno.setGrupo(grupo);
            alumno.setNombre(nombre);
            alumno.setApellidos(apellidos);
            alumno.setFechnac(fechnac);
            alumno.setNacionalidad(nacionalidad);
            alumno.setEmail(email);
            alumno.setTelefonopersonal(telefonopersonal);
            alumno.setDireccion(direccion);
            alumno.setCodpostal(codpostal);
            alumno.setTelefonofijo(telefonofijo);
            alumno.setNombrefamiliar(nombrefamiliar);
            alumno.setApellidofamiliar(apellidofamiliar);
            alumno.setTelefonofamiliar(telefonofamiliar);
            alumno.setEmailfamiliar(emailfamiliar);
            /*
            La clase RequestDispatcher define un objeto que recibe solicitudes del cliente y las envía
            a cualquier recurso (como un servlet, archivo HTML o archivo JSP) en el servidor. El contenedor de 
            servlets crea el objeto RequestDispatcher, que se utiliza como un contenedor alrededor 
            de un recurso de servidor ubicado en una ruta particular o dado por un nombre particular.
             */
            alumnodaoimp.addAlumno(alumno);
            //Recogemos el gestor de solicitudes correspondiente a nuestra pagina
            RequestDispatcher rd = request.getRequestDispatcher("Alumnos.jsp");
            //lanzamos la peticion y la respuesta (implica una recarga de la pagina)
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("updateAlumno") != null) {
            //Recogemos la id del alumno a borrar
            String dni = request.getParameter("uDNIAlumno");
            System.out.println("DNI del alumno que se desea buscar " + dni);
            alumno = alumnodaoimp.searchAlumno(dni);
            int grup = Integer.parseInt(request.getParameter("uIDGrupo"));
            Grupo grupo = grupodaoimp.searchGrupo(grup);
            String nombre = request.getParameter("unombre");
            String apellidos = request.getParameter("uapellidos");
            String fn = request.getParameter("ufechnac");
            System.out.println(fn);
            Date fechnac = null;
            try {
                fechnac = sdf.parse(fn);
            } catch (ParseException ex) {
                Logger.getLogger(AlumnoController.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(fechnac);
            String nacionalidad = request.getParameter("unacionalidad");
            String email = request.getParameter("uemail");
            int telefonopersonal;
            try {
                telefonopersonal = Integer.parseInt(request.getParameter("utelefonopersonal"));
            } catch (Exception e) {
                telefonopersonal = 000000;
            }

            String direccion = request.getParameter("udireccion");
            Integer codpostal = Integer.parseInt(request.getParameter("ucodpostal"));
            int telefonofijo;
            try {
                telefonofijo = Integer.parseInt(request.getParameter("utelefonofijo"));
            } catch (NumberFormatException e) {
                telefonofijo = 000000;
            }
            String nombrefamiliar = request.getParameter("unombrefamiliar");
            String apellidofamiliar = request.getParameter("uapellidofamiliar");
            Integer telefonofamiliar = Integer.parseInt(request.getParameter("utelefonofamiliar"));
            String emailfamiliar = request.getParameter("uemailfamiliar");
            //Actualizamos los datos de dicho alumno
            System.out.println("Este es el alumno recogido " + alumno.getNombre());
            System.out.println("Esto es el grupo que estamos metiendo " + grupo.getIdGrupo());
            alumno.setGrupo(grupo);
            alumno.setNombre(nombre);
            alumno.setApellidos(apellidos);
            alumno.setFechnac(fechnac);
            alumno.setNacionalidad(nacionalidad);
            alumno.setEmail(email);
            alumno.setTelefonopersonal(telefonopersonal);
            alumno.setDireccion(direccion);
            alumno.setCodpostal(codpostal);
            alumno.setTelefonofijo(telefonofijo);
            alumno.setNombrefamiliar(nombrefamiliar);
            alumno.setApellidofamiliar(apellidofamiliar);
            alumno.setTelefonofamiliar(telefonofamiliar);
            alumno.setEmailfamiliar(emailfamiliar);
            //Lanzamos el metodo contra la bbdd
            alumnodaoimp.updateAlumno(alumno);
            RequestDispatcher rd = request.getRequestDispatcher("Alumnos.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("deleteAlumno") != null) {
            //Recogemos el alumno segun el DNI y lo borramos
            String dni = request.getParameter("deldni");
            Alumno al = alumnodaoimp.searchAlumno(dni);
            alumnodaoimp.deleteAlumno(al);
            RequestDispatcher rd = request.getRequestDispatcher("Alumnos.jsp");
            rd.forward(request, response);
        }
    }
}
