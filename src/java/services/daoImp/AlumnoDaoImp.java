/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.daoImp;

import services.dao.AlumnoDao;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.Session;
import model.Alumno;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.type.Type;

/**
 *
 * @author aaron
 */
public class AlumnoDaoImp implements AlumnoDao {

//Metodo en el cual agregamos un alumno
    @Override
    public String addAlumno(Alumno alumno) {
        String mensaje;
        Session sesion = null;
        Transaction tran = null;
        try {
            //Creamos la sesion y la trasnsaccion
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            //Hacemos que la sesion nos guarde un alumno que hemos metido por parametros
            sesion.save(alumno);
            tran.commit();
            //Ponemos un Sysout para ver que el alumno ha sido agregado correctamente
            System.out.println("addAlumno: " + alumno.toString());
            mensaje = "Datos Guardados";
            return mensaje;
        } catch (HibernateException e) {
            if (tran != null) {
                tran.rollback();
            }
            return (e.getMessage());
        } finally {
            try {
                sesion.close();
            } catch (HibernateException e2) {
            }
        }
    }

//Metodo en el cual hacemos un update de un Alumno ya creado
    @Override
    public String updateAlumno(Alumno alumno) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            //Hacemos que la sesion modifique al alumno que hemos metido por parametros
            sesion.update(alumno);
            tran.commit();
            mensaje = "Datos Modificados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo en el cual eliminamos un alumno
    @Override
    public String deleteAlumno(Alumno alumno) {
        String mensaje = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            Transaction tran = sesion.getTransaction();
            tran.begin();
            //Hacemos que la sesion elimine al alumno que hemos metido por parametros
            sesion.delete(alumno);
            tran.commit();
            mensaje = "Datos Eliminados";
            return mensaje;
        } catch (Exception e) {
            return (e.getMessage());
        } finally {
            sesion.close();
        }
    }

//Metodo por el cual buscamos un alumno ingresando su PK
    @Override
    public Alumno searchAlumno(String dni) {
        Session sesion = null;
        Transaction tran = null;
        Alumno alumno = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            //Creamos una query en la cual buscamos un alumno por su DNI
            Query query = sesion.createQuery("FROM Alumno WHERE dnialumno='" + dni + "'");
            //Guardamos el alumno que nos devuelve la query
            alumno = (Alumno) query.uniqueResult();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            try {
                sesion.close();
            } catch (Exception e) {
            }
        }
        //Hacemos que nbos retorne el alumno seleccionado
        return alumno;
    }

//Metodo por el cual listamos todos los alumnos
    @Override
    public List<Alumno> listAllAlumnos() {
        Session sesion = null;
        Transaction tran = null;
        List alumnos = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Alumno");
            alumnos = query.list();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            try {
                sesion.close();
            } catch (Exception e) {
            }
        }
        return alumnos;
    }

//Metodo por el cual listamos solo los alumnos matriculados
    @Override
    public List<Alumno> listAlumnosMat() {
        Session sesion = null;
        Transaction tran = null;
        List alumnos = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("Select distinct a FROM Alumno a, Matricula m WHERE a.dnialumno = m.alumno.dnialumno");
            alumnos = query.list();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return alumnos;
    }

//Metodo por el cual listamos solo los alumnos no matriculados
    @Override
    public List<Alumno> listAlumnosNoMat() {
        Session sesion = null;
        Transaction tran = null;
        List alumnos = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Alumno a WHERE a.dnialumno not in (Select m.alumno.dnialumno FROM Matricula m)");
            alumnos = query.list();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return alumnos;
    }

//Metodo por el cual sacamos el numero total de alumnos que estan matriculados
    @Override
    public int numAlMat() {
        Session sesion = null;
        Transaction tran = null;
        int num = 0;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("Select distinct a FROM Alumno a, Matricula m WHERE a.dnialumno = m.alumno.dnialumno");
            List l = query.list();
            num = l.size();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return num;
    }

//Metodo por el cual sacamos el numero total de alumnos que no estan matriculados
    @Override
    public int numAlNoMat() {
        Session sesion = null;
        Transaction tran = null;
        int num = 0;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            tran = sesion.getTransaction();
            tran.begin();
            Query query = sesion.createQuery("FROM Alumno a WHERE a.dnialumno not in (Select m.alumno.dnialumno FROM Matricula m)");
            List l = query.list();
            num = l.size();
            tran.commit();
        } catch (Exception e) {
            if (tran != null) {
                tran.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return num;
    }

}
