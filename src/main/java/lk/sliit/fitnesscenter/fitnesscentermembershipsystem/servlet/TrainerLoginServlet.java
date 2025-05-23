package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrainerLoginServlet", value = "/TrainerLoginServlet")
public class TrainerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainerId = request.getParameter("trainerId");
        String password = request.getParameter("password");

        TrainerDAO trainerDAO = new TrainerDAO();
        List<Trainer> trainers = trainerDAO.getAllTrainers();

        Trainer authenticatedTrainer = null;
        for (Trainer trainer : trainers) {
            if (trainer.getTrainerId().equals(trainerId) && trainer.getPassword().equals(password)) {
                authenticatedTrainer = trainer;
                break;
            }
        }

        if (authenticatedTrainer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("trainer", authenticatedTrainer);
            response.sendRedirect("trainerProfile.jsp");
        } else {
            request.setAttribute("error", "Invalid Trainer ID or Password");
            request.getRequestDispatcher("loginTrainer.jsp").forward(request, response);
        }
    }
}