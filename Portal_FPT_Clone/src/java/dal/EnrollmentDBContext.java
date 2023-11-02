/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
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

    public ArrayList<Enrollment> getByStudentUserId(int user_id) {
        ArrayList<Enrollment> enrollments = new ArrayList<>();
        try {
            String sql = "SELECT [enrollment_id]\n"
                    + "      ,s.[student_id]\n"
                    + "      ,[total_slot]\n"
                    + "      ,[total_absent_slot]\n"
                    + "      ,[group_id] \n"
                    + "  FROM [Enrollment] e INNER JOIN [Student] s ON s.student_ID = e.student_id\n"
                    + "  WHERE s.[user_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollment_id(rs.getInt("enrollment_id"));
                e.setTotal_slot(rs.getInt("total_slot"));
                e.setTotal_absent_slot(rs.getInt("total_absent_slot"));
                Group g = new Group();
                g.setGroup_id(rs.getInt("group_id"));
                e.setGroup(g);
                Student st = new Student();
                st.setStudent_ID(rs.getString("student_id"));
                e.setStudent(st);
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

    public ArrayList<Enrollment> getByGroup(int group_id) {
        ArrayList<Enrollment> enrollments = new ArrayList<>();
        try {
            String sql = "SELECT [enrollment_id]\n"
                    + "      ,[student_id]\n"
                    + "      ,[total_slot]\n"
                    + "      ,[total_absent_slot]\n"
                    + "      ,[group_id] \n"
                    + "  FROM [Enrollment]\n"
                    + "  WHERE [group_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, group_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollment_id(rs.getInt("enrollment_id"));
                e.setTotal_slot(rs.getInt("total_slot"));
                e.setTotal_absent_slot(rs.getInt("total_absent_slot"));
                Student s = new Student();
                s.setStudent_ID(rs.getString("student_id"));
                e.setStudent(s);
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

    public Enrollment getEnrollmentByUserAndGroup(int user_id, int group_id) {
        try {
            String sql = "SELECT [enrollment_id]\n"
                    + "		  ,s.[student_id]\n"
                    + "		  ,[total_slot]\n"
                    + "		  ,[total_absent_slot]\n"
                    + "		  ,g.[group_id] \n"
                    + "	  FROM [Enrollment] e INNER JOIN [Student] s ON s.student_ID = e.student_id\n"
                    + "	  INNER JOIN [Group] g ON e.group_id = g.group_id\n"
                    + "	  WHERE s.[user_id] = ? AND g.group_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user_id);
            stm.setInt(2, group_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollment_id(rs.getInt("enrollment_id"));
                e.setTotal_absent_slot(rs.getInt("total_absent_slot"));
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

    public ArrayList<Enrollment> getAllEnrollmentByGroup(int group_id) {

        ArrayList<Enrollment> enrollments = new ArrayList<>();
        try {
            String sql = "SELECT [enrollment_id]\n"
                    + "		,s.[student_id]\n"
                    + "		,s.[student_Name]\n"
                    + "		,s.[student_Img]\n"
                    + "		,[total_slot]\n"
                    + "		,[total_absent_slot]\n"
                    + "		,a.[user_id]\n"
                    + "	FROM [Enrollment] e INNER JOIN [Student] s ON s.student_ID = e.student_id\n"
                    + "	INNER JOIN [Group] g ON e.group_id = g.group_id\n"
                    + "	INNER JOIN [Account] a ON a.[user_id] = s.[user_id]\n"
                    + "	WHERE g.group_id = ?\n"
                    + "	ORDER BY s.[student_ID]";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, group_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setTotal_slot(rs.getInt("total_slot"));
                e.setTotal_absent_slot(rs.getInt("total_absent_slot"));
                e.setEnrollment_id(rs.getInt("enrollment_id"));
                Account a = new Account();
                a.setUserID(rs.getInt("user_id"));
                Student st = new Student();
                st.setStudent_ID(rs.getString("student_id"));
                st.setStudent_Name(rs.getString("student_Name"));
                st.setStudent_Img(rs.getString("student_imgsrc"));
                st.setAccount(a);
                e.setStudent(st);
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
}
