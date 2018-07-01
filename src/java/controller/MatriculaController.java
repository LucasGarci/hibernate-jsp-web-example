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
import model.Matricula;
import services.daoImp.AlumnoDaoImp;
import services.daoImp.MatriculaDaoImp;

/**
 *
 * @author aaron
 */

//// ESTA CLASE FUNCIONA IGUAL QUE AlumnoController 
public class MatriculaController extends HttpServlet {

    Matricula matricula = new Matricula();
    MatriculaDaoImp matriculadaoimp = new MatriculaDaoImp();
    AlumnoDaoImp alumnodaoimp = new AlumnoDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addMatricula") != null) {
            System.out.println("CREAR MATRICULA");
            String dniAlumno = request.getParameter("DNIAlumnoMatricula");
            Alumno al = alumnodaoimp.searchAlumno(dniAlumno);
            float precio = Float.parseFloat(request.getParameter("preciomatricula"));
            matricula.setAlumno(al);
            matricula.setPrecio(precio);
            matriculadaoimp.addMatricula(matricula);
            RequestDispatcher rd = request.getRequestDispatcher("Alumnos.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
