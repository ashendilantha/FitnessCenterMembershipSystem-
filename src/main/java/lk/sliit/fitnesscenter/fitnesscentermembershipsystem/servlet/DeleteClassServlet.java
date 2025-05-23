package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.FitnessClassDAO;

import java.io.IOException;

@WebServlet(name = "DeleteClassServlet", value = "/DeleteClassServlet")
public class DeleteClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classId = request.getParameter("classId");

        FitnessClassDAO classDAO = new FitnessClassDAO();
        boolean success = classDAO.deleteClass(classId);

        if (success) {
            response.sendRedirect("manageClasses.jsp?success=Class deleted successfully");
        } else {
            response.sendRedirect("manageClasses.jsp?error=Failed to delete class");
        }
    }
}