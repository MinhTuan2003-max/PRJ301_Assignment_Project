/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Course;
import entity.Department;
import entity.Group;
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
public class DepartmentDBContext extends DBContext<Department> {

    public ArrayList<Department> getDepartmentBySemester() {
        ArrayList<Department> departments = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT d.[department_id]\n"
                    + "      ,d.[department_name]\n"
                    + "  FROM [Department] d INNER JOIN [Course] c ON d.department_id = c.department_id\n"
                    + "  INNER JOIN [Group] g ON g.course_id = c.course_id\n"
                    + "  INNER JOIN [Semester] s ON s.semester_id = g.semester_id\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setDepartment_id(rs.getInt("department_id"));
                d.setDepartment_name(rs.getString("department_name"));
                departments.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DepartmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return departments;
    }
}
