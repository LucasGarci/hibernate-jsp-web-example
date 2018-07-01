/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

import java.util.List;
import java.util.Set;
import org.hibernate.Transaction;
import org.hibernate.Session;
import model.Grupo;
import org.hibernate.Query;
import services.dao.GrupoDao;

/**
 *
 * @author aaron
 */
public class GrupoDaoImp implements GrupoDao{

//Metodo por el cual añadimos un grupo

    @Override
    public String addGrupo(Grupo grupo) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.save(grupo);
            tran.commit();
            mensaje = "Datos grupo Guardados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual modificamos un grupo

    @Override
    public String updateGrupo(Grupo grupo) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.update(grupo);
            tran.commit();
            mensaje = "Datos grupo Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual eliminamos un grupo

    @Override
    public String deleteGrupo(Grupo grupo) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.delete(grupo);
            tran.commit();
            mensaje = "Datos grupo Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos un grupo

    @Override
    public Grupo searchGrupo(int id) {
        Session sesion = null;
        Transaction tran = null;
        Grupo grupo = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Grupo WHERE idGrupo=" + id + "");
            grupo = (Grupo) query.uniqueResult();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return grupo;
    }

//Metodo por el cual listamos todos los grupos

    @Override
    public List<Grupo> listGrupos() {
        Session sesion = null;
        Transaction tran = null;
        List grupos = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            System.out.println("Sesion:"+sesion.toString());
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Grupo");
            grupos = query.list();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            try {
                sesion.close();
            }catch(Exception e){
            }
        }
        return grupos;
    }
}
