package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDateTime;

public class CashPayment extends Payment {
    private String receiptNumber;

    public CashPayment() {
        super();
        super.setPaymentMethod("Cash");
    }

    public CashPayment(int paymentId, int memberId, int planId, String classId,
                       double amount, LocalDateTime paymentDate, String description,
                       String receiptNumber) {
        super(paymentId, memberId, planId, classId, amount, paymentDate, description, "Cash");
        this.receiptNumber = receiptNumber;
    }

    // Getters and Setters
    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    @Override
    public String toString() {
        return super.toString() + "," + receiptNumber;
    }
}