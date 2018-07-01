/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Clase;

/**
 *
 * @author Alumno
 */
public interface ClaseDao {

//Interfaz que se usará en ClaseDaoImp

    public String addClase(Clase clase);

    public String updateClase(Clase clase);

    public String deleteClase(Clase clase);

    public Clase searchClase(int idClase);

    public List<Clase> listClases();
}
