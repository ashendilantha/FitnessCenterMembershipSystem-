
package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDateTime;

public class YogaClass extends FitnessClass {
    private String groupType;

    public YogaClass(String classId, String className, LocalDateTime dateTime, String trainerId, int maxParticipants, String groupType) {
        super(classId, className, dateTime, trainerId, maxParticipants);
        this.groupType = groupType;
    }

    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }
}