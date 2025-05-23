<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Member Login | Pulse Gym</title>
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
      background: #181c23;
      border-bottom: 2px solid #1e7a53;
    }
    .navbar-brand {
      font-family: 'Oswald', sans-serif;
      font-size: 2rem;
      color: #1e7a53 !important;
    }
    .login-container {
      max-width: 400px;
      margin: 60px auto 0 auto;
      background: #1a1d22;
      padding: 32px;
      border-radius: 1rem;
      box-shadow: 0 4px 24px rgba(30,122,83,0.08);
    }
    .login-header {
      font-family: 'Oswald', sans-serif;
      color: #1e7a53;
      text-align: center;
      margin-bottom: 24px;
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
      transition: background 0.2s;
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
    .links {
      text-align: center;
      margin-top: 18px;
    }
    .links a {
      color: #27ef8c;
      text-decoration: underline;
      margin: 0 8px;
    }
    .links a:hover {
      color: #1e7a53;
    }
    footer {
      background: #181c23;
      color: #1e7a53;
      margin-top: 40px;
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
  </div>
</nav>

<div class="login-container">
  <div class="login-header">
    <i class="fas fa-user-circle"></i> MEMBER LOGIN
  </div>
  <%-- Display error message if login failed --%>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-danger" role="alert">
    <i class="fas fa-exclamation-triangle"></i> Invalid email or password. Please try again.
  </div>
  <% } %>
  <form action="MemberLoginServlet" method="POST" autocomplete="off">
    <div class="mb-3">
      <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email Address</label>
      <input type="email" class="form-control" id="email" name="email" required autofocus>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label"><i class="fas fa-lock"></i> Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-pulse w-100"><i class="fas fa-sign-in-alt"></i> LOGIN</button>
  </form>
  <div class="links">
    <a href="addMember.jsp"><i class="fas fa-user-plus"></i> Register as New Member</a> |
    <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
  </div>
</div>

<!-- Footer -->
<footer class="text-center py-4 mt-5">
  <div class="container">
    <span>&copy; 2025 Pulse Gym. All rights reserved.</span>
  </div>
</footer>
<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
