/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Instructure;
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
public class InstructorDBContext extends DBContext<Instructure> {

    public ArrayList<Instructure> getInforInstructorByCode(String instructor_Code) {
        ArrayList<Instructure> instructures = new ArrayList<>();
        try {

            String sql = "SELECT [instructure_id]\n"
                    + "      ,[instructure_name]\n"
                    + "      ,[instructure_code]\n"
                    + "      ,[instructure_email]\n"
                    + "      ,[instructure_img]\n"
                    + "      ,[meet_link]\n"
                    + "  FROM [Instructure]\n"
                    + "  WHERE instructure_code = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructor_Code);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Instructure i = new Instructure();
                i.setInstructure_id(rs.getInt("instructure_id"));
                i.setInstructure_name(rs.getString("instructure_name"));
                i.setInstructure_code(rs.getString("instructure_code"));
                i.setInstructure_img(rs.getString("instructure_img"));
                i.setEmail(rs.getString("instructure_email"));
                i.setMeet_link(rs.getString("meet_link"));
                instructures.add(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InstructorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return instructures;
    }
}
