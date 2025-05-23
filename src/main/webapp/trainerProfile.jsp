<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FullTimeTrainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.PartTimeTrainer" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trainer Profile | Pulse Gym</title>
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
    .sidebar {
      background: #181c23;
      min-height: 100vh;
      border-right: 2px solid #1e7a53;
      padding-top: 32px;
    }
    .sidebar h4 {
      color: #1e7a53;
      font-family: 'Oswald', sans-serif;
      margin-bottom: 24px;
      text-align: center;
    }
    .sidebar .nav-link {
      color: #e0e0e0;
      font-weight: 500;
      padding: 14px 20px;
      border-left: 4px solid transparent;
      transition: background 0.2s, border-color 0.2s;
    }
    .sidebar .nav-link.active, .sidebar .nav-link:hover {
      background: #1a1d22;
      border-left: 4px solid #27ef8c;
      color: #27ef8c;
    }
    .profile-header {
      color: #1e7a53;
      font-family: 'Oswald', sans-serif;
      margin-bottom: 32px;
      margin-top: 12px;
    }
    .profile-img {
      border: 4px solid #27ef8c;
      box-shadow: 0 2px 12px rgba(39,239,140,0.12);
    }
    .text-muted {
      color: #27ef8c !important;
    }
    .card-profile {
      background: #1a1d22;
      border-radius: 1rem;
      color: #e0e0e0;
      box-shadow: 0 4px 24px rgba(30,122,83,0.08);
      border: none;
      padding: 24px;
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
      transition: background 0.2s, color 0.2s;
    }
    .btn-pulse:hover, .btn-primary:hover {
      background: #27ef8c;
      color: #181c23;
    }
    @media (max-width: 991px) {
      .sidebar {
        min-height: auto;
        border-right: none;
        border-bottom: 2px solid #1e7a53;
        padding-top: 12px;
      }
      .profile-header {
        text-align: center;
      }
    }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar -->
    <nav class="col-md-3 col-lg-2 sidebar d-md-block">
      <h4><i class="fas fa-dumbbell"></i> Trainer Portal</h4>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="trainerProfile.jsp">
            <i class="fas fa-user me-2"></i> My Profile
          </a>
        </li>
        <li class="nav-item mt-4">
          <a class="nav-link" href="TrainerLogoutServlet">
            <i class="fas fa-sign-out-alt me-2"></i> Logout
          </a>
        </li>
      </ul>
    </nav>

    <!-- Main Content -->
    <main class="col-md-9 col-lg-10 p-4">
      <h2 class="profile-header"><i class="fas fa-user-circle me-2"></i>My Profile</h2>

      <% Trainer trainer = (Trainer) session.getAttribute("trainer");
        if (trainer == null) {
          response.sendRedirect("loginTrainer.jsp");
          return;
        }
      %>

      <div class="row">
        <div class="col-md-4 text-center mb-4">
          <img src="https://ui-avatars.com/api/?name=<%= trainer.getName() %>&background=27ef8c&color=181c23&size=150"
               alt="Profile Image" class="rounded-circle mb-3 profile-img" width="150" height="150">
          <h4><%= trainer.getName() %></h4>
          <% if (trainer instanceof FullTimeTrainer) { %>
          <span class="badge bg-success mb-2">Full-Time Trainer</span>
          <% } else { %>
          <span class="badge bg-info mb-2">Part-Time Trainer</span>
          <% } %>


          <div class="mt-3 card-profile">
            <h5 class="mb-3" style="color:#27ef8c;"><i class="fas fa-briefcase me-2"></i>Professional Details</h5>

            <p><strong>Trainer ID:</strong> <%= trainer.getTrainerId() %></p>
            <p><strong>Specialty:</strong> <%= trainer.getSpecialty() %></p>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card-profile">
            <h4 class="mb-4"><i class="fas fa-id-card me-2"></i>Personal Information</h4>
            <form action="UpdateTrainerServlet" method="POST" autocomplete="off">
              <input type="hidden" name="trainerId" value="<%= trainer.getTrainerId() %>">

              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="trainerId" class="form-label">Trainer ID</label>
                  <input type="text" class="form-control" id="trainerId" value="<%= trainer.getTrainerId() %>" disabled>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="name" class="form-label">Full Name</label>
                  <input type="text" class="form-control" id="name" name="name" value="<%= trainer.getName() %>" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="email" name="email" value="<%= trainer.getEmail() %>" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="contactNumber" class="form-label">Contact Number</label>
                  <input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="<%= trainer.getContactNumber() %>" required>
                </div>
              </div>

              <div class="mb-3">
                <label for="specialty" class="form-label">Specialty</label>
                <input type="text" class="form-control" id="specialty" name="specialty" value="<%= trainer.getSpecialty() %>" required>
              </div>

              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= trainer.getPassword() %>" required>
              </div>

              <button type="submit" class="btn btn-pulse"><i class="fas fa-save me-2"></i>Update Profile</button>
            </form>
          </div>
        </div>
      </div>
    </main>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
