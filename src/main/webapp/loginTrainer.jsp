<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trainer Login | Pulse Gym</title>
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
    .login-container {
      background: #1a1d22;
      border-radius: 1rem;
      box-shadow: 0 4px 24px rgba(30,122,83,0.08);
      color: #e0e0e0;
      padding: 32px;
      margin-top: 120px;
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
    .form-control {
      background: #181c23;
      color: #e0e0e0;
      border: 1px solid #333;
    }
    .form-control:focus {
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
      padding: 10px 28px;
      transition: background 0.2s, color 0.2s;
    }
    .btn-pulse:hover {
      background: #27ef8c;
      color: #181c23;
    }
    .alert-danger {
      background: #8c2327;
      color: #e0e0e0;
      border: none;
    }
    a {
      color: #27ef8c;
      text-decoration: underline;
    }
    a:hover {
      color: #1e7a53;
    }
    @media (max-width: 600px) {
      .login-container {
        padding: 16px;
      }
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      Pulse Gym
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="loginTrainer.jsp"><i class="fas fa-sign-in-alt me-1"></i> Trainer Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="login-container mx-auto col-lg-6">
    <h2 class="text-center mb-4"><i class="fas fa-sign-in-alt me-2"></i>Trainer Login</h2>

    <%-- Display error message if any --%>
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger text-center">
      <i class="fas fa-exclamation-circle me-2"></i>
      <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="TrainerLoginServlet" method="POST" autocomplete="off">
      <div class="mb-3">
        <label for="trainerId" class="form-label">Trainer ID</label>
        <input type="text" class="form-control" id="trainerId" name="trainerId" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
      <button type="submit" class="btn btn-pulse w-100">Login</button>
    </form>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
