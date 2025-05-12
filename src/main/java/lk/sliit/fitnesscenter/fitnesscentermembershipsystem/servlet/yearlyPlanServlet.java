package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/yearlyPlanServlet")
public class yearlyPlanServlet extends HttpServlet {
//    private static final String DIRECTORY = "C:\\Users\\yuthi\\Desktop\\Add Member plans\\Plan.info";
//    private static final String DATA_FILE = DIRECTORY +"\\yearly-plan.txt";

    private static final String DIRECTORY = System.getProperty("user.home") + "/Hansana";
    private static final String DATA_FILE = DIRECTORY + "/yearly-plan.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if("addYearlyplan".equals(action)) {
            addYearlyplan(request,response);
        }
        else if("deleteYearlyplan".equals(action)) {
            deleteYearlyplan(request,response);
        } else if ("updateYearlyplan".equals(action)) {
            updateYearlyplan(request,response);
        }
    }

    private void addYearlyplan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("planId");
        String name = request.getParameter("planName");
        String price = request.getParameter("price");
        String addons = request.getParameter("addons");
        String subTotal = request.getParameter("subTotal");
        String discount = request.getParameter("discount");
        String finalPrice = request.getParameter("finalPrice");

        if(id == null || name == null || price == null || addons == null|| subTotal == null|| discount == null||finalPrice == null) {
            response.getWriter().println("All fields are required");
            return;
        }

        // Create directory if it doesn't exist
        new File(DIRECTORY).mkdirs();

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(DATA_FILE,true))) {
            writer.write(id + "," + name + "," + price + "," + addons + "," + subTotal + "," + discount + "," + finalPrice);
            writer.newLine();
        }
        response.sendRedirect("Yearly-plan-admin.jsp");
    }

    private void deleteYearlyplan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idToDelete = request.getParameter("planId");

        File inputFile = new File(DATA_FILE);
        File tempFile = new File(DIRECTORY + "\\temp_monthly-plan.txt");

        List<String> lines = new ArrayList<>();

        try(BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                if(!line.startsWith(idToDelete + ",")) {
                    lines.add(line);
                }
            }
        }

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for(String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }

        inputFile.delete();
        tempFile.renameTo(inputFile);
        response.sendRedirect("Yearly-plan-admin.jsp");
    }

    private void updateYearlyplan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String originalID = request.getParameter("originalID");
        String id = request.getParameter("planId");
        String name = request.getParameter("planName");
        String price = request.getParameter("price");
        String addons = request.getParameter("addons");
        String subTotal = request.getParameter("subTotal");
        String discount = request.getParameter("discount");
        String finalPrice = request.getParameter("finalPrice");

        if(id == null || name == null || price == null || addons == null || subTotal == null|| discount == null||finalPrice == null) {
            response.getWriter().println("All fields are required");
            return;
        }

        File inputFile = new File(DATA_FILE);
        File tempFile = new File(DIRECTORY + "\\temp_monthly-plan.txt");

        List<String> lines = new ArrayList<>();

        try(BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                if(line.startsWith(originalID + ",")) {
                    line = id + "," + name + "," + price + "," +addons+ "," +subTotal + "," +discount + "," +finalPrice;

                }

                lines.add(line);


            }
        }

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for(String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }

        inputFile.delete();
        tempFile.renameTo(inputFile);
        response.sendRedirect("Yearly-plan-admin.jsp");
    }


}
