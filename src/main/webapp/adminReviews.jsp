<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.ReviewDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Moderation | Pulse Gym</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:600,700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #15171b;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
        }
        .navbar {
            background: #181c23 !important;
            border-bottom: 2px solid #1e7a53;
            padding: 12px 0;
        }
        .navbar-brand {
            font-family: 'Oswald', sans-serif;
            font-size: 2.2rem;
            color: #1e7a53 !important;
            transition: color 0.3s ease;
        }
        .navbar-brand:hover {
            color: #27ef8c !important;
        }
        .nav-link {
            color: #e0e0e0 !important;
            font-weight: 500;
            margin: 0 12px;
            position: relative;
            padding: 5px 0 !important;
            transition: color 0.3s ease;
        }
        .nav-link:before {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #27ef8c;
            visibility: hidden;
            transition: all 0.3s ease-in-out;
        }
        .nav-link:hover:before, .nav-link.active:before {
            visibility: visible;
            width: 100%;
        }
        .nav-link:hover, .nav-link.active {
            color: #27ef8c !important;
        }
        .main-container {
            max-width: 1100px;
            margin: 80px auto 40px auto;
            background: #1a1d22;
            border-radius: 1.2rem;
            box-shadow: 0 8px 32px rgba(30, 122, 83, 0.15);
            padding: 40px 32px;
            animation: fadeIn 0.8s ease-out;
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            font-size: 2.5rem;
            margin-bottom: 16px;
            text-align: center;
            letter-spacing: 1px;
        }
        .review-card {
            background: #181c23;
            border-radius: 1rem;
            margin-bottom: 28px;
            box-shadow: 0 4px 16px rgba(30, 122, 83, 0.10);
            border-left: 6px solid #1e7a53;
            transition: box-shadow 0.3s, border-color 0.3s;
        }
        .review-card.flagged {
            border-left: 6px solid #e63946;
            background: #2d1a1a;
        }
        .review-card .card-body {
            padding: 1.5rem 2rem;
        }
        .review-card .review-meta {
            font-size: 0.99rem;
            color: #bdbdbd;
        }
        .star-rating {
            color: #ffc107;
            font-size: 1.25rem;
        }
        .btn-edit {
            background: #1e7a53;
            color: #fff;
            border: none;
            font-weight: 600;
            border-radius: 0.6rem;
            padding: 8px 20px;
            margin-right: 8px;
            transition: background 0.3s, color 0.3s;
        }
        .btn-edit:hover {
            background: #27a1ff;
            color: #fff;
        }
        .btn-danger {
            background: #e63946;
            color: #fff;
            border: none;
            font-weight: 600;
            border-radius: 0.6rem;
            padding: 8px 20px;
            transition: background 0.3s, color 0.3s;
        }
        .btn-danger:hover {
            background: #c82333;
            color: #fff;
        }
        .flag-label {
            color: #e63946;
            font-weight: bold;
            font-size: 0.95rem;
            margin-left: 10px;
        }
        .icon {
            font-size: 1.8rem;
            vertical-align: middle;
            margin-right: 10px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @media (max-width: 800px) {
            .main-container {
                padding: 20px 5vw;
            }
            .review-card .card-body {
                padding: 1rem 0.7rem;
            }
        }
        @media (max-width: 500px) {
            h2 { font-size: 1.5rem; }
            .main-container { padding: 12px 2vw; }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp" aria-label="Pulse Gym Home">Pulse Gym</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link active" href="adminReviews.jsp">Review Moderation</a></li>
                <li class="nav-item"><a class="nav-link" href="MemberLogoutServlet">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-container" aria-labelledby="review-moderation-heading">
    <div class="mb-4">
        <h2 id="review-moderation-heading"><i class="fas fa-comment-slash icon"></i>Review Moderation Panel</h2>
        <p class="text-center text-muted">Manage and moderate member reviews</p>
    </div>
    <% if (request.getParameter("success") != null) {
        String action = request.getParameter("success");
    %>
    <div class="alert alert-success text-center mb-4">
        <% if ("deleted".equals(action)) { %>
        Review deleted successfully!
        <% } else if ("updated".equals(action)) { %>
        Review updated successfully!
        <% } %>
    </div>
    <% } %>

    <%
        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviews = reviewDAO.getAllReviews();
        if (reviews != null && !reviews.isEmpty()) {
            for (Review review : reviews) {
                boolean isFlagged = review.getComment() != null &&
                        (review.getComment().toLowerCase().contains("bad") ||
                                review.getRating() < 2);
    %>
    <div class="card review-card<%= isFlagged ? " flagged" : "" %>">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <span class="review-meta">
                    <strong>Review ID:</strong> <%= review.getReviewId() %> &nbsp;|&nbsp;
                    <strong>Member:</strong> #<%= review.getMemberId() %> &nbsp;|&nbsp;
                    <strong>Trainer:</strong> <%= review.getTrainerId() != null ? "#" + review.getTrainerId() : "N/A" %> &nbsp;|&nbsp;
                    <strong>Class:</strong> <%= review.getClassId() != null ? "#" + review.getClassId() : "N/A" %>
                    <% if (isFlagged) { %>
                        <span class="flag-label"><i class="fas fa-flag"></i> Flagged</span>
                    <% } %>
                </span>
                <span class="star-rating">
                    <% for (int i = 1; i <= 5; i++) { %>
                        <i class="fas fa-star<%= i <= review.getRating() ? "" : "-o" %>"></i>
                    <% } %>
                </span>
            </div>
            <div class="mb-2" style="color: white">
                <strong>Comment:</strong>
                <span><%= review.getComment() != null ? review.getComment() : "No comment" %></span>
            </div>
            <div class="mb-3">
                <span class="review-meta"><i class="far fa-calendar-alt"></i> <%= review.getReviewDate() %></span>
            </div>
            <div>
                <a href="editReview.jsp?reviewId=<%= review.getReviewId() %>" class="btn btn-sm btn-edit">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <form action="ReviewServlet" method="post" class="d-inline">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="reviewId" value="<%= review.getReviewId() %>">
                    <button type="submit" class="btn btn-sm btn-danger"
                            aria-label="Delete Review <%= review.getReviewId() %>"
                            onclick="return confirm('Are you sure you want to delete this review?')">
                        <i class="fas fa-trash-alt"></i> Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
    <%      }
    } else { %>
    <div class="text-center text-muted py-5">
        <i class="fas fa-inbox fa-2x mb-2"></i>
        <div>No reviews found</div>
    </div>
    <% } %>

    <div class="text-center mt-5">
        <a href="adminDashboard.jsp" class="btn btn-sm btn-danger" aria-label="Go back to home page">Go Back</a>
    </div>
    <div class="text-center mt-4 text-muted">
        <small>Flagged reviews are highlighted in red</small>
    </div>
</div>

<footer class="text-center">
    <div class="container">
        <p class="mb-0">© 2025 Pulse Gym. All rights reserved.</p>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
