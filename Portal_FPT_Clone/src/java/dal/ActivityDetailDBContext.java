/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Course;
import entity.Enrollment;
import entity.Group;
import entity.Instructure;
import entity.Room;
import entity.Semester;
import entity.Student;
import entity.TimeSlot;
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
public class ActivityDetailDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getDetailWeeklyTimetable(int user_id, int course_id, int attendance_id) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT a.[attendance_id]\n"
                    + "      ,i.instructure_code\n"
                    + "      ,s.student_ID\n"
                    + "      ,c.course_code\n"
                    + "      ,c.course_id\n"
                    + "      ,c.[course_name]\n"
                    + "      ,se.semester_id\n"
                    + "      ,g.group_id\n"
                    + "      ,g.group_name\n"
                    + "      ,a.day_of_week\n"
                    + "      ,r.room_code\n"
                    + "      ,a.[date]\n"
                    + "      ,t.[timeslot_id]\n"
                    + "      ,t.[description]\n"
                    + "      ,a.slot\n"
                    + "      ,a.[status]\n"
                    + "  FROM [Attendance] a INNER JOIN [Enrollment] e ON a.enrollment_id = e.enrollment_id\n"
                    + "  INNER JOIN [Group] g ON e.group_id = g.group_id\n"
                    + "  INNER JOIN [Course] c ON c.course_id = g.course_id\n"
                    + "  INNER JOIN [Rooms] r ON r.room_id = a.room_id\n"
                    + "  INNER JOIN [Student] s ON s.student_ID = e.student_id\n"
                    + "  INNER JOIN [TimeSlot] t ON a.timeslot_id = t.timeslot_id\n"
                    + "  INNER JOIN [Instructure] i ON i.instructure_id = a.instructure_id\n"
                    + "  INNER JOIN [Semester] se ON se.semester_id = g.semester_id\n"
                    + "  INNER JOIN [Account] ac ON ac.[user_id] = s.[user_id]\n"
                    + "  WHERE c.course_id = ? AND a.attendance_id = ? AND ac.[user_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, course_id);
            stm.setInt(2, attendance_id);
            stm.setInt(3, user_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Instructure pro = new Instructure();
                Student stu = new Student();
                Course c = new Course();
                Room r = new Room();
                Enrollment en = new Enrollment();
                Group g = new Group();
                Semester se = new Semester();
                TimeSlot timeSlot = new TimeSlot();

                pro.setInstructure_code(rs.getString("instructure_code"));

                stu.setStudent_ID(rs.getString("student_ID"));

                c.setCourse_code(rs.getString("course_code"));
                c.setCourse_id(rs.getInt("course_id"));
                c.setCourse_name(rs.getString("course_name"));
                
                r.setRoom_code(rs.getString("room_code"));

                se.setSemester_id(rs.getInt("semester_id"));

                g.setCourse(c);
                g.setGroup_id(rs.getInt("group_id"));
                g.setGroup_name(rs.getString("group_name"));
                g.setSemester(se);
                
                timeSlot.setTimeslot_id(rs.getInt("timeslot_id"));
                timeSlot.setDescription(rs.getString("description"));

                en.setStudent(stu);
                en.setGroup(g);

                att.setAttendance_id(rs.getInt("attendance_id"));
                att.setEnrollment(en);
                att.setInstructure(pro);
                att.setDate(rs.getDate("date"));
                att.setTimeSlot(timeSlot);

                att.setClassroom(r);
                att.setStatus(rs.getString("status"));
                att.setSlot(rs.getInt("slot"));
                att.setDay_of_week(rs.getString("day_of_week"));
                attendances.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return attendances;
    }
}
