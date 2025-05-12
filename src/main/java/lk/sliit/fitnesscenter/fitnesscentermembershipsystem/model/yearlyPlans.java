package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

public class yearlyPlans extends monthlyPlans {

    private String addons;
    private String subTotal;
    private String discont;
    private String finalPrice;

    public yearlyPlans(String planId, String planName, String price, String notes, String addons, String subTotal, String datum) {
        super(planId, planName, price, notes);
        this.addons = addons;
        this.subTotal = subTotal;
        this.discont = discont;
        this.finalPrice = finalPrice;
    }

    public String getAddons() {
        return addons;
    }

    public String getSunbTotal() {
        return subTotal;
    }

    public String getDiscont() {
        return discont;
    }

    public String getFinalPrice() {
        return finalPrice;
    }
}
