/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Semester;
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
public class SemesterDBContext extends DBContext<Semester> {

    public ArrayList<Semester> getAllSemester() {
        ArrayList<Semester> semesters = new ArrayList<>();
        try {
            String sql = "SELECT [semester_id]\n"
                    + "      ,[semester_name]\n"
                    + "      ,[start_date]\n"
                    + "      ,[end_date]\n"
                    + "  FROM [Semester]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester se = new Semester();
                se.setSemester_id(rs.getInt("semester_id"));
                se.setSemester_name(rs.getString("semester_name"));
                se.setStart_date(rs.getDate("start_date"));
                se.setEnd_date(rs.getDate("end_date"));
                semesters.add(se);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SemesterDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return semesters;
    }
}
