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

    public ArrayList<Semester> get() {
        ArrayList<Semester> semester = new ArrayList<>();
        try {
            String sql = "SELECT [semester_id]\n"
                    + "      ,[semester_name]\n"
                    + "      ,[start_date]\n"
                    + "      ,[end_date]\n"
                    + "  FROM [Semester]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Semester s = new Semester();
                s.setSemester_id(rs.getInt("semester_id"));
                s.setSemester_name(rs.getString("semester_name"));
                s.setSemester_startDate(rs.getDate("start_date"));
                s.setSemester_endDate(rs.getDate("end_date"));
                semester.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return semester;
    }
}
