/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Personal;

/**
 *
 * @author Alumno
 */
public interface PersonalDao {

//Interfaz que se usará en PersonalDaoImp

    public String addPersonal(Personal personal);

    public String updatePersonal(Personal personal);

    public String deletePersonal(Personal personal);

    public Personal searchPersonal(String dnipersonal);

    public List<Personal> listPersonal();
}
