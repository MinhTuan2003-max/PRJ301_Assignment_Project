/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author MINH TUAN
 */
public class Instructure extends BaseEntity {

    private int instructure_id;
    private String instructure_name;
    private String instructure_code;
    private String email;
    private String instructure_img;
    private ArrayList<Department> departments;
    private ArrayList<Attendance> attendances;

    public int getInstructure_id() {
        return instructure_id;
    }

    public void setInstructure_id(int instructure_id) {
        this.instructure_id = instructure_id;
    }

    public String getInstructure_name() {
        return instructure_name;
    }

    public void setInstructure_name(String instructure_name) {
        this.instructure_name = instructure_name;
    }

    public String getInstructure_code() {
        return instructure_code;
    }

    public void setInstructure_code(String instructure_code) {
        this.instructure_code = instructure_code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getInstructure_img() {
        return instructure_img;
    }

    public void setInstructure_img(String instructure_img) {
        this.instructure_img = instructure_img;
    }

    public ArrayList<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(ArrayList<Department> departments) {
        this.departments = departments;
    }

    public ArrayList<Attendance> getAttendances() {
        return attendances;
    }

    public void setAttendances(ArrayList<Attendance> attendances) {
        this.attendances = attendances;
    }

}
