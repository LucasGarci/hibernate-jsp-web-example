/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Matricula;

/**
 *
 * @author Alumno
 */
public interface MatriculaDao {

//Interfaz que se usará en MatriculaDaoImp

    public String addMatricula(Matricula matricula);

    public String updateMatricula(Matricula matricula);

    public String deleteMatricula(Matricula matricula);

    public Matricula searchMatricula(int id);

    public List<Matricula> listMatriculas();
}
