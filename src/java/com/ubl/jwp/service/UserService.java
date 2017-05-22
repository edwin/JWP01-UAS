package com.ubl.jwp.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * <pre>
 *  com.ubl.jwp.service.UserService
 * </pre>
 *
 * @author edwin < edwinkun at gmail dot com >
 * Apr 17, 2017 1:40:40 PM
 *
 */
public class UserService {

    private Connection connect = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    
    public int login(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/kampus?", "root", "");
            preparedStatement = connect.prepareStatement("select count(1) from tbl_user where username = ? and password = md5(?)");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int hasil = resultSet.getInt(1);
                return hasil;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    public String[][] getUsers() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/kampus?", "root", "");
            preparedStatement = connect.prepareStatement("select count(1) from tbl_user");
            resultSet = preparedStatement.executeQuery();
            
            int hasil = 0;
            if(resultSet.next()){
                hasil = resultSet.getInt(1);
            }
            
            String[][] data = new String[hasil][4];
            
            preparedStatement = connect.prepareStatement("select * from tbl_user");
            resultSet = preparedStatement.executeQuery();
            
            int i = 0;
            while(resultSet.next()){
                data[i][0] = resultSet.getString("id");
                data[i][1] = resultSet.getString("username");
                data[i][2] = resultSet.getString("password");
                data[i][3] = resultSet.getString("nama");
                
                i++;
            }
            
            return data;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(connect != null)
                    connect.close();    
                if(preparedStatement != null)
                    preparedStatement.close();    
                if(resultSet != null)
                    resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return new String[][]{};
    }
    
    public String[] getUser(int id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/kampus?", "root", "");
            
            String[] data = new String[4];
            preparedStatement = connect.prepareStatement("select * from tbl_user where id = ?");
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()){
                data[0] = resultSet.getString("id");
                data[1] = resultSet.getString("username");
                data[2] = resultSet.getString("password");
                data[3] = resultSet.getString("nama");
            }
            
            return data;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(connect != null)
                    connect.close();    
                if(preparedStatement != null)
                    preparedStatement.close();    
                if(resultSet != null)
                    resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return new String[]{};
    }
    
    public void deleteUser(int id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/kampus?", "root", "");
            
            String[] data = new String[4];
            preparedStatement = connect.prepareStatement("delete from tbl_user where id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(connect != null)
                    connect.close();    
                if(preparedStatement != null)
                    preparedStatement.close();    
                if(resultSet != null)
                    resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public void saveUser(String id, String username, String password, String nama) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/kampus?", "root", "");
            
            // insert ketika tidak punya id
            if(id == null || id.trim().isEmpty()) {
                preparedStatement = connect.prepareStatement("insert into tbl_user values (null, ?, md5(?), ?)");
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, nama);
                preparedStatement.executeUpdate();
            } else { // update ketika punya id
                preparedStatement = connect.prepareStatement("update tbl_user set username = ?, `password`=md5(?), nama=? where id = ?");
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, nama);
                preparedStatement.setInt(4, Integer.parseInt(id));
                preparedStatement.executeUpdate();
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(connect != null)
                    connect.close();    
                if(preparedStatement != null)
                    preparedStatement.close();    
                if(resultSet != null)
                    resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
