package model;
// Generated 15-feb-2018 17:54:17 by Hibernate Tools 4.3.1



/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private String name;
     private String passw;
     private String role;

    public User() {
    }

    public User(String name, String passw, String role) {
       this.name = name;
       this.passw = passw;
       this.role = role;
    }
   
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getPassw() {
        return this.passw;
    }
    
    public void setPassw(String passw) {
        this.passw = passw;
    }
    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }




}


