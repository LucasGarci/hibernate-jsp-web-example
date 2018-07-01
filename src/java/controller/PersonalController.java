/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import model.Personal;
import services.daoImp.PersonalDaoImp;
import services.daoImp.GrupoDaoImp;

/**
 *
 * @author aaron
 */

// ESTA CLASE FUNCIONA IGUAL QUE AlumnoController 
public class PersonalController extends HttpServlet {

    Personal personal = new Personal();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    PersonalDaoImp personaldaoimp = new PersonalDaoImp();
    GrupoDaoImp grupodaoimp = new GrupoDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addPersonal") != null) {
            personal=new Personal();
            String dnipersonal = request.getParameter("DNIPersonal");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String fn = request.getParameter("fechnac");
            System.out.println(fn);
            Date fechnac = null;
            try {
                fechnac = sdf.parse(fn);
            } catch (ParseException ex) {
                Logger.getLogger(PersonalController.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(fechnac);
            String nacionalidad = request.getParameter("nacionalidad");
            String email = request.getParameter("email");
            int telefonopersonal = Integer.parseInt(request.getParameter("telefonomovil"));
            String direccion = request.getParameter("direccion");
            Integer codpostal = Integer.parseInt(request.getParameter("codpostal"));
            int telefonofijo = Integer.parseInt(request.getParameter("telefonofijo"));
            String tipo = request.getParameter("tipoEmpleado");
            String cuenta = request.getParameter("cuenta");
            Integer telefonofamiliar = Integer.parseInt(request.getParameter("telefonofamiliar"));
            Float sueldo = Float.parseFloat(request.getParameter("sueldo"));

            personal.setDnipersonal(dnipersonal);
            personal.setNombre(nombre);
            personal.setApellidos(apellidos);
            personal.setFechnac(fechnac);
            personal.setNacionalidad(nacionalidad);
            personal.setEmail(email);
            personal.setTelefonopersonal(telefonopersonal);
            personal.setDireccion(direccion);
            personal.setCodpostal(codpostal);
            personal.setTelefonofijo(telefonofijo);
            personal.setTipo(tipo);
            personal.setCuentabancaria(cuenta);
            personal.setTelefonofamiliar(telefonofamiliar);
            personal.setSueldo(sueldo);

            personaldaoimp.addPersonal(personal);
            RequestDispatcher rd = request.getRequestDispatcher("Personal.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("deletePersonal") != null) {

            String dni = request.getParameter("deldni");
            Personal pers = personaldaoimp.searchPersonal(dni);
            personaldaoimp.deletePersonal(pers);
            RequestDispatcher rd = request.getRequestDispatcher("Personal.jsp");
            rd.forward(request, response);
        }
        if (request.getParameter("updatePersonal") != null) {
            String dnipersonal = request.getParameter("uDNIPersonal");
            personal = personaldaoimp.searchPersonal(dnipersonal);
            String nombre = request.getParameter("unombre");
            String apellidos = request.getParameter("uapellidos");
            String fn = request.getParameter("ufechnac");
            System.out.println(fn);
            Date fechnac = null;
            try {
                fechnac = sdf.parse(fn);
            } catch (ParseException ex) {
                Logger.getLogger(PersonalController.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(fechnac);
            String nacionalidad = request.getParameter("unacionalidad");
            String email = request.getParameter("uemail");
            int telefonopersonal = Integer.parseInt(request.getParameter("utelefonomovil"));
            String direccion = request.getParameter("udireccion");
            Integer codpostal = Integer.parseInt(request.getParameter("ucodpostal"));
            int telefonofijo = Integer.parseInt(request.getParameter("utelefonofijo"));
            String tipo = request.getParameter("utipoEmpleado");
            String cuenta = request.getParameter("ucuenta");
            Integer telefonofamiliar = Integer.parseInt(request.getParameter("utelefonofamiliar"));
            Float sueldo = Float.parseFloat(request.getParameter("usueldo"));

            personal.setDnipersonal(dnipersonal);
            personal.setNombre(nombre);
            personal.setApellidos(apellidos);
            personal.setFechnac(fechnac);
            personal.setNacionalidad(nacionalidad);
            personal.setEmail(email);
            personal.setTelefonopersonal(telefonopersonal);
            personal.setDireccion(direccion);
            personal.setCodpostal(codpostal);
            personal.setTelefonofijo(telefonofijo);
            personal.setTipo(tipo);
            personal.setCuentabancaria(cuenta);
            personal.setTelefonofamiliar(telefonofamiliar);
            personal.setSueldo(sueldo);

            personaldaoimp.updatePersonal(personal);
            RequestDispatcher rd = request.getRequestDispatcher("Personal.jsp");
            rd.forward(request, response);
        }
    }
}
