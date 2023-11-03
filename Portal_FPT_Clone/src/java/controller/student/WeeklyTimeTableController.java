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
import java.util.List;

/**
 *
 * @author MINH TUAN
 */
public class WeeklyTimeTableController extends BaseRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        Date startDate = null;
        Date endDate = null;
        ArrayList<Date> week_date = new ArrayList<>();
        if (startDateStr != null && endDateStr != null) {
            startDate = Date.valueOf(startDateStr);
            startDate = Date.valueOf(startDateStr);
            endDate = Date.valueOf(endDateStr);
            LocalDate current = startDate.toLocalDate();

            ArrayList<String> formattedDates = new ArrayList<>(); // To store formatted date strings
            week_date = new ArrayList<>(); // To store Date objects

            // Populate the lists with formatted strings and Date objects
            while (!current.isAfter(endDate.toLocalDate())) {
                String formattedDate = current.getDayOfWeek().toString() + " " + current.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                formattedDates.add(formattedDate);
                week_date.add(Date.valueOf(current));
                current = current.plusDays(1);
            }
        } else {
            // Calculate the current week's start and end dates
            LocalDate today = LocalDate.now();
            LocalDate currentMonday = today.with(DayOfWeek.MONDAY);
            LocalDate currentSunday = today.with(DayOfWeek.SUNDAY);

            startDate = Date.valueOf(currentMonday);
            endDate = Date.valueOf(currentSunday);

            // Populate the lists with formatted strings and Date objects
            ArrayList<String> formattedDates = new ArrayList<>();
            week_date = new ArrayList<>();
            LocalDate current = currentMonday;
            while (!current.isAfter(currentSunday)) {
                String formattedDate = current.getDayOfWeek().toString() + " " + current.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                formattedDates.add(formattedDate);
                week_date.add(Date.valueOf(current));
                current = current.plusDays(1);
            }
        }
        AttendanceDBContext attdb = new AttendanceDBContext();
        List<Attendance> weeklyTimetable = attdb.getWeeklyTimetable(loggedAccount.getUserID(), startDate, endDate);

        ArrayList<Integer> slot_index = new ArrayList<>();
        for (int i = 0; i <= 7; i++) {
            slot_index.add(i);
        }
        request.setAttribute("slot_index", slot_index);

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());
        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());
        request.setAttribute("campus", campus);
        request.setAttribute("students", students);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.setAttribute("week_date", week_date);
        request.setAttribute("weeklyTimetable", weeklyTimetable);
        request.getRequestDispatcher("view/student/weeklytimetable.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {

    }

}
