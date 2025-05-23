//package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;
//
//import java.time.LocalDateTime;
//
//public class CreditCardPayment extends Payment {
//    private String cardNumber;
//    private String cardHolderName;
//    private String expiryDate;
//    private String cvv;
//
//    public CreditCardPayment(int paymentId, int memberId, String planId, String classId, double amount, LocalDateTime paymentDate, String description, String cardNumber, String cardHolderName, String expiryDate, String cvv) {
//        super();
//        super.setPaymentMethod("Credit Card");
//    }
//
//    public CreditCardPayment(int paymentId, int memberId, String planId, String classId,
//                             double amount, LocalDateTime paymentDate, String description,
//                             String cardNumber, String cardHolderName, String expiryDate, String cvv) {
//        super(paymentId, memberId, planId, classId, amount, paymentDate, description, "Credit Card");
//        this.cardNumber = cardNumber;
//        this.cardHolderName = cardHolderName;
//        this.expiryDate = expiryDate;
//        this.cvv = cvv;
//    }
//
//    // Getters and Setters
//    public String getCardNumber() {
//        return cardNumber;
//    }
//
//    public void setCardNumber(String cardNumber) {
//        this.cardNumber = cardNumber;
//    }
//
//    public String getCardHolderName() {
//        return cardHolderName;
//    }
//
//    public void setCardHolderName(String cardHolderName) {
//        this.cardHolderName = cardHolderName;
//    }
//
//    public String getExpiryDate() {
//        return expiryDate;
//    }
//
//    public void setExpiryDate(String expiryDate) {
//        this.expiryDate = expiryDate;
//    }
//
//    public String getCvv() {
//        return cvv;
//    }
//
//    public void setCvv(String cvv) {
//        this.cvv = cvv;
//    }
//
//    @Override
//    public String toString() {
//        return super.toString() + "," + cardNumber + "," + cardHolderName + "," + expiryDate + "," + cvv;
//    }
//}


package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDateTime;

public class CreditCardPayment extends Payment {
    private String cardNumber;
    private String cardHolderName;
    private String expiryDate;
    private String cvv;

    public CreditCardPayment(int paymentId, int memberId, String planId, String classId, double amount, LocalDateTime paymentDate, String description, String cardNumber, String cardHolderName, String expiryDate, String cvv) {
        super(paymentId, memberId, planId, classId, amount, paymentDate, description, "Credit Card");
        this.cardNumber = cardNumber;
        this.cardHolderName = cardHolderName;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
    }

    // Getters and Setters
    public String getCardNumber() { return cardNumber; }
    public void setCardNumber(String cardNumber) { this.cardNumber = cardNumber; }

    public String getCardHolderName() { return cardHolderName; }
    public void setCardHolderName(String cardHolderName) { this.cardHolderName = cardHolderName; }

    public String getExpiryDate() { return expiryDate; }
    public void setExpiryDate(String expiryDate) { this.expiryDate = expiryDate; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }

    @Override
    public String toString() {
        return super.toString() + "," + cardNumber + "," + cardHolderName + "," + expiryDate + "," + cvv;
    }
}