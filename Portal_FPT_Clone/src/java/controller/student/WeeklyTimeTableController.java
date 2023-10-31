/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.BaseRequiredAuthenticationController;
import dal.AttendanceDBContext;
import dal.CampusDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Attendance;
import entity.Campus;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author MINH TUAN
 */
public class WeeklyTimeTableController extends BaseRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {

        AttendanceDBContext attdb = new AttendanceDBContext();
        String raw_date = request.getParameter("date");
        LocalDate date;
        if (raw_date == null) {
            date = LocalDate.now();
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            date = LocalDate.parse(raw_date, formatter);
        }
        request.setAttribute("date", date);

        LocalDate monday = date;
        while (monday.getDayOfWeek() != DayOfWeek.MONDAY) {
            monday = monday.minusDays(1);
        }
        Date sqlMon = Date.valueOf(monday);

        ArrayList<Date> week_date = new ArrayList<>();
        for (int i = 0; i <= 6; i++) {
            week_date.add(Date.valueOf(monday.plusDays(i)));
        }
        request.setAttribute("week_date", week_date);
        Date sqlSun = week_date.get(6);

        ArrayList<Attendance> weeklyTimetable = attdb.getWeeklyTimetable(loggedAccount.getUserID(), sqlMon, sqlSun);

        int size = 10;
        ArrayList<Integer> slot_index = new ArrayList<>();
        for (int i = 0; i <= size; i++) {
            slot_index.add(i);
        }
        request.setAttribute("slot_index", slot_index);

        ArrayList<Integer> slots = new ArrayList<>();
        for (Attendance w : weeklyTimetable) {
            slots.add(w.getSlot());
        }
        request.setAttribute("slots", slots);
        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());
        request.setAttribute("campus", campus);
        request.setAttribute("students", students);
        request.setAttribute("weeklyTimetable", weeklyTimetable);
        request.getRequestDispatcher("view/student/weeklytimetable.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {

    }

}
