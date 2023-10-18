/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
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
public class StudentDBContext extends DBContext<Student> {

    public Student getStudent(int userID) {
        try {
            String sql = "SELECT s.[student_ID]\n"
                    + "      ,s.[student_Name]\n"
                    + "      ,s.[student_Gender]\n"
                    + "      ,s.[student_dob]\n"
                    + "      ,s.[student_Address]\n"
                    + "      ,s.[student_IDCard]\n"
                    + "      ,s.[student_Phone]\n"
                    + "      ,s.[student_Email]\n"
                    + "      ,s.[student_Img]\n"
                    + "      ,a.[user_id]\n"
                    + "  FROM [Student] s INNER JOIN Account a ON s.[user_id] = a.[user_id]"
                    + " WHERE s.[user_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()) {
                Student student = new Student();
                student.setStudent_ID(rs.getString("student_ID"));
                student.setStudent_Name(rs.getString("student_Name"));
                student.setStudent_Address(rs.getString("student_Address"));
                student.setStudent_Gender(rs.getBoolean("student_Gender"));
                student.setStudent_dob(rs.getDate("student_dob"));
                student.setStudent_Email(rs.getString("student_Email"));
                student.setStudent_IDCard(rs.getInt("student_IDCard"));
                student.setStudent_Phone(rs.getInt("student_Phone"));
                student.setStudent_Img(rs.getString("student_Img"));
                Account account = new Account();
                account.setUserID(rs.getInt("user_id"));
                student.setAccount(account);
                return student;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
}
