/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Course;
import entity.Enrollment;
import entity.Group;
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
public class EnrollmentDBContext extends DBContext<Enrollment> {

    public ArrayList<Enrollment> getByGroupAndCourse(int group_id, int course_id, int semester_id) {
        ArrayList<Enrollment> enrollments = new ArrayList<>();
        try {
            String sql = "SELECT s.[student_id]\n"
                    + "      ,s.[student_Name]\n"
                    + "      ,s.[student_Img]\n"
                    + "      ,g.[group_name]\n"
                    + "  FROM [Enrollment] e INNER JOIN [Group] g ON e.group_id = g.group_id\n"
                    + "  INNER JOIN [Student] s ON e.student_id = s.student_ID\n"
                    + "  WHERE g.[group_id] = ? AND g.[course_id] = ? AND g.semester_id = ?\n"
                    + "  ORDER BY s.student_ID";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, group_id);
            stm.setInt(2, course_id);
            stm.setInt(3, semester_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                Student s = new Student();
                s.setStudent_ID(rs.getString("student_id"));
                s.setStudent_Name(rs.getString("student_Name"));
                s.setStudent_Img(rs.getString("student_Img"));
                e.setStudent(s);
                Group g = new Group();
                g.setGroup_name(rs.getString("group_name"));
                e.setGroup(g);
                enrollments.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return enrollments;
    }

    public Enrollment getEnrollmentByStudentIDAndGroup(String studentID, int group_id) {
        try {
            String sql = "SELECT [enrollment_id]\n"
                    + "		  ,s.[student_id]\n"
                    + "		  ,[total_slot]\n"
                    + "		  ,g.[group_id] \n"
                    + "	  FROM [Enrollment] e INNER JOIN [Student] s ON s.student_ID = e.student_id\n"
                    + "	  INNER JOIN [Group] g ON e.group_id = g.group_id\n"
                    + "	  WHERE s.[student_ID] = ? AND g.group_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentID);
            stm.setInt(2, group_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollment_id(rs.getInt("enrollment_id"));
                e.setTotal_slot(rs.getInt("total_slot"));
                Group g = new Group();
                g.setGroup_id(rs.getInt("group_id"));
                e.setGroup(g);
                Student s = new Student();
                s.setStudent_ID(rs.getString("student_id"));
                e.setStudent(s);
                return e;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public int calculateAbsentPercent(Enrollment enrollments, int absentCount) {
        if (enrollments.getTotal_slot() == 0) {
            return 0;
        }
        return Math.round((float) absentCount / enrollments.getTotal_slot() * 100);
    }
}
