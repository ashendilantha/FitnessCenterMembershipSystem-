package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO;

import java.io.IOException;

@WebServlet(name = "DeleteTrainerServlet", value = "/DeleteTrainerServlet")
public class DeleteTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainerId = request.getParameter("trainerId");

        TrainerDAO trainerDAO = new TrainerDAO();
        boolean success = trainerDAO.deleteTrainer(trainerId);

        if (success) {
            request.setAttribute("message", "Trainer deleted successfully!");
        } else {
            request.setAttribute("message", "Failed to delete trainer. Please try again.");
        }

        request.getRequestDispatcher("trainerList.jsp").forward(request, response);
    }
}