package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.monthlyPlanDAO;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.monthlyPlans;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/monthlyPlanServlet")
public class monthlyPlanServlet extends HttpServlet {
    private monthlyPlanDAO planDAO = new monthlyPlanDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if("addMonthlyplan".equals(action)) {
            addMonthlyplan(request, response);
        }
        else if("deleteMonthlyplan".equals(action)) {
            deleteMonthlyplan(request, response);
        }
        else if ("updateMonthlyplan".equals(action)) {
            updateMonthlyplan(request, response);
        }
        else if ("sortPlans".equals(action)) {
            planDAO.sortPlansUsingInsertionSort();
            session.setAttribute("message", "Plans sorted successfully by ID");
            response.sendRedirect("Monthly-plan-admin.jsp");
        }
    }



    //Add plans (Create)
    private void addMonthlyplan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("planId");
        String name = request.getParameter("planName");
        String price = request.getParameter("price");
        String note = request.getParameter("notes");

        if(id == null || name == null || price == null || note == null) {
            response.getWriter().println("All fields are required");
            return;
        }

        monthlyPlans plan = new monthlyPlans(id, name, price, note);
        planDAO.addMonthlyplan(plan);
        response.sendRedirect("Monthly-plan-admin.jsp");
    }





    //Delete plans (Delete)
    private void deleteMonthlyplan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idToDelete = request.getParameter("planId"); //Retrieves the plan ID
        File inputFile = new File(planDAO.getDataFilePath());
        File tempFile = new File(planDAO.getDirectoryPath() + "\\temp_monthly-plan.txt");

        List<String> lines = new ArrayList<>();

        //Read the file
        try(BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                if(!line.startsWith(idToDelete + ",")) {
                    lines.add(line);
                }
            }
        }

        // Write Filtered Data to Temp File
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for(String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }

        inputFile.delete();
        tempFile.renameTo(inputFile);
        response.sendRedirect("Monthly-plan-admin.jsp");
    }





    //Update plans (Update)
    private void updateMonthlyplan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String originalID = request.getParameter("originalID");
        String id = request.getParameter("planId");
        String name = request.getParameter("planName");
        String price = request.getParameter("price");
        String note = request.getParameter("notes");

        if(id == null || name == null || price == null || note == null) {
            response.getWriter().println("All fields are required");
            return;
        }

        monthlyPlans updatedPlan = new monthlyPlans(id, name, price, note);
        planDAO.updateMonthlyplan(originalID, updatedPlan);
        response.sendRedirect("Monthly-plan-admin.jsp");
    }
}