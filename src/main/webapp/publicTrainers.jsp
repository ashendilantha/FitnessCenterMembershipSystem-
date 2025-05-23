<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Our Trainers | Pulse Gym</title>
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
    .trainer-container {
      max-width: 900px;
      margin: 80px auto 40px auto;
      background: #1a1d22;
      border-radius: 1.2rem;
      box-shadow: 0 8px 32px rgba(30, 122, 83, 0.15);
      padding: 40px 32px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      animation: fadeIn 0.8s ease-out;
    }
    .trainer-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 40px rgba(30, 122, 83, 0.2);
    }
    .trainer-header {
      font-family: 'Oswald', sans-serif;
      color: #1e7a53;
      font-size: 2.5rem;
      margin-bottom: 16px;
      text-align: center;
      letter-spacing: 1px;
    }
    .trainer-card {
      background: #22242a;
      border-radius: 0.8rem;
      padding: 24px;
      margin-bottom: 24px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      animation: fadeIn 0.5s ease-out;
      animation-delay: calc(0.1s * var(--card-index));
    }
    .trainer-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 24px rgba(30, 122, 83, 0.2);
    }
    .trainer-card img {
      border-radius: 50%;
      border: 3px solid #27ef8c;
      margin-bottom: 12px;
    }
    .trainer-card h5 {
      font-family: 'Oswald', sans-serif;
      color: #27ef8c;
      font-size: 1.5rem;
      margin-bottom: 12px;
    }
    .trainer-card p {
      font-size: 1rem;
      margin-bottom: 8px;
      color: #e0e0e0;
    }
    .trainer-card p b {
      color: #27ef8c;
    }
    .alert-warning {
      background: #ffc107;
      color: #181c23;
      border: none;
      border-radius: 0.6rem;
      box-shadow: 0 4px 12px rgba(255, 193, 7, 0.2);
      text-align: center;
    }
    footer {
      background: #181c23;
      color: #e0e0e0;
      padding: 24px 0;
      margin-top: 40px;
      border-top: 2px solid #1e7a53;
      text-align: center;
      font-size: 1rem;
    }
    a {
      color: #27ef8c;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    a:hover {
      color: #1e7a53;
      text-decoration: underline;
    }
    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    /* Responsive Design */
    @media (max-width: 1000px) {
      .trainer-container {
        max-width: 95vw;
        padding: 24px 16px;
        margin: 60px auto 30px auto;
      }
      .trainer-card {
        padding: 20px;
        margin-bottom: 20px;
      }
    }
    @media (max-width: 600px) {
      .trainer-container {
        padding: 16px 8px;
        margin: 50px auto 20px auto;
      }
      .trainer-header {
        font-size: 1.8rem;
      }
      .trainer-card h5 {
        font-size: 1.3rem;
      }
      .trainer-card p {
        font-size: 0.9rem;
      }
      .trainer-card img {
        width: 70px;
        height: 70px;
      }
      .alert-warning {
        font-size: 0.9rem;
        padding: 12px;
      }
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">
      PULSE<span>GYM</span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addMember.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Monthly-plan-member.jsp"><i class="fas fa-list-alt me-1"></i>Monthly Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Yearly-plan-member.jsp"><i class="fas fa-list-alt me-1"></i>Yearly Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="publicTrainers.jsp"><i class="fas fa-users me-1"></i> Trainers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="publicClassSchedule.jsp"><i class="fas fa-calendar-alt me-1"></i> Classes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="loginMember.jsp"><i class="fas fa-sign-in-alt me-1"></i> Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Trainers Section -->
<div class="trainer-container" aria-labelledby="trainer-heading">
  <h2 class="trainer-header" id="trainer-heading">Our Trainers</h2>
  <p class="text-center mb-4 text-muted">Meet our dedicated team of fitness professionals ready to guide you.</p>

  <%
    TrainerDAO trainerDAO = new TrainerDAO();
    List<Trainer> trainers = trainerDAO.getAllTrainers();

    if (trainers.isEmpty()) {
  %>
  <div class="alert alert-warning text-center">No trainers found</div>
  <%
  } else {
    int cardIndex = 0;
    for (Trainer trainer : trainers) {
      String specialties = trainer.getSpecialty();
  %>
  <div class="trainer-card" style="--card-index: <%= cardIndex++ %>;">
    <img src="https://ui-avatars.com/api/?name=<%= trainer.getName() %>&background=27ef8c&color=181c23&size=90"
         alt="<%= trainer.getName() %>" width="90" height="90">
    <h5><%= trainer.getName() %></h5>
    <p><b>Type:</b>
      <% if (trainer instanceof lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FullTimeTrainer) { %>
      Full-Time Trainer
      <% } else { %>
      Part-Time Trainer
      <% } %>
    </p>
    <p><b>Specialty:</b> <%= specialties %></p>
    <p><b>Email:</b> <%= trainer.getEmail() %></p>
    <p><b>Contact:</b> <%= trainer.getContactNumber() %></p>
  </div>
  <%
      }
    }
  %>
</div>

<!-- Footer -->
<footer>
  <div class="container">
    <p class="mb-0">© 2025 Pulse Gym. All rights reserved.</p>
  </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
