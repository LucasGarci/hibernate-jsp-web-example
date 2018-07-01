/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.Session;
import model.Ingresos;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import services.dao.IngresosDao;

/**
 *
 * @author aaron
 */
public class IngresosDaoImp implements IngresosDao {

//Metodo por el cual añadimos un ingreso
    @Override
    public String addIngreso(Ingresos ingreso) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.save(ingreso);
            tran.commit();
            mensaje = "Datos ingreso Guardados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual modificamos un ingreso
    @Override
    public String updateIngresos(Ingresos ingreso) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.update(ingreso);
            tran.commit();
            mensaje = "Datos ingreso Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual eliminamos un ingreso
    @Override
    public String deleteIngresos(Ingresos ingreso) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.delete(ingreso);
            tran.commit();
            mensaje = "Datos ingreso Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos un ingreso
    @Override
    public Ingresos searchIngresos(int id) {
        Session sesion = null;
        Transaction tran = null;
        Ingresos grupo = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Ingresos WHERE idIngresos=" + id + "");
            grupo = (Ingresos) query.uniqueResult();
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

//Metodo por el cual listamos un ingreso
    @Override
    public List<Ingresos> listIngresos() {
        Session sesion = null;
        Transaction tran = null;
        List<Ingresos> ingresos = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Ingresos");
            ingresos = (List<Ingresos>) query.list();
            tran.commit();
        } catch (HibernateException e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return ingresos;
    }

    // Metodo que suma todos los importes de los ingresos y los devuelve
    
    public float getImporteTotal() {
        float total = 0;
        List<Ingresos> ingresos;
        ingresos = listIngresos();
        for (Ingresos gasto : ingresos) {
            total += gasto.getImporte();
        }
        return total;
    }
}
