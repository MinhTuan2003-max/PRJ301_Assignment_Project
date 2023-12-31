/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author MINH TUAN
 */
public class Student extends BaseEntity {

    private String student_ID;
    private String student_Name;
    private String student_Address;
    private String student_Img;
    private String student_Email;
    private int student_IDCard;
    private int student_Phone;
    private boolean student_Gender;
    private Date student_dob;
    private int current_semester;
    private double current_gpa;
    private Account account;
    private Major major;
    private ArrayList<Enrollment> enrollments;

    public String getStudent_ID() {
        return student_ID;
    }

    public void setStudent_ID(String student_ID) {
        this.student_ID = student_ID;
    }

    public String getStudent_Name() {
        return student_Name;
    }

    public void setStudent_Name(String student_Name) {
        this.student_Name = student_Name;
    }

    public boolean isStudent_Gender() {
        return student_Gender;
    }

    public void setStudent_Gender(boolean student_Gender) {
        this.student_Gender = student_Gender;
    }

    public String getStudent_Address() {
        return student_Address;
    }

    public void setStudent_Address(String student_Address) {
        this.student_Address = student_Address;
    }

    public String getStudent_Img() {
        return student_Img;
    }

    public void setStudent_Img(String student_Img) {
        this.student_Img = student_Img;
    }

    public String getStudent_Email() {
        return student_Email;
    }

    public void setStudent_Email(String student_Email) {
        this.student_Email = student_Email;
    }

    public int getStudent_IDCard() {
        return student_IDCard;
    }

    public void setStudent_IDCard(int student_IDCard) {
        this.student_IDCard = student_IDCard;
    }

    public int getStudent_Phone() {
        return student_Phone;
    }

    public void setStudent_Phone(int student_Phone) {
        this.student_Phone = student_Phone;
    }

    public Date getStudent_dob() {
        return student_dob;
    }

    public void setStudent_dob(Date student_dob) {
        this.student_dob = student_dob;
    }

    public entity.Account getAccount() {
        return account;
    }

    public void setAccount(entity.Account account) {
        this.account = account;
    }

    public ArrayList<Enrollment> getEnrollments() {
        return enrollments;
    }

    public void setEnrollments(ArrayList<Enrollment> enrollments) {
        this.enrollments = enrollments;
    }

    public int getCurrent_semester() {
        return current_semester;
    }

    public void setCurrent_semester(int current_semester) {
        this.current_semester = current_semester;
    }

    public double getCurrent_gpa() {
        return current_gpa;
    }

    public void setCurrent_gpa(double current_gpa) {
        this.current_gpa = current_gpa;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

}