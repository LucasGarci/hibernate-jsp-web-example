/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Alumno;
import model.Ingresos;
import services.daoImp.AlumnoDaoImp;
import services.daoImp.IngresosDaoImp;

/**
 *
 * @author Alumno
 *
 */
// ESTA CLASE FUNCIONA IGUAL QUE AlumnoController 
public class IngresosController extends HttpServlet {

    Ingresos ingresos = new Ingresos();
    IngresosDaoImp ingresosdaoimp = new IngresosDaoImp();
    AlumnoDaoImp alumnodaoimp = new AlumnoDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addIngreso") != null) {
            System.out.println("ESTAMOS INICIANDO EL METODO DE CREAR");
            float importe = Float.parseFloat(request.getParameter("importe"));
            String concepto = request.getParameter("concepto");
            String descripcion = request.getParameter("descripcion");
            String formapago = request.getParameter("formpago");

            ingresos.setImporte(importe);
            ingresos.setConcepto(concepto);
            ingresos.setDescripcion(descripcion);
            ingresos.setFormapago(formapago);

            ingresosdaoimp.addIngreso(ingresos);
            System.out.println("CREACION COMPLETADA");

            RequestDispatcher rd = request.getRequestDispatcher("Ingresos.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("deleteIngresos") != null) {
            System.out.println("ESTAMOS INICIANDO EL METODO DE ELIMINAR");
            int id = Integer.parseInt(request.getParameter("delid"));

            Ingresos ing = ingresosdaoimp.searchIngresos(id);

            ingresosdaoimp.deleteIngresos(ing);
            System.out.println("ELIMINACION COMPLETADA");
            RequestDispatcher rd = request.getRequestDispatcher("Ingresos.jsp");
            rd.forward(request, response);
        }
    }
}
