<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FullTimeTrainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.PartTimeTrainer" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Trainer | Pulse Gym</title>
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
    .form-container {
      background: #1a1d22;
      border-radius: 1rem;
      box-shadow: 0 4px 24px rgba(30,122,83,0.08);
      color: #e0e0e0;
      padding: 32px;
      margin-top: 100px;
      margin-bottom: 40px;
    }
    h2 {
      font-family: 'Oswald', sans-serif;
      color: #1e7a53;
      margin-bottom: 32px;
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
    .btn-pulse, .btn-primary {
      background: #1e7a53;
      color: #e0e0e0;
      border: none;
      font-weight: bold;
      border-radius: 0.5rem;
      padding: 10px 28px;
      transition: background 0.2s, color 0.2s;
    }
    .btn-pulse:hover, .btn-primary:hover {
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
    .navbar-nav .nav-link.active, .navbar-nav .nav-link:hover {
      color: #27ef8c !important;
    }
    @media (max-width: 600px) {
      .form-container {
        padding: 16px;
      }
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addTrainer.jsp"><i class="fas fa-user-plus me-1"></i> Add Trainer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="trainerList.jsp"><i class="fas fa-list me-1"></i> Trainer List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="loginTrainer.jsp"><i class="fas fa-sign-in-alt me-1"></i> Trainer Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="form-container mx-auto col-lg-8">
    <h2 class="text-center mb-4"><i class="fas fa-user-edit me-2"></i>Edit Trainer</h2>

    <%
      String trainerId = request.getParameter("trainerId");
      TrainerDAO trainerDAO = new TrainerDAO();
      Trainer trainer = null;

      for (Trainer t : trainerDAO.getAllTrainers()) {
        if (t.getTrainerId().equals(trainerId)) {
          trainer = t;
          break;
        }
      }

      if (trainer == null) {
        response.sendRedirect("trainerList.jsp");
        return;
      }
    %>

    <form action="UpdateTrainerServlet" method="POST" autocomplete="off">
      <input type="hidden" name="trainerId" value="<%= trainer.getTrainerId() %>">

      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="name" class="form-label">Full Name</label>
          <input type="text" class="form-control" id="name" name="name" value="<%= trainer.getName() %>" required>
        </div>
        <div class="col-md-6 mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" id="email" name="email" value="<%= trainer.getEmail() %>" required>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="contactNumber" class="form-label">Contact Number</label>
          <input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="<%= trainer.getContactNumber() %>" required>
        </div>
        <div class="col-md-6 mb-3">
          <label for="specialty" class="form-label">Specialty</label>
          <input type="text" class="form-control" id="specialty" name="specialty" value="<%= trainer.getSpecialty() %>" required>
        </div>
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" value="<%= trainer.getPassword() %>" required>
      </div>

      <div class="text-center mt-4">
        <button type="submit" class="btn btn-pulse"><i class="fas fa-save me-2"></i>Update Trainer</button>
        <a href="trainerList.jsp" class="btn btn-secondary ms-2"><i class="fas fa-times me-1"></i>Cancel</a>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
