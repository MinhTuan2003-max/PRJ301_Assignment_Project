/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Course;
import entity.Grade;
import entity.Score;
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
public class ScoreDBContext extends DBContext<Score> {

    public ArrayList<Score> getScores() {
        ArrayList<Score> scores = new ArrayList<>();
        try {
            String sql = "SELECT s.[score_id]\n"
                    + "      ,s.[enrollment_id]\n"
                    + "      ,a.[assessment_id]\n"
                    + "      ,s.[score]\n"
                    + "      ,a.[course_grade_weight]\n"
                    + "      ,a.[course_grade_group]\n"
                    + "  FROM [Score] s INNER JOIN Assessment a ON s.assessment_id = a.assessment_id\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Score s = new Score();
                s.setScore_ID(rs.getInt("score_id"));
                s.setScore(rs.getDouble("score"));
                Assessment a = new Assessment();
                a.setAssessment_ID(rs.getString("assessment_id"));
                a.setCourse_grade_weight(rs.getDouble("course_grade_weight"));
                a.setCourse_grade_group(rs.getString("course_grade_group"));
                s.setAssessment(a);
                scores.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScoreDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scores;
    }

    
}
