package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

public class Trainer {
    private String trainerId;
    private String name;
    private String email;
    private String contactNumber;
    private String specialty;
    private String password;

    public Trainer() {
    }

    public Trainer(String trainerId, String name, String email, String contactNumber, String specialty, String password) {
        this.trainerId = trainerId;
        this.name = name;
        this.email = email;
        this.contactNumber = contactNumber;
        this.specialty = specialty;
        this.password = password;
    }

    // Getters and Setters
    public String getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(String trainerId) {
        this.trainerId = trainerId;
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

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}