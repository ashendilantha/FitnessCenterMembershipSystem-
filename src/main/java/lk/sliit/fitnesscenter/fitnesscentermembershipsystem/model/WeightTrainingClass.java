package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDateTime;

public class WeightTrainingClass extends FitnessClass {
    private String focusArea;

    public WeightTrainingClass(String classId, String className, LocalDateTime dateTime, String trainerId, int maxParticipants, String focusArea) {
        super(classId, className, dateTime, trainerId, maxParticipants);
        this.focusArea = focusArea;
    }

    public String getFocusArea() {
        return focusArea;
    }

    public void setFocusArea(String focusArea) {
        this.focusArea = focusArea;
    }
}