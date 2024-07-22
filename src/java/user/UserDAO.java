/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import db.DBConn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iman
 */
public class UserDAO {

    private final Connection connection;
    private int result;

    public UserDAO() {
        connection = DBConn.getConnection();
    }

    public User login(String Email, String Password) {
        User user = new User();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from account where user_email='"
                    + Email + "' AND user_password='" + Password + "'";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                user.setUserID(myRs.getInt(1));
                user.setFullname(myRs.getString(4));
            }
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return user;
    }

    public int addUser(User user) {
        try {
            String mySqlQuery = "insert into account(fullname, user_password, user_email, user_phone, user_type)"
                    + " values(?,?,?,?,?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, user.getFullname());
            myPs.setString(2, user.getUser_password());
            myPs.setString(3, user.getUser_email());
            myPs.setString(4, user.getUser_phone());
            myPs.setString(5, user.getUser_type());

            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return result;
    }

    public User retrieveById(String userID) {
        User user = new User();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from account where userID=" + userID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                user.setUserID(myRs.getInt(1));
                user.setUser_email(myRs.getString(2));
                user.setUser_password(myRs.getString(3));
                user.setUser_type(myRs.getString(4));
                user.setFullname(myRs.getString(5));
                user.setUser_phone(myRs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return user;
    }

    public List<User> retrieveUser() {
        List<User> allUser = new ArrayList<User>();
        User All;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from account";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                All = new User();
                All.setUserID(myRs.getInt(1));
                All.setUser_type(myRs.getString(2));
                All.setFullname(myRs.getString(3));
                All.setUser_password(myRs.getString(4));
                All.setUser_email(myRs.getString(5));
                All.setUser_phone(myRs.getString(6));
                allUser.add(All);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return allUser;
    }

    public int updateUser(User user) {
        try {
            String mySqlQuery = "update account set fullname=?, user_password=?, user_email=?, user_phone=?, user_type=? where userID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, user.getFullname());
            myPs.setString(2, user.getUser_password());
            myPs.setString(3, user.getUser_email());
            myPs.setString(4, user.getUser_phone());
            myPs.setString(5, user.getUser_type());
            myPs.setInt(6, user.getUserID());

            result = myPs.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public int deleteUser(String userID) {
        try {
            String mySqlQuery = "delete from account where userID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, userID);
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is :" + e);
        }
        return result;
    }
}
