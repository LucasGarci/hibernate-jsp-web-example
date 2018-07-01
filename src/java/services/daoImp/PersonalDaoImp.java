/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

import java.util.List;
import model.Personal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import services.dao.PersonalDao;

/**
 *
 * @author LGF
 */
public class PersonalDaoImp implements PersonalDao{

//Metodo por el cual añadimos un personal

    @Override
    public String addPersonal(Personal personal) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.save(personal);
            tran.commit();
            mensaje = "Datos Personal Guardados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual modificamos un personal

    @Override
    public String updatePersonal(Personal personal) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.update(personal);
            tran.commit();
            mensaje = "Datos Personal Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual eliminamos un personal

    @Override
    public String deletePersonal(Personal personal) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.delete(personal);
            tran.commit();
            mensaje = "Datos Personal Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos un personal

    @Override
    public Personal searchPersonal(String dni) {
        Session sesion = null;
        Transaction tran = null;
        Personal personal = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Personal WHERE dnipersonal='" + dni + "'");
            personal = (Personal) query.uniqueResult();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return personal;
    }

//Metodo por el cual listamos un personal

    @Override
    public List<Personal> listPersonal() {
        Session sesion = null;
        Transaction tran = null;
        List personal = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Personal");
            personal = query.list();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return personal;
    }
}
