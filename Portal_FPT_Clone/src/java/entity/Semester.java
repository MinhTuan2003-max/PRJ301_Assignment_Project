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
public class Semester extends BaseEntity {
    private int semester_id;
    private String semester_name;
    private Date semester_startDate;
    private Date semester_endDate;

    public int getSemester_id() {
        return semester_id;
    }

    public void setSemester_id(int semester_id) {
        this.semester_id = semester_id;
    }

    public String getSemester_name() {
        return semester_name;
    }

    public void setSemester_name(String semester_name) {
        this.semester_name = semester_name;
    }

    public Date getSemester_startDate() {
        return semester_startDate;
    }

    public void setSemester_startDate(Date semester_startDate) {
        this.semester_startDate = semester_startDate;
    }

    public Date getSemester_endDate() {
        return semester_endDate;
    }

    public void setSemester_endDate(Date semester_endDate) {
        this.semester_endDate = semester_endDate;
    }
    
}
