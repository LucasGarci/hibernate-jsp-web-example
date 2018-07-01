/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.Grupo;

/**
 *
 * @author Alumno
 */
public interface GrupoDao {

//Interfaz que se usará en GrupoDaoImp

    public String addGrupo(Grupo grupo);

    public String updateGrupo(Grupo grupo);

    public String deleteGrupo(Grupo grupo);

    public Grupo searchGrupo(int IdGrupo);

    public List<Grupo> listGrupos();
}
