<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.*, java.util.List, java.time.format.DateTimeFormatter" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FitnessClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.FitnessClassDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.YogaClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.WeightTrainingClass" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Class | Pulse Gym</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #15171b;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
        }
        .navbar {
            background: #181c23 !important;
            border-bottom: 2px solid #1e7a53;
        }
        .navbar-brand {
            font-family: 'Oswald', sans-serif;
            font-size: 2rem;
            color: #1e7a53 !important;
        }
        .edit-class-card {
            max-width: 800px;
            margin: 80px auto 0 auto;
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.10);
            padding: 32px;
        }
        h3 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            margin-bottom: 32px;
            text-align: center;
        }
        .form-label {
            color: #e0e0e0;
        }
        .form-control, .form-select {
            background: #181c23;
            color: #e0e0e0;
            border: 1px solid #333;
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
            transition: background 0.2s, color 0.2s;
        }
        .btn-pulse:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .btn-secondary {
            background: #23272f;
            color: #e0e0e0;
            border: none;
            font-weight: bold;
            border-radius: 0.5rem;
            transition: background 0.2s, color 0.2s;
        }
        .btn-secondary:hover {
            background: #1e7a53;
            color: #fff;
        }
        .radio-group {
            display: flex;
            gap: 20px;
            margin: 12px 0;
        }
        .form-check-input:checked {
            background-color: #1e7a53;
            border-color: #1e7a53;
        }
        @media (max-width: 768px) {
            .edit-class-card {
                padding: 24px;
                margin: 40px 15px;
            }
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="viewMembers.jsp">Members</a></li>
                <li class="nav-item"><a class="nav-link active" href="manageClasses.jsp">Classes</a></li>
                <li class="nav-item"><a class="nav-link" href="MemberLogoutServlet">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="edit-class-card">
    <h3><i class="fas fa-edit me-2"></i>Edit Class</h3>

    <% String error = request.getParameter("error");
        if (error != null) { %>
    <div class="alert alert-danger mb-4"><%= error %></div>
    <% } %>

    <%
        String classId = request.getParameter("classId");
        FitnessClassDAO classDAO = new FitnessClassDAO();
        TrainerDAO trainerDAO = new TrainerDAO();
        FitnessClass fc = null;

        List<FitnessClass> classes = classDAO.getAllClasses();
        for (FitnessClass c : classes) {
            if (c.getClassId().equals(classId)) {
                fc = c;
                break;
            }
        }

        if (fc != null) {
            String dateTimeValue = fc.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
    %>
    <form method="post" action="UpdateClassServlet" autocomplete="off">
        <input type="hidden" name="classId" value="<%= fc.getClassId() %>">

        <div class="row g-3">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="classId" class="form-label">Class ID</label>
                    <input type="text" class="form-control" id="classId" name="classId"
                           value="<%= fc.getClassId() %>" readonly>
                </div>
            </div>

            <div class="col-md-6">
                <div class="mb-3">
                    <label for="className" class="form-label">Class Name</label>
                    <input type="text" class="form-control" id="className" name="className"
                           value="<%= fc.getClassName() %>" required>
                </div>
            </div>

            <div class="col-md-6">
                <div class="mb-3">
                    <label for="dateTime" class="form-label">Date & Time</label>
                    <input type="datetime-local" class="form-control" id="dateTime" name="dateTime"
                           value="<%= dateTimeValue %>" required>
                </div>
            </div>


            <div class="col-md-6">
                <div class="mb-3">
                    <label for="trainerId" class="form-label">Trainer</label>
                    <select class="form-select" id="trainerId" name="trainerId" required>
                        <option value="">Select Trainer</option>
                        <%
                            List<Trainer> trainers = trainerDAO.getAllTrainers();
                            for (Trainer trainer : trainers) {
                                String selected = trainer.getTrainerId().equals(fc.getTrainerId()) ? "selected" : "";
                        %>
                        <option value="<%= trainer.getTrainerId() %>" <%= selected %>>
                            <%= trainer.getName() %> (<%= trainer.getSpecialty() %>)
                        </option>
                        <% } %>
                    </select>
                </div>
            </div>

            <div class="col-12">
                <div class="mb-3">
                    <label for="maxParticipants" class="form-label">Max Participants</label>
                    <input type="number" class="form-control" id="maxParticipants" name="maxParticipants"
                           min="1" value="<%= fc.getMaxParticipants() %>" required>
                </div>
            </div>

            <div class="col-12">
                <div class="mb-4">
                    <label class="form-label">Class Type</label>
                    <div class="radio-group">

                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="classType" id="groupType"
                                   value="Yoga" <%= fc instanceof YogaClass ? "checked" : "" %>>
                            <label class="form-check-label" for="groupType">Yoga Class</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="classType" id="personalType"
                                   value="WeightTraining" <%= fc instanceof WeightTrainingClass ? "checked" : "" %>>
                            <label class="form-check-label" for="personalType">Weight Training Class</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 d-flex justify-content-between">
                <a href="manageClasses.jsp" class="btn btn-secondary"><i class="fas fa-times me-2"></i>Cancel</a>
                <button type="submit" class="btn btn-pulse"><i class="fas fa-save me-2"></i>Update Class</button>
            </div>
        </div>
    </form>
    <% } else { %>
    <div class="alert alert-warning text-center">
        Class not found
        <div class="mt-2">
            <a href="manageClasses.jsp" class="btn btn-secondary">Back to Classes</a>
        </div>
    </div>
    <% } %>
</div>

<footer class="text-center py-4">
    <div class="container">
        <p class="mb-0">&copy; 2023 Pulse Gym. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
