/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

import java.util.List;
import model.Gastos;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import services.dao.GastosDao;

/**
 *
 * @author LGF
 */
public class GastosDaoImp implements GastosDao {

//Metodo por el cual añadimos un gasto
    @Override
    public String addGastos(Gastos gasto) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.save(gasto);
            tran.commit();
            mensaje = "Datos Gastos Guardados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual modificamos un gasto
    @Override
    public String updateGastos(Gastos gastos) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.update(gastos);
            tran.commit();
            mensaje = "Datos Gastos Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual eliminamos un gasto
    @Override
    public String deleteGastos(Gastos gastos) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.delete(gastos);
            tran.commit();
            mensaje = "Datos Gastos Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos un gasto
    @Override
    public Gastos searchGastos(int idGastos) {
        Session sesion = null;
        Transaction tran = null;
        Gastos gasto = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Gastos WHERE idGastos=" + idGastos + "");
            gasto = (Gastos) query.uniqueResult();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return gasto;
    }

//Metodo por el cual buscamos todos los gastos
    @Override
    public List<Gastos> listGastos() {
        Session sesion = null;
        Transaction tran = null;
        List gastos = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Gastos");
            gastos = (List<Gastos>) query.list();
            tran.commit();
        } catch (HibernateException e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return gastos;
    }

    // Metodo que suma todos los importes de los gastos y los devuelve
    public float getImporteTotal() {
        float total = 0;
        List<Gastos> gastos;
        gastos = listGastos();
        for (Gastos gasto : gastos) {
            total += gasto.getImporte();
        }
        return total;
    }
}
