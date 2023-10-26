/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MINH TUAN
 */
public class Major_Course extends BaseEntity {

    private int major_course_id;
    private Major major;
    private Course course;
    private int semester_number;

    public int getMajor_course_id() {
        return major_course_id;
    }

    public void setMajor_course_id(int major_course_id) {
        this.major_course_id = major_course_id;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getSemester_number() {
        return semester_number;
    }

    public void setSemester_number(int semester_number) {
        this.semester_number = semester_number;
    }

}
