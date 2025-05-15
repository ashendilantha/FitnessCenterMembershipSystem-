package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FullTimeTrainer;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.PartTimeTrainer;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.LinkedList;

public class TrainerDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/Hansana/trainer.txt";
    private Queue<Trainer> trainerQueue = new LinkedList<>();

    public TrainerDAO() {
        File directory = new File(System.getProperty("user.home") + "/Hansana");
        if (!directory.exists()) {
            directory.mkdirs();
        }
        loadTrainersFromFile();
    }




    // Add trainer (Create)
    public boolean addTrainer(Trainer trainer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = String.format("%s,%s,%s,%s,%s,%s",
                    trainer.getTrainerId(), trainer.getName(), trainer.getEmail(),
                    trainer.getContactNumber(), trainer.getSpecialty(), trainer.getPassword());
            writer.write(line); //Write trainer data to file
            writer.newLine(); //Move next line
            trainerQueue.add(trainer); // Add to queue for processing
            return true;
        } catch (IOException e) {
            e.printStackTrace();  //Error handling
            return false;
        }
    }





    // Get all trainers (Read)
    public List<Trainer> getAllTrainers() {
        List<Trainer> trainers = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            // Read each line from the file
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) { //Check minimum
                    String trainerId = parts[0];
                    String name = parts[1];
                    String email = parts[2];
                    String contactNumber = parts[3];
                    String specialty = parts[4];
                    String password = parts[5];

                    //Full-time trainer
                    if (parts.length > 6 && parts[6].equals("FULLTIME")) {
                        double salary = Double.parseDouble(parts[7]);
//                        int workingHours = Integer.parseInt(parts[8]);
                        trainers.add(new FullTimeTrainer(trainerId, name, email, contactNumber, specialty, password, salary));
                    }
                    //Part-time trainer
                    else if (parts.length > 6 && parts[6].equals("PARTTIME")) {
//                        double hourlyRate = Double.parseDouble(parts[7]);
//                        int hoursPerWeek = Integer.parseInt(parts[8]);
                        trainers.add(new PartTimeTrainer(trainerId, name, email, contactNumber, specialty, password));
                    } else {
                        trainers.add(new Trainer(trainerId, name, email, contactNumber, specialty, password));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Sort trainers by ID using insertion sort
        insertionSortTrainers(trainers);

        return trainers;
    }



    // Search trainers by name or specialty
//    public List<Trainer> searchTrainers(String query) {
//        List<Trainer> allTrainers = getAllTrainers();
//        List<Trainer> results = new ArrayList<>();
//
//        for (Trainer trainer : allTrainers) {
//            if (trainer.getName().toLowerCase().contains(query.toLowerCase())) {
//                results.add(trainer);
//            } else if (trainer.getSpecialty().toLowerCase().contains(query.toLowerCase())) {
//                results.add(trainer);
//            }
//        }
//
//        return results;
//    }





    // Update trainer
    public boolean updateTrainer(Trainer updatedTrainer) {
        List<Trainer> trainers = getAllTrainers();
        boolean found = false;

        // Find the trainer to update
        for (int i = 0; i < trainers.size(); i++) {
            if (trainers.get(i).getTrainerId().equals(updatedTrainer.getTrainerId())) {
                trainers.set(i, updatedTrainer); //Replace old trainer data
                found = true;
                break; //Exit loop after update
            }
        }

        if (found) {
            return saveAllTrainers(trainers); //Write updated list
        }
        return false; //Return false if trainer not found
    }





    // Delete trainer
    public boolean deleteTrainer(String trainerId) {
        List<Trainer> trainers = getAllTrainers();

        //Remove trainer with matching ID
        boolean removed = trainers.removeIf(trainer -> trainer.getTrainerId().equals(trainerId));

        //Save updated list after delete trainer
        if (removed) {
            return saveAllTrainers(trainers);
        }
        return false; //Return false if trainer not found
    }




    // Helper method to save all trainers to file
    private boolean saveAllTrainers(List<Trainer> trainers) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Trainer trainer : trainers) {
                String line = String.format("%s,%s,%s,%s,%s,%s",
                        trainer.getTrainerId(), trainer.getName(), trainer.getEmail(),
                        trainer.getContactNumber(), trainer.getSpecialty(), trainer.getPassword());


                writer.write(line);
                writer.newLine();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }





    // Insertion sort for trainers by ID
    private void insertionSortTrainers(List<Trainer> trainers) {
        for (int i = 1; i < trainers.size(); i++) {
            Trainer key = trainers.get(i);
            int j = i - 1;

            while (j >= 0 && trainers.get(j).getTrainerId().compareTo(key.getTrainerId()) > 0) {
                trainers.set(j + 1, trainers.get(j));
                j = j - 1;
            }
            trainers.set(j + 1, key);
        }
    }





    // Process trainers from queue (FIFO)
    public Trainer processNextTrainer() {
        return trainerQueue.poll();
    }

    private void loadTrainersFromFile() {
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    String trainerId = parts[0];
                    String name = parts[1];
                    String email = parts[2];
                    String contactNumber = parts[3];
                    String specialty = parts[4];
                    String password = parts[5];

                    if (parts.length > 6 && parts[6].equals("FULLTIME")) {
                        double salary = Double.parseDouble(parts[7]);
                        int workingHours = Integer.parseInt(parts[8]);
                        trainerQueue.add(new FullTimeTrainer(trainerId, name, email, contactNumber, specialty, password, salary));
                    } else if (parts.length > 6 && parts[6].equals("PARTTIME")) {
                        double hourlyRate = Double.parseDouble(parts[7]);
                        int hoursPerWeek = Integer.parseInt(parts[8]);
                        trainerQueue.add(new PartTimeTrainer(trainerId, name, email, contactNumber, specialty, password));
                    } else {
                        trainerQueue.add(new Trainer(trainerId, name, email, contactNumber, specialty, password));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}