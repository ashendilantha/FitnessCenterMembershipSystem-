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
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
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
        .plans-card {
            max-width: 1200px;
            margin: 80px auto 40px auto;
            background: #1a1d22;
            border-radius: 1.2rem;
            box-shadow: 0 8px 32px rgba(30, 122, 83, 0.15);
            padding: 40px 32px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeIn 0.8s ease-out;
        }
        .plans-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(30, 122, 83, 0.2);
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            font-size: 2.5rem;
            margin-bottom: 16px;
            text-align: center;
            letter-spacing: 1px;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
            border-radius: 0.8rem;
            overflow: hidden;
            margin-bottom: 0;
        }
        .table thead {
            background: #1e7a53;
        }
        .table thead th {
            color: black;
            font-weight: 600;
            border-bottom: none;
            padding: 16px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .table tbody tr {
            transition: background 0.2s ease, transform 0.2s ease;
        }
        .table tbody tr:nth-of-type(odd) {
            background-color: #1a1d22;
        }
        .table tbody tr:hover {
            background-color: #202429;
            transform: scale(1.01);
        }
        .table td {
            padding: 14px;
            vertical-align: middle;
            border-color: #2a2e35;
        }
        .flagged-review {
            background-color: #2d1a1a !important;
            border-left: 4px solid #8c2327;
        }
        .star-rating {
            color: #ffc107;
        }
        .btn-danger {
            background: #1e7a53;
            border: none;
            font-weight: 600;
            border-radius: 0.6rem;
            padding: 8px 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .btn-danger:hover {
            background: #e63946;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(230, 57, 70, 0.4);
        }
        .btn-sm {
            padding: 6px 12px;
            font-size: 0.85rem;
        }
        .alert-success {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
            border-radius: 0.6rem;
            box-shadow: 0 4px 12px rgba(30, 122, 83, 0.2);
        }
        .icon {
            font-size: 1.8rem;
            vertical-align: middle;
            margin-right: 10px;
        }
        footer {
            background: #181c23;
            color: #e0e0e0;
            margin-top: 40px;
            padding: 24px 0;
            border-top: 2px solid #1e7a53;
        }
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .table tbody tr {
            animation: fadeIn 0.5s ease-out;
            animation-delay: calc(0.1s * var(--row-index));
        }
        /* Responsive Design */
        @media (max-width: 1000px) {
            .plans-card {
                max-width: 95vw;
                padding: 24px 16px;
                margin: 60px auto 30px auto;
            }
            .table thead th, .table td {
                font-size: 0.9rem;
                padding: 12px;
            }
        }
        @media (max-width: 600px) {
            .plans-card {
                padding: 16px 8px;
                margin: 50px auto 20px auto;
            }
            h2 {
                font-size: 1.8rem;
            }
            .table thead th, .table td {
                font-size: 0.85rem;
                padding: 10px;
            }
            .btn-danger {
                padding: 6px 16px;
                font-size: 0.9rem;
            }
            .btn-sm {
                padding: 4px 8px;
                font-size: 0.8rem;
            }
            .table-responsive {
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
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

<!-- Main Content -->
<div class="plans-card" aria-labelledby="review-moderation-heading">
    <div class="mb-4">
        <h2 id="review-moderation-heading"><i class="fas fa-comment-slash icon"></i>Review Moderation Panel</h2>
        <p class="text-center text-muted">Manage and moderate member reviews</p>
    </div>

    <% if (request.getParameter("success") != null && "deleted".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success text-center mb-4">
        Review deleted successfully!
    </div>
    <% } %>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Member</th>
                <th scope="col">Comment</th>
                <th scope="col">Date</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                ReviewDAO reviewDAO = new ReviewDAO();
                List<Review> reviews = reviewDAO.getAllReviews();
                if (reviews != null && !reviews.isEmpty()) {
                    int rowIndex = 0;
                    for (Review review : reviews) {
                        boolean isFlagged = review.getComment() != null &&
                                (review.getComment().toLowerCase().contains("bad") ||
                                        review.getRating() < 2);
            %>
            <tr class="<%= isFlagged ? "flagged-review" : "" %>" style="--row-index: <%= rowIndex++ %>;">
                <td><%= review.getReviewId() %></td>
                <td>#<%= review.getMemberId() %></td>
                <td><%= review.getComment() %></td>
                <td><%= review.getReviewDate() %></td>
                <td>
                    <form action="ReviewServlet" method="post" class="d-inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="reviewId" value="<%= review.getReviewId() %>">
                        <button type="submit" class="btn btn-sm btn-danger"
                                aria-label="Delete Review <%= review.getReviewId() %>"
                                onclick="return confirm('Are you sure you want to delete this review?')">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </form>
                </td>
            </tr>
            <% }
            } else { %>
            <tr>
                <td colspan="5" class="text-center text-muted">No reviews found</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-5">
        <a href="adminDashboard.jsp" class="btn btn-sm btn-danger" aria-label="Go back to home page">Go Back</a>
    </div>

    <div class="text-center mt-4 text-muted">
        <small>Flagged reviews are highlighted in red</small>
    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    <div class="container">
        <p class="mb-0">© 2023 Pulse Gym. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>