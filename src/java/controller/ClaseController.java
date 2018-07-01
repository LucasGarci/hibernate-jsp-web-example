/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Clase;
import model.Grupo;
import model.Personal;
import services.daoImp.ClaseDaoImp;
import services.daoImp.GrupoDaoImp;
import services.daoImp.PersonalDaoImp;

/**
 * 
 * @author aaron
 */

// ESTA CLASE FUNCIONA IGUAL QUE AlumnoController 

public class ClaseController extends HttpServlet {

    Clase clase = new Clase();
    Grupo grupo = new Grupo();
    ClaseDaoImp clasedaoimp = new ClaseDaoImp();
    PersonalDaoImp personalDaoImp = new PersonalDaoImp();
    GrupoDaoImp grupoDaoImp = new GrupoDaoImp();
    List<Grupo> grupoList;
    List<Clase> claseList;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addClase") != null) {
            String nombreclase = request.getParameter("nombreclase");
            int capacidad;
            try {
                capacidad = Integer.parseInt(request.getParameter("capacidad"));
            } catch (Exception e) {
                capacidad = 0;
            }
            clase.setNombreclase(nombreclase);
            clase.setCapacidad(capacidad);
            clasedaoimp.addClase(clase);
            RequestDispatcher rd = request.getRequestDispatcher("GruposyClases.jsp");
            rd.forward(request, response);
        }
        if (request.getParameter("addGrupo") != null) {
            Clase clasegrupo = clasedaoimp.searchClase(Integer.parseInt(request.getParameter("clase")));
            Personal personal = personalDaoImp.searchPersonal(request.getParameter("dniPersonal"));
            String nombreGrupo = request.getParameter("nombreGrupo");
            String nivelGrupo = request.getParameter("nivelGrupo");
            grupo.setClase(clasegrupo);
            grupo.setPersonal(personal);
            grupo.setNombre(nombreGrupo);
            grupo.setNivel(nivelGrupo);
            grupoDaoImp.addGrupo(grupo);
            RequestDispatcher rd = request.getRequestDispatcher("GruposyClases.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("updateClase") != null) {
            int id1 = Integer.parseInt(request.getParameter("idClase"));
            Clase c = clasedaoimp.searchClase(id1);
            String nombreclase = request.getParameter("unombreclase");
            c.setNombreclase(nombreclase);
            int capacidadupdate = Integer.parseInt(request.getParameter("capacidadupdate"));
            c.setCapacidad(capacidadupdate);
            clasedaoimp.updateClase(c);
            RequestDispatcher rd = request.getRequestDispatcher("GruposyClases.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("updateGrupo") != null) {
            int idGru = Integer.parseInt(request.getParameter("idGrupo"));
            Grupo g = grupoDaoImp.searchGrupo(idGru);
            int idClas = Integer.parseInt(request.getParameter("uclase"));
            clase = new Clase();
            clase = clasedaoimp.searchClase(idClas);
            g.setClase(clase);
            g.setPersonal(personalDaoImp.searchPersonal(request.getParameter("uprofesor")));
            String nombre = request.getParameter("unombreGrupo");
            g.setNombre(nombre);
            String nivel = request.getParameter("univelGrupo");
            g.setNivel(nivel);
            grupoDaoImp.updateGrupo(g);
            RequestDispatcher rd = request.getRequestDispatcher("GruposyClases.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("deleteClase") != null) {
            int id2 = Integer.parseInt(request.getParameter("delidc"));
            Clase c2 = clasedaoimp.searchClase(id2);
            clasedaoimp.deleteClase(c2);
            RequestDispatcher rd = request.getRequestDispatcher("GruposyClases.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("deleteGrupo") != null) {
            int id3 = Integer.parseInt(request.getParameter("delid"));
            Grupo g2 = grupoDaoImp.searchGrupo(id3);
            grupoDaoImp.deleteGrupo(g2);
            RequestDispatcher rd = request.getRequestDispatcher("GruposyClases.jsp");
            rd.forward(request, response);
        }
    }
}
