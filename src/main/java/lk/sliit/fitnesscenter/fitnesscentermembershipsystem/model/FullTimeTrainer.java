package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

public class FullTimeTrainer extends Trainer {
    private double salary;

    public FullTimeTrainer() {
    }

    public FullTimeTrainer(String trainerId, String name, String email, String contactNumber, String specialty, String password, double salary) {
        super(trainerId, name, email, contactNumber, specialty, password);
        this.salary = salary;
    }

    // Getters and Setters
    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}