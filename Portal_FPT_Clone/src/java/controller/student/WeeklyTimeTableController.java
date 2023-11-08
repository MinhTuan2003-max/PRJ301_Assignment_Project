/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.BaseRequiredAuthenticationController;
import dal.AttendanceDBContext;
import dal.CampusDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Attendance;
import entity.Campus;
import entity.Student;
import entity.TimeSlot;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

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

        ArrayList<Date> dates = new ArrayList<>();

        if (startDateStr == null) {
            dates = DateTimeHelper.getCurrentWeekDates();
        } else {
            try {
                dates = DateTimeHelper.getSqlDatesInRange(startDateStr, endDateStr);
            } catch (ParseException ex) {
                Logger.getLogger(WeeklyTimeTableController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        AttendanceDBContext attdb = new AttendanceDBContext();
        List<Attendance> weeklyTimetable = attdb.getWeeklyTimetable(loggedAccount.getUserID(), dates.get(0), dates.get(dates.size() - 1));

        TimeSlotDBContext tsdbc = new TimeSlotDBContext();
        ArrayList<TimeSlot> timeSlots = tsdbc.getTimeSlot();

        CampusDBContext cdb = new CampusDBContext();
        ArrayList<Campus> campus = cdb.search(loggedAccount.getUserID());

        StudentDBContext studb = new StudentDBContext();
        Student students = studb.getStudent(loggedAccount.getUserID());

        request.setAttribute("campus", campus);
        request.setAttribute("students", students);
        request.setAttribute("timeslot", timeSlots);
        request.setAttribute("startDate", dates.get(0));
        request.setAttribute("endDate", dates.get(dates.size() - 1));
        request.setAttribute("week_date", dates);
        request.setAttribute("weeklyTimetable", weeklyTimetable);
        request.getRequestDispatcher("view/student/weeklytimetable.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account loggedAccount)
            throws ServletException, IOException {

    }

}
