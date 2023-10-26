/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import entity.Assessment;
import entity.Score;
import java.util.ArrayList;

/**
 *
 * @author MINH TUAN
 */
public class CalculateScoreTotal {

    public double calculateGPA(ArrayList<Score> scores) {
        double totalWeightedScore = 0.0;
        double totalWeight = 0.0;

        for (Score score : scores) {
            Assessment assessment = score.getAssessment();
            String assessmentId = assessment.getCourse_grade_group();

            if (!"Total".equalsIgnoreCase(assessmentId)) {
                double courseGradeWeight = assessment.getCourse_grade_weight();
                Double courseScore = score.getScore();

                if (courseScore != null && courseScore >= 0) {
                    totalWeightedScore += courseGradeWeight * courseScore;
                    totalWeight += courseGradeWeight;
                }
            }
        }

        if (totalWeight > 0.0) {
            double roundedGPA = Math.round(totalWeightedScore * 10.0) / 10.0;
            return roundedGPA;
        } else {
            return 0.0;
        }
    }

    public String checkGPA(double gpa) {
        if (gpa >= 5.0) {
            return "PASS";
        } else {
            return "NOT PASS";
        }
    }
}
