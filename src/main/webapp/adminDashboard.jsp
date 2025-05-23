<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Pulse Gym | Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
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
      background: #181c23;
      border-bottom: 2px solid #1e7a53;
    }
    .navbar-brand {
      font-family: 'Oswald', sans-serif;
      font-size: 2rem;
      color: #1e7a53 !important;
    }
    .dashboard-header {
      text-align: left;
      margin-top: 40px;
      margin-bottom: 32px;
    }
    .dashboard-header h1 {
      font-family: 'Oswald', sans-serif;
      color: #1e7a53;
      font-size: 2.2rem;
      margin-bottom: 0.5rem;
    }
    .dashboard-header p {
      color: #27ef8c;
      font-size: 1.1rem;
    }
    .actions-grid {
      display: flex;
      flex-wrap: wrap;
      gap: 32px;
      justify-content: center;
    }
    .action-card {
      background: #181c23;
      border-radius: 1rem;
      box-shadow: 0 2px 12px rgba(30,122,83,0.08);
      padding: 32px 24px;
      min-width: 240px;
      max-width: 320px;
      flex: 1 1 260px;
      text-align: center;
      margin-bottom: 24px;
    }
    .action-card .icon {
      font-size: 2.2rem;
      color: #27ef8c;
      margin-bottom: 12px;
    }
    .action-card h4 {
      color: #27ef8c;
      font-family: 'Oswald', sans-serif;
      margin-bottom: 10px;
    }
    .action-card p {
      min-height: 40px;
      font-size: 1rem;
    }
    .action-card form,
    .action-card a {
      display: inline-block;
      margin-top: 10px;
    }
    .btn-pulse {
      background: #1e7a53;
      color: #e0e0e0;
      border: none;
      font-weight: bold;
      border-radius: 0.5rem;
      padding: 8px 22px;
      transition: background 0.2s, color 0.2s;
    }
    .btn-pulse:hover {
      background: #27ef8c;
      color: #181c23;
    }
    footer {
      background: #181c23;
      color: #1e7a53;
      margin-top: 40px;
    }
    @media (max-width: 991px) {
      .actions-grid {
        flex-direction: column;
        gap: 16px;
      }
      .dashboard-header {
        text-align: center;
      }
    }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link active" href="#">Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="viewMembers.jsp">Members</a></li>
        <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <!-- Dashboard Header -->
  <div class="dashboard-header">
    <h1><i class="fas fa-chart-line"></i> Admin Dashboard</h1>
    <p>Welcome back! Use the actions below to manage Pulse Gym.</p>
  </div>

  <!-- Actions Grid -->
  <div class="actions-grid">
    <!-- Add Member -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-user-plus"></i></div>
      <h4>Add Member</h4>
      <p>Register a new member to the gym.</p>
      <a href="addMember.jsp" class="btn btn-pulse"><i class="fas fa-user-plus"></i> Add Member</a>
    </div>
    <!-- View Members -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-users"></i></div>
      <h4>View Members</h4>
      <p>See all registered members and manage their accounts.</p>
      <a href="viewMembers.jsp" class="btn btn-pulse"><i class="fas fa-users"></i> View Members</a>
    </div>
    <!-- Add Plan -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-list-alt"></i></div>
      <h4>View Monthly Plans</h4>
      <p>Review and manage Monthly membership plans.</p>
      <a href="Monthly-plan-admin.jsp" class="btn btn-pulse"><i class="fas fa-list-alt"></i> Monthly plans</a>
    </div>
    <!-- Add Plan -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-list-alt"></i></div>
      <h4>View Yearly Plans</h4>
      <p>Review and manage Yearly membership plans.</p>
      <a href="Yearly-plan-admin.jsp" class="btn btn-pulse"><i class="fas fa-list-alt"></i> Yearly plans</a>
    </div>
    <!-- Add Trainer -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-user-tie"></i></div>
      <h4>Add Trainer</h4>
      <p>Register a new trainer to the gym.</p>
      <a href="addTrainer.jsp" class="btn btn-pulse"><i class="fas fa-user-plus"></i> Add Trainer</a>
    </div>
    <!-- Trainer List -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-users"></i></div>
      <h4>Trainer List</h4>
      <p>See all trainers and manage their profiles.</p>
      <a href="trainerList.jsp" class="btn btn-pulse"><i class="fas fa-users"></i> Trainer List</a>
    </div>
    <!-- Add Schedule -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-calendar-plus"></i></div>
      <h4>Add Schedule</h4>
      <p>Add a new class or schedule.</p>
      <a href="manageClasses.jsp" class="btn btn-pulse"><i class="fas fa-calendar-plus"></i> Add Schedule</a>
    </div>
    <!-- Payment Records -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-calendar-check"></i></div>
      <h4>Payment Records</h4>
      <p>View and manage member payments records.</p>
      <a href="invoiceHistory.jsp" class="btn btn-pulse"><i class="fas fa-calendar-check"></i> Payment Records</a>
    </div>
    <!-- Manage Reviews -->
    <div class="action-card">
      <div class="icon"><i class="fas fa-star"></i></div>
      <h4>Manage Reviews</h4>
      <p>View and moderate member reviews.</p>
      <a href="adminReviews.jsp" class="btn btn-pulse"><i class="fas fa-star"></i> Manage Reviews</a>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="text-center py-4 mt-5">
  <div class="container">
    <span>&copy; 2025 Pulse Gym. All rights reserved.</span>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
