/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Campus;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MINH TUAN
 */
public class AccountDBContext extends DBContext<Account> {

    public Account get(Account entity) {
        try {
            String sql = "SELECT [user_id]\n"
                    + "      ,[username]\n"
                    + "      ,[password]\n"
                    + "      ,[displayname]\n"
                    + "      ,[cid]\n"
                    + "      ,[tid]\n"
                    + "  FROM [Account] a"
                    + "WHERE a.username = ? AND a.[password] = ? AND a.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getUsername());
            stm.setString(2, entity.getPassword());
            stm.setInt(3, entity.getCampus().getCid());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUserID(rs.getInt("user_id"));
                account.setUsername(rs.getString("username"));
                account.setDisplayname(rs.getString("displayname"));
                return account;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Account get(String username, String password, int campus) {
        String sql = "SELECT [user_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[displayname]\n"
                + "      ,[cid]\n"
                + "      ,[tid]\n"
                + "  FROM [Account]"
                + "WHERE username = ? AND [password] = ? AND cid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setInt(3, campus);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setUserID(rs.getInt("user_id"));
                account.setUsername(username);
                account.setDisplayname(rs.getString("displayname"));
                Campus c = new Campus();
                c.setCid(campus);
                account.setCampus(c);
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Account getAccount(int accountID) {
        String sql = "SELECT [user_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[displayname]\n"
                + "      ,[cid]\n"
                + "      ,[tid]\n"
                + "  FROM [Account]";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            rs = stm.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setUserID(rs.getInt("user_id"));
                a.setUsername(rs.getString("username"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

}
