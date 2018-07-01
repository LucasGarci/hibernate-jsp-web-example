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
import model.Gastos;
import services.daoImp.GastosDaoImp;

/**
 *
 * @author Alumno
 */

// ESTA CLASE FUNCIONA IGUAL QUE AlumnoController 

public class GastosController extends HttpServlet {

    Date fecha;
    Gastos gasto = new Gastos();
    GastosDaoImp gastosDaoImp = new GastosDaoImp();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addGasto") != null) {
            gasto = new Gastos();
            String fechaInput = request.getParameter("fecha");
            fecha = null;
            try {
                fecha = sdf.parse(fechaInput);
            } catch (ParseException ex) {
                Logger.getLogger(AlumnoController.class.getName()).log(Level.SEVERE, null, ex);
            }
            float importe = Float.parseFloat(request.getParameter("importe"));
            String concepto = request.getParameter("concepto");
            String descripcion = request.getParameter("descripcion");
            String formapago = request.getParameter("formapago");

            gasto.setFecha(fecha);
            gasto.setImporte(importe);
            gasto.setConcepto(concepto);
            gasto.setDescripcion(descripcion);
            gasto.setFormapago(formapago);

            gastosDaoImp.addGastos(gasto);

            RequestDispatcher rd = request.getRequestDispatcher("Gastos.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("deleteGastos") != null) {
            int id = Integer.parseInt(request.getParameter("delid"));
            Gastos gas = gastosDaoImp.searchGastos(id);
            gastosDaoImp.deleteGastos(gas);
            RequestDispatcher rd = request.getRequestDispatcher("Gastos.jsp");
            rd.forward(request, response);
        }
    }
}
