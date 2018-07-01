/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Gastos;

/**
 *
 * @author Alumno
 */
public interface GastosDao {

//Interfaz que se usará en GastosDaoImp

    public String addGastos(Gastos gasto);

    public String updateGastos(Gastos gastos);

    public String deleteGastos(Gastos gastos);

    public Gastos searchGastos(int idGastos);

    public List<Gastos> listGastos();
}
