package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FullTimeTrainer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.PartTimeTrainer;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateTrainerServlet", value = "/UpdateTrainerServlet")
public class UpdateTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainerId = request.getParameter("trainerId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String specialty = request.getParameter("specialty");
        String password = request.getParameter("password");

        TrainerDAO trainerDAO = new TrainerDAO();
        List<Trainer> trainers = trainerDAO.getAllTrainers();
        Trainer trainerToUpdate = null;

        // Find the trainer to update
        for (Trainer trainer : trainers) {
            if (trainer.getTrainerId().equals(trainerId)) {
                trainerToUpdate = trainer;
                break;
            }
        }

        if (trainerToUpdate != null) {
            trainerToUpdate.setName(name);
            trainerToUpdate.setEmail(email);
            trainerToUpdate.setContactNumber(contactNumber);
            trainerToUpdate.setSpecialty(specialty);
            trainerToUpdate.setPassword(password);

            // Handle FullTime/PartTime specific fields
            try {
                boolean success = trainerDAO.updateTrainer(trainerToUpdate);

                if (success) {
                    request.setAttribute("message", "Trainer updated successfully!");
                } else {
                    request.setAttribute("message", "Failed to update trainer. Please try again.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid number format for salary, working hours, hourly rate, or hours per week.");
            } catch (IllegalArgumentException e) {
                request.setAttribute("message", e.getMessage());
            } catch (Exception e) {
                request.setAttribute("message", "An error occurred: " + e.getMessage());
            }
        } else {
            request.setAttribute("message", "Trainer not found!");
        }

        request.getRequestDispatcher("loginTrainer.jsp").forward(request, response);
    }
}