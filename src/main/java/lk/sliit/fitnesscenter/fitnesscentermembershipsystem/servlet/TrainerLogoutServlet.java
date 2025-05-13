package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TrainerLogoutServlet", value = "/TrainerLogoutServlet")
public class TrainerLogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("loginTrainer.jsp");
    }
}