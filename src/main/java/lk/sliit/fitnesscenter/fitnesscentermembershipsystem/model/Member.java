package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.time.LocalDate;
import java.util.UUID;

public class Member {
    private String memberId;
    private String name;
    private String email;
    private String password;
    private String membershipType;
    private String contactNumber;
    private LocalDate lastRenewalDate;
    private LocalDate lastPaymentDate;
    private boolean isAdmin = false;

    // Default constructor
    public Member(String memberId, String name, String email, String password, String membershipType, String contactNumber, LocalDate lastRenewalDate) {
        this.memberId = (memberId == null || memberId.isEmpty()) ? UUID.randomUUID().toString() : memberId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.membershipType = membershipType;
        this.contactNumber = contactNumber;
        this.lastRenewalDate = lastRenewalDate;
        this.lastPaymentDate = null;
        this.isAdmin = false;
    }

    // Parameterized constructor
    public Member(String memberId, String name, String email, String password,
                  String membershipType, String contactNumber,
                  LocalDate lastRenewalDate, LocalDate lastPaymentDate) {
        this.memberId = (memberId == null || memberId.isEmpty()) ? UUID.randomUUID().toString() : memberId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.membershipType = membershipType;
        this.contactNumber = contactNumber;
        this.lastRenewalDate = lastRenewalDate;
        this.lastPaymentDate = lastPaymentDate;
    }

    // Getters and Setters
    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = (memberId == null || memberId.isEmpty()) ? UUID.randomUUID().toString() : memberId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMembershipType() {
        return membershipType;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public LocalDate getLastRenewalDate() {
        return lastRenewalDate;
    }

    public void setLastRenewalDate(LocalDate lastRenewalDate) {
        this.lastRenewalDate = lastRenewalDate;
    }

    public LocalDate getLastPaymentDate() {
        return lastPaymentDate;
    }

    public void setLastPaymentDate(LocalDate lastPaymentDate) {
        this.lastPaymentDate = lastPaymentDate;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return memberId + "," + name + "," + email + "," + password + "," +
                membershipType + "," + contactNumber + "," +
                lastRenewalDate + "," + (lastPaymentDate != null ? lastPaymentDate : "");
    }
}