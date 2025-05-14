package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Review implements Serializable {
    private int reviewId;
    private int memberId;
    private String trainerId;
    private String classId;
    private int rating;
    private String comment;
    private LocalDate reviewDate;

//    public Review() {
//    }
//
//    public Review(int reviewId, int memberId, Integer trainerId, Integer classId, int rating, String comment, LocalDate reviewDate) {
//        this.reviewId = reviewId;
//        this.memberId = memberId;
//        this.trainerId = trainerId;
//        this.classId = classId;
//        this.rating = rating;
//        this.comment = comment;
//        this.reviewDate = reviewDate;
//    }
//
//    // Getters and Setters
//    public int getReviewId() {
//        return reviewId;
//    }
//
//    public void setReviewId(int reviewId) {
//        this.reviewId = reviewId;
//    }
//
//    public int getMemberId() {
//        return memberId;
//    }
//
//    public void setMemberId(int memberId) {
//        this.memberId = memberId;
//    }
//
//    public Integer getTrainerId() {
//        return trainerId;
//    }
//
//    public void setTrainerId(Integer trainerId) {
//        this.trainerId = trainerId;
//    }
//
//    public Integer getClassId() {
//        return classId;
//    }
//
//    public void setClassId(Integer classId) {
//        this.classId = classId;
//    }
//
//    public int getRating() {
//        return rating;
//    }
//
//    public void setRating(int rating) {
//        this.rating = rating;
//    }
//
//    public String getComment() {
//        return comment;
//    }
//
//    public void setComment(String comment) {
//        this.comment = comment;
//    }
//
//    public LocalDate getReviewDate() {
//        return reviewDate;
//    }
//
//    public void setReviewDate(LocalDate reviewDate) {
//        this.reviewDate = reviewDate;
//    }

    public Review() {
    }

    public Review(int reviewId, int memberId, String trainerId, String classId, int rating, String comment, LocalDate reviewDate) {
        this.reviewId = reviewId;
        this.memberId = memberId;
        this.trainerId = trainerId;
        this.classId = classId;
        setRating(rating);
        setComment(comment);
        this.reviewDate = reviewDate;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        if (reviewId < 0) {
            throw new IllegalArgumentException("Review ID cannot be negative");
        }
        this.reviewId = reviewId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        if (memberId <= 0) {
            throw new IllegalArgumentException("Member ID must be positive");
        }
        this.memberId = memberId;
    }

    public String getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(String trainerId) {
        this.trainerId = trainerId;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        if (rating < 1 || rating > 5) {
            throw new IllegalArgumentException("Rating must be between 1 and 5");
        }
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        if (comment != null && comment.length() < 5) {
            throw new IllegalArgumentException("Comment must be at least 5 characters long");
        }
        this.comment = comment;
    }

    public LocalDate getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDate reviewDate) {
        if (reviewDate == null) {
            throw new IllegalArgumentException("Review date cannot be null");
        }
        this.reviewDate = reviewDate;
    }
}