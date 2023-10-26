/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MINH TUAN
 */
public class Assessment extends BaseEntity {

    private String assessment_ID;
    private Double course_grade_weight;
    private String course_grade_group;
    private Course course;
    private Grade grade;

    public String getAssessment_ID() {
        return assessment_ID;
    }

    public void setAssessment_ID(String assessment_ID) {
        this.assessment_ID = assessment_ID;
    }

    public Double getCourse_grade_weight() {
        return course_grade_weight;
    }

    public void setCourse_grade_weight(Double course_grade_weight) {
        this.course_grade_weight = course_grade_weight;
    }

    public String getCourse_grade_group() {
        return course_grade_group;
    }

    public void setCourse_grade_group(String course_grade_group) {
        this.course_grade_group = course_grade_group;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

}
