package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FitnessClass {
    private String classId;
    private String className;
    private LocalDateTime dateTime;
    private String trainerId;
    private int maxParticipants;

    public FitnessClass() {
    }

    public FitnessClass(String classId, String className, LocalDateTime dateTime,
                        String trainerId, int maxParticipants) {
        this.classId = classId;
        this.className = className;
        this.dateTime = dateTime;
        this.trainerId = trainerId;
        this.maxParticipants = maxParticipants;
    }

    // Getters and Setters
    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }


    public String getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(String trainerId) {
        this.trainerId = trainerId;
    }

    public int getMaxParticipants() {
        return maxParticipants;
    }

    public void setMaxParticipants(int maxParticipants) {
        this.maxParticipants = maxParticipants;
    }


    public String getFormattedDateTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return dateTime.format(formatter);
    }

}
