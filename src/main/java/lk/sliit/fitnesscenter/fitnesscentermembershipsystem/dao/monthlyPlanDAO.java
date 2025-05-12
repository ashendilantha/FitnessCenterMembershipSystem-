package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;

import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.monthlyPlans;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class monthlyPlanDAO {
    private List<monthlyPlans> monthlyPlanList;
//    private static final String DIRECTORY = "C:\\Users\\yuthi\\Desktop\\Add Member plans\\Plan.info";
//    private static final String DATA_FILE = DIRECTORY + "\\monthly-plan.txt";

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

    public void addMonthlyplan(monthlyPlans monthlyPlan) {
        monthlyPlanList.add(monthlyPlan);
        savemonthlyPlanFile(monthlyPlan);
    }

    private void savemonthlyPlanFile(monthlyPlans monthlyPlan) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(DATA_FILE, true))) {
            writer.write(monthlyPlan.getPlanId() + "," + monthlyPlan.getPlanName() + "," +
                    monthlyPlan.getPrice() + "," + monthlyPlan.getNotes());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void loadMonthlyPlans() {
        File file = new File(DATA_FILE);
        if (!file.exists()) return;

        try(BufferedReader reader = new BufferedReader(new FileReader(DATA_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if(data.length == 4) {
                    monthlyPlanList.add(new monthlyPlans(data[0], data[1], data[2], data[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<monthlyPlans> getMonthlyPlans() {
        return monthlyPlanList;
    }

    public void updateMonthlyplan(String originalID, monthlyPlans UpdatedMonthlyPlan) {
        for (int i = 0; i < monthlyPlanList.size(); i++) {
            if(monthlyPlanList.get(i).getPlanId().equals(originalID)) {
                monthlyPlanList.set(i, UpdatedMonthlyPlan);
                saveAllmonthlyPlans();

            }
        }
    }

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
}