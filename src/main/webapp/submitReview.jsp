<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FitnessClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.FitnessClassDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Review | Pulse Gym</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #15171b;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
            padding-top: 60px;
        }
        .review-card {
            max-width: 600px;
            margin: 40px auto;
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.10);
            padding: 32px;
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            margin-bottom: 28px;
            text-align: center;
        }
        .form-label {
            color: #e0e0e0;
            font-weight: 500;
        }
        .form-control, .form-select {
            background: #181c23;
            color: #e0e0e0;
            border: 1px solid #333;
            padding: 10px 15px;
        }
        .form-control:focus, .form-select:focus {
            background: #181c23;
            color: #fff;
            border-color: #1e7a53;
            box-shadow: 0 0 0 0.2rem rgba(30,122,83,0.15);
        }
        .btn-pulse {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
            font-weight: bold;
            border-radius: 0.5rem;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }
        .btn-pulse:hover {
            background: #27ef8c;
            color: #181c23;
            transform: translateY(-2px);
        }
        .error-message {
            color: #e63946;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        @media (max-width: 600px) {
            .review-card {
                padding: 20px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background: #181c23;">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
    </div>
</nav>

<div class="review-card">
    <h2><i class="fas fa-comment-dots me-2"></i>Submit Your Review</h2>
    <form action="ReviewServlet" method="post" autocomplete="off" id="reviewForm">
        <input type="hidden" name="action" value="add">

        <div class="mb-3">
            <label for="memberId" class="form-label">Member ID</label>
            <input type="number" class="form-control" id="memberId" name="memberId" required min="1">
            <div id="memberIdError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="trainerId" class="form-label">Trainer</label>
            <select class="form-select" id="trainerId" name="trainerId">
                <option value="">Select Trainer (Optional)</option>
                <%
                    TrainerDAO trainerDAO = new TrainerDAO();
                    List<Trainer> trainers = trainerDAO.getAllTrainers();
                    for (Trainer trainer : trainers) {
                %>
                <option value="<%= trainer.getTrainerId() %>">
                    <%= trainer.getName() %> (<%= trainer.getSpecialty() %>)
                </option>
                <% } %>
            </select>
            <div id="trainerIdError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="classId" class="form-label">Class</label>
            <select class="form-select" id="classId" name="classId">
                <option value="">Select Class (Optional)</option>
                <%
                    FitnessClassDAO fitnessClassDAO = new FitnessClassDAO();
                    List<FitnessClass> fitnessClasses = fitnessClassDAO.getAllClasses();
                    for (FitnessClass fitnessClass : fitnessClasses) {
                %>
                <option value="<%= fitnessClass.getClassId() %>">
                    <%= fitnessClass.getClassName() %>
                </option>
                <%
                    }
                %>
            </select>
            <div id="classIdError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="rating" class="form-label">Rating</label>
            <select id="rating" name="rating" class="form-select" required>
                <option value="1">1 - Poor</option>
                <option value="2">2 - Fair</option>
                <option value="3" selected>3 - Good</option>
                <option value="4">4 - Very Good</option>
                <option value="5">5 - Excellent</option>
            </select>
            <div id="ratingError" class="error-message"></div>
        </div>

        <div class="mb-4">
            <label for="comment" class="form-label">Comment</label>
            <textarea id="comment" name="comment" class="form-control" rows="4" required minlength="5" maxlength="500"></textarea>
            <div id="commentError" class="error-message"></div>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-pulse w-100"><i class="fas fa-paper-plane me-2"></i>Submit Review</button>
            <a href="memberProfile.jsp" class="btn btn-pulse mt-3 w-100"><i class="fas fa-arrow-left me-2"></i>Back to Profile</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('reviewForm').addEventListener('submit', function(e) {
        let valid = true;
        const memberId = document.getElementById('memberId');
        const rating = document.getElementById('rating');
        const comment = document.getElementById('comment');

        document.querySelectorAll('.error-message').forEach(el => el.textContent = '');

        if (!memberId.value || memberId.value < 1) {
            document.getElementById('memberIdError').textContent = 'Please enter a valid member ID';
            valid = false;
        }

        if (!rating.value || rating.value < 1 || rating.value > 5) {
            document.getElementById('ratingError').textContent = 'Please select a valid rating';
            valid = false;
        }

        if (!comment.value || comment.value.length < 5) {
            document.getElementById('commentError').textContent = 'Comment must be at least 5 characters long';
            valid = false;
        }

        if (!valid) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>