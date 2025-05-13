package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDateTime;

public class Payment {
    private int paymentId;
    private int memberId;
    private int planId;
    private String classId;
    private double amount;
    private LocalDateTime paymentDate;
    private String description;
    private String paymentMethod;

    public Payment() {
    }

    public Payment(int paymentId, int memberId, int planId, String classId, double amount,
                   LocalDateTime paymentDate, String description, String paymentMethod) {
        this.paymentId = paymentId;
        this.memberId = memberId;
        this.planId = planId;
        this.classId = classId;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.description = description;
        this.paymentMethod = paymentMethod;
    }

    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return paymentId + "," + memberId + "," + planId + "," + classId + "," +
                amount + "," + paymentDate + "," + description + "," + paymentMethod;
    }
}