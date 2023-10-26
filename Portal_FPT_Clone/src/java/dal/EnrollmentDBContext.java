/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Course;
import entity.Enrollment;
import entity.Group;
import entity.Semester;
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

    public Enrollment getEnrollment(int semesterID) {
        try {
            String sql = "SELECT e.[enrollment_id]\n"
                    + "      ,e.[student_id]\n"
                    + "      ,e.[semester_id]\n"
                    + "      ,c.[course_id]\n"
                    + "      ,e.[enrollment_start_date]\n"
                    + "      ,e.[enrollment_end_date]\n"
                    + "      ,e.[group_id]\n"
                    + "	  ,c.[course_name]\n"
                    + "  FROM [Enrollment] e INNER JOIN [Course] c ON e.course_id = c.course_id\n"
                    + "  WHERE semester_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, semesterID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollment_ID(rs.getString("enrollment_id"));
                e.setStartDate(rs.getDate("enrollment_start_date"));
                e.setEndDate(rs.getDate("enrollment_end_date"));
                Course c = new Course();
                c.setCourse_id(rs.getString("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                e.setCourse(c);
                Group g = new Group();
                g.setGroup_id(rs.getString("group_id"));
                g.setGroup_name(rs.getString("group_name"));
                e.setGroup(g);
                Student s = new Student();
                s.setStudent_ID(rs.getString("student_id"));
                e.setStudent(s);
                Semester se = new Semester();
                se.setSemester_id(rs.getInt("semester_id"));
                e.setSemester(se);
                return e;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Enrollment> get() {
        ArrayList<Enrollment> enrollments = new ArrayList<>();
        try {
            String sql = "SELECT e.[enrollment_id]\n"
                    + "      ,e.[student_id]\n"
                    + "      ,e.[semester_id]\n"
                    + "      ,c.[course_id]\n"
                    + "      ,e.[enrollment_start_date]\n"
                    + "      ,e.[enrollment_end_date]\n"
                    + "      ,g.[group_id], g.group_name, c.course_name\n"
                    + "  FROM [dbo].[Enrollment] e \n"
                    + "  INNER JOIN [Group] g ON e.group_id = g.group_id\n"
                    + "  INNER JOIN Course c ON e.course_id = c.course_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollment_ID(rs.getString("enrollment_id"));
                e.setStartDate(rs.getDate("enrollment_start_date"));
                e.setEndDate(rs.getDate("enrollment_end_date"));
                Course c = new Course();
                c.setCourse_id(rs.getString("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                e.setCourse(c);
                Group g = new Group();
                g.setGroup_id(rs.getString("group_id"));
                g.setGroup_name(rs.getString("group_name"));
                e.setGroup(g);
                Student s = new Student();
                s.setStudent_ID(rs.getString("student_id"));
                e.setStudent(s);
                Semester se = new Semester();
                se.setSemester_id(rs.getInt("semester_id"));
                e.setSemester(se);
                enrollments.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return enrollments;
    }
}
