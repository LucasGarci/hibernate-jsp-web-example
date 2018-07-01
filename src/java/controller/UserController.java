/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import services.daoImp.UserDaoImp;
import static services.seguridad.Cifrador.getSHA_256_Digest;

/**
 *
 * @author aaron
 */
public class UserController extends HttpServlet {

    UserDaoImp userdaoimp = new UserDaoImp();
    User user = new User();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addUser") != null) {
            String name = request.getParameter("name");
            String passwd = request.getParameter("passwd");
            String role = request.getParameter("role");

            user.setName(name);
            user.setPassw(getSHA_256_Digest(passwd));
            user.setRole(role);
            userdaoimp.addUser(user);

            RequestDispatcher rd = request.getRequestDispatcher("Usuarios.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("salir") != null) {
            HttpSession mySession = request.getSession();
            mySession.invalidate();
            response.sendRedirect("Login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("deleteUser") != null) {
            String name = request.getParameter("namedel");
            User us = userdaoimp.searchUser(name);
            userdaoimp.deleteUser(us);
            RequestDispatcher rd = request.getRequestDispatcher("Usuarios.jsp");
            rd.forward(request, response);
        }

        if (request.getParameter("updateUser") != null) {
            String name = request.getParameter("upname");
            String passwd = request.getParameter("uppasswd");
            String role = request.getParameter("uprole");
            HttpSession mySession = request.getSession();
            user.setName(name);
            user.setPassw(getSHA_256_Digest(passwd));
            user.setRole(role);
            if (mySession.getAttribute("userRole").equals("user")) {
                user.setRole("user");
                userdaoimp.updateUser(user);
                RequestDispatcher rd = request.getRequestDispatcher("Perfil.jsp");
                rd.forward(request, response);
            } else {
                userdaoimp.updateUser(user);
                RequestDispatcher rd = request.getRequestDispatcher("Usuarios.jsp");
                rd.forward(request, response);
            }
        }
        if (request.getParameter("logUser") != null) {
            String name = request.getParameter("name");
            User userToLog = userdaoimp.searchUser(name);
            String passwlogin = request.getParameter("password");
            passwlogin = getSHA_256_Digest(passwlogin);
            String passw = userToLog.getPassw();
            System.out.println("Pass cifrada: " + passwlogin);
            if (passw.equals(passwlogin)) {
                System.out.println("Login realizado");
                // response.sendRedirect("Inicio.jsp");

                //PRUEBA DE SESION
                String userName = "userName";
                String userRole = "userRole";
                String valorName = userToLog.getName();
                String valorRole = userToLog.getRole();
                HttpSession mySession = request.getSession();
                mySession.setAttribute(userRole, valorRole);
                mySession.setAttribute(userName, valorName);
                System.out.println("______________DATOS SESSION______________");
                System.out.println("Sesion getAttribute('userRole'): " + mySession.getAttribute(userRole));
                System.out.println("Sesion getAttribute('userName'): " + mySession.getAttribute(userName));
                System.out.println("Sesion getId " + mySession.getId());
                System.out.println("Sesion getCreationTime " + mySession.getCreationTime());
                System.out.println("Sesion getServletContext " + mySession.getServletContext());
                System.out.println("______________ FIN DATOS SESSION______________");

                RequestDispatcher rd = request.getRequestDispatcher("Inicio.jsp");
                rd.forward(request, response);
            } else {
                System.out.println("Login incorrecto");
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
        }
    }
}
