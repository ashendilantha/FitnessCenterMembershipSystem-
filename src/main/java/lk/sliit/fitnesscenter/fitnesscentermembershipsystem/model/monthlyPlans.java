package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

public class monthlyPlans {
    private String planId;
    private String planName;
    private String price;
    private String notes;

    public monthlyPlans(String planId, String planName, String price, String notes) {
        this.planId = planId;
        this.planName = planName;
        this.price = price;
        this.notes = notes;
    }

    public String getPlanId() {
        return planId;
    }

    public String getPlanName() {
        return planName;
    }

    public String getPrice() {
        return price;
    }

    public String getNotes() {
        return notes;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void display()
    {
        System.out.println("Plan ID: " + planId+"Plan Name: " + planName+"Plan Price: " + price+"Plan notes: " + notes);
    }
}
