package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;

import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.monthlyPlans;

import java.io.*;
import java.util.*;

public class monthlyPlanDAO {
    private List<monthlyPlans> monthlyPlanList;
    private static final String DIRECTORY = System.getProperty("user.home") + "/Hansana";
    private static final String DATA_FILE = DIRECTORY + "/monthly-plan.txt";

    public monthlyPlanDAO() {
        monthlyPlanList = new ArrayList<>();
        ensureDirectoryExists();
        loadMonthlyPlans();
    }

    private void ensureDirectoryExists() {
        File dir = new File(DIRECTORY);
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }




    // Add monthly plan to an ArrayList(Create)
    public void addMonthlyplan(monthlyPlans monthlyPlan) {
        monthlyPlanList.add(monthlyPlan);
        savemonthlyPlanFile(monthlyPlan);
    }

    private void savemonthlyPlanFile(monthlyPlans monthlyPlan) {
        //Adds a new plan to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(DATA_FILE, true))) {

            //Write plan details
            writer.write(monthlyPlan.getPlanId() + "," + monthlyPlan.getPlanName() + "," +
                    monthlyPlan.getPrice() + "," + monthlyPlan.getNotes());
            //Move next Line
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace(); //Error handling
        }
    }



    //Read monthly plans from the file (Read)
    private void loadMonthlyPlans() {
        File file = new File(DATA_FILE);
        if (!file.exists()) return; //Exit if file doesn't exist

        try(BufferedReader reader = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            //Read file line by line
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if(data.length == 4) {
                    //Create a new monthly plan object and add it to the list
                    monthlyPlans plan = new monthlyPlans(data[0], data[1], data[2], data[3]);
                    monthlyPlanList.add(plan);
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); //Error handling
        }
    }


//    public List<monthlyPlans> getMonthlyPlans() {
//        return monthlyPlanList;
//    }






    //Update monthly plan (Update)
    public void updateMonthlyplan(String originalID, monthlyPlans UpdatedMonthlyPlan) {
        for (int i = 0; i < monthlyPlanList.size(); i++) {
            //Check if current plan ID matches the original ID
            if(monthlyPlanList.get(i).getPlanId().equals(originalID)) {
                //Replace updated plan
                monthlyPlanList.set(i, UpdatedMonthlyPlan);
                saveAllmonthlyPlans();
                break;
            }
        }
    }

    //Delete plans contains in the monthlyPlanServlet file

    private void saveAllmonthlyPlans() {
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(DATA_FILE))) {
            for (monthlyPlans monthlyPlan : monthlyPlanList) {
                writer.write(monthlyPlan.getPlanId() + "," + monthlyPlan.getPlanName() + "," +
                        monthlyPlan.getPrice() + "," + monthlyPlan.getNotes());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Insertion Sort Implementation
    public void sortPlansUsingInsertionSort() {
        for (int i = 1; i < monthlyPlanList.size(); i++) {
            monthlyPlans key = monthlyPlanList.get(i);
            int j = i - 1;

            while (j >= 0 && monthlyPlanList.get(j).compareTo(key) > 0) {
                monthlyPlanList.set(j + 1, monthlyPlanList.get(j));
                j = j - 1;
            }
            monthlyPlanList.set(j + 1, key);
        }
        saveAllmonthlyPlans();
    }

    // Add these getter methods for data file paths
    public String getDataFilePath() {
        return DATA_FILE;
    }

    public String getDirectoryPath() {
        return DIRECTORY;
    }
}
