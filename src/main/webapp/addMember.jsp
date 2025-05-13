<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Pulse Gym | Add Member</title>
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
    .form-container {
      max-width: 600px;
      margin: 48px auto 0 auto;
      background: #1a1d22;
      padding: 32px;
      border-radius: 1rem;
      box-shadow: 0 4px 24px rgba(30,122,83,0.08);
    }
    h1 {
      font-family: 'Oswald', sans-serif;
      color: #1e7a53;
      text-align: center;
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
    .btn-cancel {
      background: transparent;
      color: #27ef8c;
      border: none;
      font-weight: bold;
      text-decoration: underline;
    }
    .btn-cancel:hover {
      color: #1e7a53;
      text-decoration: underline;
    }
    .input-group-text {
      background: #181c23;
      color: #27ef8c;
      border: 1px solid #333;
      cursor: pointer;
    }
    .input-group-text:hover {
      color: #1e7a53;
    }
    footer {
      background: #181c23;
      color: #1e7a53;
    }
    /* Responsive */
    @media (max-width: 600px) {
      .form-container {
        padding: 16px;
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
        <li class="nav-item"><a class="nav-link" href="addMember.jsp">Register</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Admin</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Form Container -->
<div class="form-container">
  <h1><i class="fas fa-user-plus"></i> Add New Member</h1>
  <form action="MemberServlet" method="post" autocomplete="off">
    <input type="hidden" name="action" value="add">

    <div class="row mb-3">
      <div class="col-md-6 mb-3 mb-md-0">
        <label for="memberID" class="form-label">Member ID</label>
        <input type="text" id="memberID" name="memberID" class="form-control" required>
      </div>
      <div class="col-md-6">
        <label for="name" class="form-label">Full Name</label>
        <input type="text" id="name" name="name" class="form-control" required>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col-md-6 mb-3 mb-md-0">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email" class="form-control" required>
      </div>
      <div class="col-md-6">
        <label for="password" class="form-label">Password</label>
        <div class="input-group">
          <input type="password" id="password" name="password" class="form-control" required>
          <span class="input-group-text" id="togglePassword" style="user-select: none;">
                        <i class="fas fa-eye"></i>
                    </span>
        </div>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col-md-6 mb-3 mb-md-0">
        <label for="membershipType" class="form-label">Membership Type</label>
        <select id="membershipType" name="membershipType" class="form-select" required>
          <option value="" selected disabled>Select membership type</option>
          <option value="Regular">Regular</option>
          <option value="Premium">Premium</option>
        </select>
      </div>
      <div class="col-md-6">
        <label for="contactNumber" class="form-label">Contact Number</label>
        <input type="tel" id="contactNumber" name="contactNumber" class="form-control" required>
      </div>
    </div>

    <div class="mb-4">
      <label for="lastRenewalDate" class="form-label">Last Renewal Date</label>
      <input type="date" id="lastRenewalDate" name="lastRenewalDate" class="form-control" required>
    </div>

    <div class="d-flex justify-content-between">
      <a href="index.jsp" class="btn btn-cancel"><i class="fas fa-times"></i> Cancel</a>
      <button type="submit" class="btn btn-pulse"><i class="fas fa-user-plus"></i> Add Member</button>
    </div>
  </form>
</div>

<!-- Footer -->
<footer class="text-center py-4 mt-5">
  <div class="container">
    <span>&copy; 2025 Pulse Gym. All rights reserved.</span>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Password Toggle Script -->
<script>
  document.getElementById('togglePassword').addEventListener('click', function() {
    const passwordInput = document.getElementById('password');
    const icon = this.querySelector('i');
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    } else {
      passwordInput.type = 'password';
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    }
  });
</script>
</body>
</html>
