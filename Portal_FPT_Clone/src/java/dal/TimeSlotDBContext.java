/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.TimeSlot;
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
public class TimeSlotDBContext extends DBContext<TimeSlot> {

    public ArrayList<TimeSlot> getTimeSlot() {
        ArrayList<TimeSlot> timeSlots = new ArrayList<>();
        try {
            String sql = "SELECT [timeslot_id]\n"
                    + "      ,[description]\n"
                    + "  FROM [TimeSlot]\n"
                    + "  ORDER BY [timeslot_id]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                TimeSlot t = new TimeSlot();
                t.setTimeslot_id(rs.getInt("timeslot_id"));
                t.setDescription(rs.getString("description"));
                timeSlots.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return timeSlots;
    }
}
