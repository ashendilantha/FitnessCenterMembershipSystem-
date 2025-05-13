<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer List | Pulse Gym</title>
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
        .navbar-nav .nav-link.active, .navbar-nav .nav-link:hover {
            color: #27ef8c !important;
        }
        .card {
            background: #1a1d22;
            border-radius: 1rem;
            color: #e0e0e0;
            border: none;
            box-shadow: 0 4px 24px rgba(30,122,83,0.08);
        }
        .card-header {
            background: #181c23;
            color: #1e7a53;
            font-family: 'Oswald', sans-serif;
            border-bottom: none;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
        }
        .table th {
            background: #181c23;
            color: #1e7a53;
            border-bottom: 2px solid #1e7a53;
        }
        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #17191d;
        }
        .badge-full {
            background: #27ef8c;
            color: #181c23;
            font-weight: bold;
        }
        .badge-part {
            background: #1e7a53;
            color: #e0e0e0;
            font-weight: bold;
        }
        .btn-pulse, .btn-primary {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
            font-weight: bold;
            border-radius: 0.5rem;
            padding: 6px 16px;
            transition: background 0.2s, color 0.2s;
        }
        .btn-pulse:hover, .btn-primary:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .btn-outline-danger {
            border-color: #8c2327;
            color: #e0e0e0;
        }
        .btn-outline-danger:hover {
            background: #8c2327;
            color: #fff;
            border-color: #8c2327;
        }
        .alert-success {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
        }
        .alert-warning {
            background: #23272f;
            color: #ffb347;
            border: none;
        }
        @media (max-width: 991px) {
            .card-header {
                text-align: center;
            }
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="addTrainer.jsp">Add Trainer</a></li>
                <li class="nav-item"><a class="nav-link active" href="trainerList.jsp">Trainer List</a></li>
                <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Back</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5 pt-3">
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0"><i class="fas fa-users me-2"></i>Trainer Management</h2>
        </div>
        <div class="card-body">
            <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success mb-3">
                <i class="fas fa-check-circle me-2"></i><%= request.getAttribute("message") %>
            </div>
            <% } %>
            <div class="table-responsive">
                <table class="table table-hover table-striped align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Specialty</th>
                        <th>Type</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        TrainerDAO trainerDAO = new TrainerDAO();
                        List<Trainer> trainers = trainerDAO.getAllTrainers();

                        if (trainers.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="7" class="text-center text-warning">No trainers found</td>
                    </tr>
                    <%
                    } else {
                        for (Trainer trainer : trainers) {
                    %>
                    <tr>
                        <td><%= trainer.getTrainerId() %></td>
                        <td><%= trainer.getName() %></td>
                        <td><%= trainer.getEmail() %></td>
                        <td><%= trainer.getContactNumber() %></td>
                        <td><%= trainer.getSpecialty() %></td>
                        <td>
                            <% if (trainer instanceof lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FullTimeTrainer) { %>
                            <span class="badge badge-full">Full-Time</span>
                            <% } else { %>
                            <span class="badge badge-part">Part-Time</span>
                            <% } %>
                        </td>
                        <td>
                            <a href="editTrainer.jsp?trainerId=<%= trainer.getTrainerId() %>"
                               class="btn btn-pulse btn-sm me-2">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <form action="DeleteTrainerServlet" method="POST" style="display: inline;">
                                <input type="hidden" name="trainerId" value="<%= trainer.getTrainerId() %>">
                                <button type="submit" class="btn btn-outline-danger btn-sm"
                                        onclick="return confirm('Are you sure you want to delete this trainer?');">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="text-center mt-4">
            <a href="adminDashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
            </a>
        </div>
        </div>
    </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
