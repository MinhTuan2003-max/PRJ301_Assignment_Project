/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Course;
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
public class GroupDBContext extends DBContext<Group> {

    public ArrayList<Group> getGroupByStudentIDAndSemester(String studentID, int semester_id) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT g.[group_id]\n"
                    + "      ,g.[group_name]\n"
                    + "      ,se.[semester_id]\n"
                    + "      ,c.[course_id]\n"
                    + "	     ,c.[course_name]\n"
                    + "	     ,c.[course_code]\n"
                    + "	     ,c.[start_date]\n"
                    + "	     ,se.[semester_name]\n"
                    + "  FROM [Group] g INNER JOIN [Enrollment] e ON g.group_id = e.group_id\n"
                    + "  INNER JOIN [Student] s ON e.student_id = s.student_ID\n"
                    + "  INNER JOIN [Course] c ON g.course_id = c.course_id\n"
                    + "  INNER JOIN [Semester] se ON se.semester_id = g.semester_id\n"
                    + "  WHERE s.[student_id] = ? AND se.semester_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentID);
            stm.setInt(2, semester_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setGroup_id(rs.getInt("group_id"));
                Course c = new Course();
                g.setGroup_name(rs.getString("group_name"));
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_code(rs.getString("course_code"));
                c.setCourse_name(rs.getString("course_name"));
                c.setStart_date(rs.getDate("start_date"));
                g.setCourse(c);
                Semester se = new Semester();
                se.setSemester_id(semester_id);
                se.setSemester_name(rs.getString("semester_name"));
                g.setSemester(se);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return groups;
    }
}
