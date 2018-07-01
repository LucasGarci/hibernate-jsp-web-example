package model;
// Generated 15-feb-2018 17:54:17 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Matricula generated by hbm2java
 */
public class Matricula  implements java.io.Serializable {


     private Integer idMatricula;
     private Alumno alumno;
     private Date fechmatriculacion;
     private float precio;

    public Matricula() {
    }

    public Matricula(Alumno alumno, Date fechmatriculacion, float precio) {
       this.alumno = alumno;
       this.fechmatriculacion = fechmatriculacion;
       this.precio = precio;
    }
   
    public Integer getIdMatricula() {
        return this.idMatricula;
    }
    
    public void setIdMatricula(Integer idMatricula) {
        this.idMatricula = idMatricula;
    }
    public Alumno getAlumno() {
        return this.alumno;
    }
    
    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }
    public Date getFechmatriculacion() {
        return this.fechmatriculacion;
    }
    
    public void setFechmatriculacion(Date fechmatriculacion) {
        this.fechmatriculacion = fechmatriculacion;
    }
    public float getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(float precio) {
        this.precio = precio;
    }




}


