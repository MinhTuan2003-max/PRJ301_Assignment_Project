/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MINH TUAN
 */
public class Score extends BaseEntity {

    private int score_ID;
    private Enrollment enrollment;
    private Assessment assessment;
    private Double score;

    public int getScore_ID() {
        return score_ID;
    }

    public void setScore_ID(int score_ID) {
        this.score_ID = score_ID;
    }

    public Enrollment getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }

    public Assessment getAssessment() {
        return assessment;
    }

    public void setAssessment(Assessment assessment) {
        this.assessment = assessment;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }  
}
