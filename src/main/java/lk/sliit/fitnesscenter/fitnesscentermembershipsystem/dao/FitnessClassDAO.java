//package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;
//
//import java.io.*;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//import java.util.ArrayList;
//import java.util.List;
//import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FitnessClass;
//import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.YogaClass;
//import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.WeightTrainingClass;
//
//public class FitnessClassDAO {
//    private static final String FILE_PATH = System.getProperty("user.home") + "/Hansana/classes.txt";
//
//    // Add a new class
//    public boolean addClass(FitnessClass fitnessClass) {
//        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
//            String line = String.format("%s,%s,%s,%d,%s,%d,%s",
//                    fitnessClass.getClassId(),
//                    fitnessClass.getClassName(),
//                    fitnessClass.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
////                    fitnessClass.getDuration(),
//                    fitnessClass.getTrainerId(),
//                    fitnessClass.getMaxParticipants());
//
//            if (fitnessClass instanceof YogaClass) {
//                YogaClass gc = (YogaClass) fitnessClass;
//                line += String.format(",Yoga,%s", gc.getGroupType());
//            } else if (fitnessClass instanceof WeightTrainingClass) {
//                WeightTrainingClass wt = (WeightTrainingClass) fitnessClass;
//                line += String.format(",WeightTraining,%s", wt.getFocusArea());
//            }
//
//            writer.write(line);
//            writer.newLine();
//            return true;
//        } catch (IOException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//    // Get all classes
//    public List<FitnessClass> getAllClasses() {
//        List<FitnessClass> classes = new ArrayList<>();
//        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
//            String line;
//            while ((line = reader.readLine()) != null) {
//                String[] parts = line.split(",");
//                if (parts.length >= 7) {
//                    String classId = parts[0];
//                    String className = parts[1];
//                    LocalDateTime dateTime = LocalDateTime.parse(parts[2], DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
//                    int duration = Integer.parseInt(parts[3]);
//                    String trainerId = parts[4];
//                    int maxParticipants = Integer.parseInt(parts[5]);
//                    String description = parts[6];
//
//                    if (parts.length > 7 && parts[7].equals("Yoga")) {
//                        String groupType = parts[8];
//                        classes.add(new YogaClass(classId, className, dateTime, trainerId,
//                                maxParticipants,  groupType));
//                    } else if (parts.length > 7 && parts[7].equals("WeightTraining")) {
//                        String focusArea = parts[8];
//                        classes.add(new WeightTrainingClass(classId, className, dateTime, duration, trainerId,
//                                maxParticipants, description, focusArea));
//                    } else {
//                        classes.add(new FitnessClass(classId, className, dateTime,  trainerId,
//                                maxParticipants));
//                    }
//                }
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return classes;
//    }
//
//    // Get classes by trainer ID
//    public List<FitnessClass> getClassesByTrainer(String trainerId) {
//        List<FitnessClass> allClasses = getAllClasses();
//        List<FitnessClass> trainerClasses = new ArrayList<>();
//
//        for (FitnessClass fc : allClasses) {
//            if (fc.getTrainerId().equals(trainerId)) {
//                trainerClasses.add(fc);
//            }
//        }
//        return trainerClasses;
//    }
//
//    // Search classes by name, date or trainer
//    public List<FitnessClass> searchClasses(String query) {
//        List<FitnessClass> allClasses = getAllClasses();
//        List<FitnessClass> results = new ArrayList<>();
//
//        for (FitnessClass fc : allClasses) {
//            if (fc.getClassName().toLowerCase().contains(query.toLowerCase())) {
//                results.add(fc);
//            } else if (fc.getFormattedDateTime().toLowerCase().contains(query.toLowerCase())) {
//                results.add(fc);
//            } else if (fc.getTrainerId().toLowerCase().contains(query.toLowerCase())) {
//                results.add(fc);
//            }
//        }
//        return results;
//    }
//
//    // Update a class
//    public boolean updateClass(FitnessClass updatedClass) {
//        List<FitnessClass> classes = getAllClasses();
//        boolean found = false;
//
//        for (int i = 0; i < classes.size(); i++) {
//            if (classes.get(i).getClassId().equals(updatedClass.getClassId())) {
//                classes.set(i, updatedClass);
//                found = true;
//                break;
//            }
//        }
//
//        if (found) {
//            return saveAllClasses(classes);
//        }
//        return false;
//    }
//
//    // Delete a class
//    public boolean deleteClass(String classId) {
//        List<FitnessClass> classes = getAllClasses();
//        boolean removed = classes.removeIf(fc -> fc.getClassId().equals(classId));
//
//        if (removed) {
//            return saveAllClasses(classes);
//        }
//        return false;
//    }
//
//    // Helper method to save all classes to file
//    private boolean saveAllClasses(List<FitnessClass> classes) {
//        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
//            for (FitnessClass fc : classes) {
//                String line = String.format("%s,%s,%s,%d,%s,%d,%s",
//                        fc.getClassId(),
//                        fc.getClassName(),
//                        fc.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
//                        fc.getTrainerId(),
//                        fc.getMaxParticipants());
//
//                if (fc instanceof YogaClass) {
//                    YogaClass yc = (YogaClass) fc;
//                    line += String.format(",Yoga,%s", yc.getGroupType());
//                } else if (fc instanceof WeightTrainingClass) {
//                    WeightTrainingClass wt = (WeightTrainingClass) fc;
//                    line += String.format(",WeightTraining,%s", wt.getFocusArea());
//                }
//
//                writer.write(line);
//                writer.newLine();
//            }
//            return true;
//        } catch (IOException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//}



