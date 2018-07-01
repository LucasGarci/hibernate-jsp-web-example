/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services.dao;

import java.util.List;
import model.User;

/**
 *
 * @author aaron
 */
public interface UserDao {

//Interfaz que se usará en UserDaoImp

    public String addUser(User user);

    public String updateUser(User user);

    public String deleteUser(User user);

    public User searchUser(String name);

    public List<User> listUsers();

}
