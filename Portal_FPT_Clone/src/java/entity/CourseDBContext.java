/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import dal.DBContext;
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
public class CourseDBContext extends DBContext<Course> {

    public ArrayList<Course> getCourseByDepartmentID(int department_id) {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT [course_id]\n"
                    + "      ,[course_name]\n"
                    + "      ,[course_code]\n"
                    + "      ,d.[department_id]\n"
                    + "	     ,d.[department_name]\n"
                    + "  FROM [Course] c INNER JOIN [Department] d ON c.department_id = d.department_id\n"
                    + "  WHERE d.department_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, department_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                c.setCourse_code(rs.getString("course_code"));
                Department d = new Department();
                d.setDepartment_id(rs.getInt("department_id"));
                d.setDepartment_name(rs.getString("department_name"));
                c.setDepartment(d);
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return courses;
    }
}
