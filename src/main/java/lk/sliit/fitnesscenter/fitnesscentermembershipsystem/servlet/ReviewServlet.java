package lk.sliit.fitnesscenter.fitnesscentermembershipsystem.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.ReviewDAO;
import lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Review;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "ReviewServlet", value = "/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    private ReviewDAO reviewDAO = new ReviewDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int memberId = Integer.parseInt(request.getParameter("memberId"));

            String trainerId = request.getParameter("trainerId");
            if (trainerId != null && trainerId.isEmpty()) trainerId = null;

            String classId = request.getParameter("classId");
            if (classId != null && classId.isEmpty()) classId = null;

            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");


            Review review = new Review(0, memberId, trainerId, classId, rating, comment, LocalDate.now());
            reviewDAO.addReview(review);

            response.sendRedirect("memberProfile.jsp?success=added");
        } else if ("update".equals(action)) {
            int reviewId = Integer.parseInt(request.getParameter("reviewId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            List<Review> reviews = reviewDAO.getAllReviews();
            for (Review review : reviews) {
                if (review.getReviewId() == reviewId) {
                    review.setRating(rating);
                    review.setComment(comment);
                    reviewDAO.updateReview(review);
                    break;
                }
            }

            response.sendRedirect("adminReviews.jsp?success=updated");
        } else if ("delete".equals(action)) {
            int reviewId = Integer.parseInt(request.getParameter("reviewId"));
            reviewDAO.deleteReview(reviewId);

            response.sendRedirect("adminReviews.jsp?success=deleted");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String id = request.getParameter("id");

        if (type != null && id != null) {
            List<Review> reviews;
            if ("class".equals(type)) {
                reviews = reviewDAO.getReviewsByClass(id);
            } else if ("trainer".equals(type)) {
                reviews = reviewDAO.getReviewsByTrainer(id);
            } else {
                reviews = reviewDAO.getAllReviews();
            }
            request.setAttribute("reviews", reviews);
        } else {
            request.setAttribute("reviews", reviewDAO.getAllReviews());
        }

        request.getRequestDispatcher("adminReviews.jsp").forward(request, response);
    }
}