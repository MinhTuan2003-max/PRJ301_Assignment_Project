/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Course;
import entity.Grade;
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
public class AssessmentDBContext extends DBContext<Assessment> {

    public ArrayList<Assessment> getAssessments() {
        ArrayList<Assessment> assessments = new ArrayList<>();
        try {
            String sql = "SELECT [assessment_id]\n"
                    + "      ,[course_id]\n"
                    + "      ,g.[grade_id]\n"
                    + "      ,[course_grade_weight]\n"
                    + "      ,[course_grade_group]\n"
                    + "	  ,g.[grade_name]\n"
                    + "  FROM [Assessment] a INNER JOIN Grade g ON a.grade_id = g.grade_id\n"
                    + "  WHERE course_id = 'CEA201'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Assessment a = new Assessment();
                a.setAssessment_ID(rs.getString("assessment_id"));
                a.setCourse_grade_weight(rs.getDouble("course_grade_weight"));
                a.setCourse_grade_group(rs.getString("course_grade_group"));
                Grade g = new Grade();
                g.setGrade_id(rs.getString("grade_id"));
                g.setGrade_name(rs.getString("grade_name"));
                a.setGrade(g);
                Course c = new Course();
                c.setCourse_id(rs.getString("course_id"));
                a.setCourse(c);
                assessments.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assessments;
    }
}
