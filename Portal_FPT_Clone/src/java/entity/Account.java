/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MINH TUAN
 */
public class Account extends BaseEntity {

    private String username;
    private String password;
    private String displayname;
    private int cid;
    private int tid;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public int getCampusID() {
        return cid;
    }

    public void setCampusID(int campusID) {
        this.cid = campusID;
    }

    public int getTypeID() {
        return tid;
    }

    public void setTypeID(int typeID) {
        this.tid = typeID;
    }

}
