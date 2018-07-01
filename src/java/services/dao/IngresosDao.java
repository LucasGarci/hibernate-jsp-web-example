/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Ingresos;

/**
 *
 * @author Alumno
 */
public interface IngresosDao {

//Interfaz que se usará en IngresosDaoImp

    public String addIngreso(Ingresos ingreso);

    public String updateIngresos(Ingresos ingreso);

    public String deleteIngresos(Ingresos ingreso);

    public Ingresos searchIngresos(int id);

    public List<Ingresos> listIngresos();
}
