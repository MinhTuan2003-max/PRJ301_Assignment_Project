/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Campus;
import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MINH TUAN
 */
public class CampusDBContext extends DBContext<Campus> {

    public ArrayList<Campus> search(int userID) {
        ArrayList<Campus> campus = new ArrayList<>();
        try {
            String sql = "SELECT c.cid, c.cname\n"
                    + "FROM Campus c INNER JOIN Account a\n"
                    + "ON c.cid = a.cid\n"
                    + "WHERE a.user_id = ?\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Campus c = new Campus();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                campus.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CampusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CampusDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return campus;
    }

}
