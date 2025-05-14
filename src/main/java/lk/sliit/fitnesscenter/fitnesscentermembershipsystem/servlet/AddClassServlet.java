package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.FitnessClassDAO;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.WeightTrainingClass;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.YogaClass;

@WebServlet(name = "AddClassServlet", value = "/AddClassServlet")
public class AddClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classId = request.getParameter("classId");
        String className = request.getParameter("className");
        String dateTimeStr = request.getParameter("dateTime");
        String trainerId = request.getParameter("trainerId");
        int maxParticipants = Integer.parseInt(request.getParameter("maxParticipants"));
        String classType = request.getParameter("classType");

        LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));

        FitnessClassDAO classDAO = new FitnessClassDAO();
        boolean success = false;

        if ("Yoga".equals(classType)) {
            String groupType = request.getParameter("groupType");
            YogaClass yogaClass = new YogaClass(classId, className, dateTime,
                    trainerId, maxParticipants,  groupType);
            success = classDAO.addClass(yogaClass);
        } else if ("WeightTraining".equals(classType)) {
            String focusArea = request.getParameter("focusArea");
            WeightTrainingClass WeightTraining = new WeightTrainingClass(classId, className, dateTime,
                    trainerId, maxParticipants,  focusArea);
            success = classDAO.addClass(WeightTraining);
        }

        if (success) {
            response.sendRedirect("manageClasses.jsp?success=Class added successfully");
        } else {
            response.sendRedirect("addClass.jsp?error=Failed to add class");
        }
    }
}