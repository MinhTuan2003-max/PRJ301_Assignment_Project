/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Major;
import entity.Student;
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
public class MajorDBContext extends DBContext<Major> {

    public ArrayList<Major> getAll() {
        ArrayList<Major> majors = new ArrayList<>();
        try {
            String sql = "SSELECT [major_id]\n"
                    + "      ,[major_name]\n"
                    + "  FROM [Major]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Major m = new Major();
                m.setMajor_id(rs.getInt("major_id"));
                m.setMajor_name(rs.getString("major_name"));
                majors.add(m);
            }

        } catch (SQLException ex) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return majors;
    }

    public Major get(String studentID) {

        try {
            String sql = "SELECT m.[major_id]\n"
                    + "      ,m.[major_name]\n"
                    + "  FROM [dbo].[Major] m INNER JOIN [Student] s ON m.major_id = s.major_ID\n"
                    + "  WHERE s.[student_ID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentID);
            ResultSet rs = stm.executeQuery();
            
            if (rs.next()) {
                Major m = new Major();
                m.setMajor_id(rs.getInt("major_id"));
                m.setMajor_name(rs.getString("major_name"));
                return m;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

}
