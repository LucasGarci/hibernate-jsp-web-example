/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Alumno;

/**
 *
 * @author Alumno
 */
public interface AlumnoDao {

//Interfaz que se usará en AlumnoDaoImp

    public String addAlumno(Alumno alumno);

    public String updateAlumno(Alumno alumno);

    public String deleteAlumno(Alumno alumno);

    public Alumno searchAlumno(String dni);

    public List<Alumno> listAllAlumnos();

    public List<Alumno> listAlumnosMat();

    public List<Alumno> listAlumnosNoMat();

    public int numAlMat ();

    public int numAlNoMat ();

}
