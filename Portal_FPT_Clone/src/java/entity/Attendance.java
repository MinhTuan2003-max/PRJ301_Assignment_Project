/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author MINH TUAN
 */
public class Attendance extends BaseEntity {

    private int attendance_id;
    private Enrollment enrollment;
    private Instructure instructure;
    private Date date;
    private TimeSlot timeSlot;
    private Room classroom;
    private String status;
    private int slot;
    private String taken_by;
    private String day_of_week;
    private String comments;

    public String getTaken_by() {
        return taken_by;
    }

    public void setTaken_by(String taken_by) {
        this.taken_by = taken_by;
    }

    public int getAttendance_id() {
        return attendance_id;
    }

    public void setAttendance_id(int attendance_id) {
        this.attendance_id = attendance_id;
    }

    public Enrollment getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }

    public Instructure getInstructure() {
        return instructure;
    }

    public void setInstructure(Instructure instructure) {
        this.instructure = instructure;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Room getClassroom() {
        return classroom;
    }

    public void setClassroom(Room classroom) {
        this.classroom = classroom;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public void setDay_of_week(String day_of_week) {
        this.day_of_week = day_of_week;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String notes) {
        this.comments = notes;
    }
}
