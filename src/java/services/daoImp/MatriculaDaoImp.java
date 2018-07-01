/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

/**
 *
 * @author LGF
 */
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.Session;
import model.Matricula;
import org.hibernate.Query;
import services.dao.MatriculaDao;

/**
 *
 * @author aaron
 */
public class MatriculaDaoImp implements MatriculaDao {

//Metodo por el cual añadimos una matricula

    @Override
    public String addMatricula(Matricula matricula) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.save(matricula);
            tran.commit();
            mensaje = "Datos matricula Guardados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual modificamos una matricula

    @Override
    public String updateMatricula(Matricula matricula) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.update(matricula);
            tran.commit();
            mensaje = "Datos matricula Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual eliminamos una matricula

    @Override
    public String deleteMatricula(Matricula matricula) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            sesion.delete(matricula);
            tran.commit();
            mensaje = "Datos matricula Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos una matricula

    @Override
    public Matricula searchMatricula(int id) {
        Session sesion = null;
        Transaction tran = null;
        Matricula matricula = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Matricula WHERE idMatricula=" + id + "");
            matricula = (Matricula) query.uniqueResult();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return matricula;
    }

//Metodo por el cual listamos las matriculas

    @Override
    public List<Matricula> listMatriculas() {
        Session sesion = null;
        Transaction tran = null;
        List matriculas = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Matricula");
            matriculas = query.list();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return matriculas;
    }
}
