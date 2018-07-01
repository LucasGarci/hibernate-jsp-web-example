/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

import services.dao.ClaseDao;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.Session;
import model.Clase;
import org.hibernate.HibernateException;
import org.hibernate.Query;

/**
 *
 * @author KLAY
 */
public class ClaseDaoImp implements ClaseDao{

//Metodo por el cual agregamos una clase

    @Override
    public String addClase(Clase clase) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.save(clase);
            tran.commit();
            mensaje = "Datos clase Guardados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual modificamos una clase

    @Override
    public String updateClase(Clase clase) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.update(clase);
            tran.commit();
            mensaje = "Datos clase Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual eliminamos una clase

    @Override
    public String deleteClase(Clase clase) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.delete(clase);
            tran.commit();
            mensaje = "Datos clase Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos una clase

    @Override
    public Clase searchClase(int idClase) {
        Session sesion = null;
        Transaction tran = null;
        Clase clase = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Clase WHERE idClase=" + idClase + "");
            clase = (Clase) query.uniqueResult();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return clase;
    }

//Metodo por el cual listamos todas las clases

    @Override
    public List<Clase> listClases() {
        Session sesion = null;
        Transaction tran = null;
        List clases = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Clase");
            clases = query.list();
            tran.commit();
        } catch (HibernateException e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return clases;
    }

}