package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FitnessClass;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.YogaClass;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.WeightTrainingClass;

public class FitnessClassDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/Hansana/classes.txt";

    // Add a new class
    public boolean addClass(FitnessClass fitnessClass) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = String.format("%s,%s,%s,%s,%d",
                    fitnessClass.getClassId(),
                    fitnessClass.getClassName(),
                    fitnessClass.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                    fitnessClass.getTrainerId(),
                    fitnessClass.getMaxParticipants());

            if (fitnessClass instanceof YogaClass) {
                YogaClass gc = (YogaClass) fitnessClass;
                line += String.format(",Yoga,%s", gc.getGroupType());
            } else if (fitnessClass instanceof WeightTrainingClass) {
                WeightTrainingClass wt = (WeightTrainingClass) fitnessClass;
                line += String.format(",WeightTraining,%s", wt.getFocusArea());
            }

            writer.write(line);
            writer.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all classes
    public List<FitnessClass> getAllClasses() {
        List<FitnessClass> classes = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 5) {
                    String classId = parts[0];
                    String className = parts[1];
                    LocalDateTime dateTime = LocalDateTime.parse(parts[2], DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
                    String trainerId = parts[3];
                    int maxParticipants = Integer.parseInt(parts[4]);

                    if (parts.length > 6 && "Yoga".equals(parts[5])) {
                        String groupType = parts[6];
                        classes.add(new YogaClass(classId, className, dateTime, trainerId, maxParticipants, groupType));
                    } else if (parts.length > 6 && "WeightTraining".equals(parts[5])) {
                        String focusArea = parts[6];
                        classes.add(new WeightTrainingClass(classId, className, dateTime, trainerId, maxParticipants, focusArea));
                    } else {
                        classes.add(new FitnessClass(classId, className, dateTime, trainerId, maxParticipants));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return classes;
    }

    // Get classes by trainer ID
    public List<FitnessClass> getClassesByTrainer(String trainerId) {
        List<FitnessClass> allClasses = getAllClasses();
        List<FitnessClass> trainerClasses = new ArrayList<>();

        for (FitnessClass fc : allClasses) {
            if (fc.getTrainerId().equals(trainerId)) {
                trainerClasses.add(fc);
            }
        }
        return trainerClasses;
    }

    // Search classes by name, date or trainer
    public List<FitnessClass> searchClasses(String query) {
        List<FitnessClass> allClasses = getAllClasses();
        List<FitnessClass> results = new ArrayList<>();

        for (FitnessClass fc : allClasses) {
            if (fc.getClassName().toLowerCase().contains(query.toLowerCase())) {
                results.add(fc);
            } else if (fc.getFormattedDateTime().toLowerCase().contains(query.toLowerCase())) {
                results.add(fc);
            } else if (fc.getTrainerId().toLowerCase().contains(query.toLowerCase())) {
                results.add(fc);
            }
        }
        return results;
    }

    // Update a class
    public boolean updateClass(FitnessClass updatedClass) {
        List<FitnessClass> classes = getAllClasses();
        boolean found = false;

        for (int i = 0; i < classes.size(); i++) {
            if (classes.get(i).getClassId().equals(updatedClass.getClassId())) {
                classes.set(i, updatedClass);
                found = true;
                break;
            }
        }

        if (found) {
            return saveAllClasses(classes);
        }
        return false;
    }

    // Delete a class
    public boolean deleteClass(String classId) {
        List<FitnessClass> classes = getAllClasses();
        boolean removed = classes.removeIf(fc -> fc.getClassId().equals(classId));

        if (removed) {
            return saveAllClasses(classes);
        }
        return false;
    }

    // Helper method to save all classes to file
    private boolean saveAllClasses(List<FitnessClass> classes) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (FitnessClass fc : classes) {
                String line = String.format("%s,%s,%s,%s,%d",
                        fc.getClassId(),
                        fc.getClassName(),
                        fc.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                        fc.getTrainerId(),
                        fc.getMaxParticipants());

                if (fc instanceof YogaClass) {
                    YogaClass yc = (YogaClass) fc;
                    line += String.format(",Yoga,%s", yc.getGroupType());
                } else if (fc instanceof WeightTrainingClass) {
                    WeightTrainingClass wt = (WeightTrainingClass) fc;
                    line += String.format(",WeightTraining,%s", wt.getFocusArea());
                }

                writer.write(line);
                writer.newLine();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}