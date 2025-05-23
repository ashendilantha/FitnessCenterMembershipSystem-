<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Member Profile | Pulse Gym</title>
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
      margin-bottom: 24px;
      margin-top: 12px;
    }
    .card {
      background: #1a1d22;
      border-radius: 1rem;
      box-shadow: 0 4px 24px rgba(30,122,83,0.08);
      color: #e0e0e0;
      border: none;
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
    .text-muted {
      color: #27ef8c !important;
    }
    footer {
      background: #181c23;
      color: #1e7a53;
      margin-top: 40px;
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
      <div class="text-center">
        <h4><i class="fas fa-dumbbell"></i> MEMBER PORTAL</h4>
      </div>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="memberProfile.jsp">
            <i class="fas fa-user me-2"></i> My Profile
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="paymentProcessing.jsp">
            <i class="fas fa-clipboard-list me-2"></i> Payment
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="submitReview.jsp">
            <i class="fas fa-receipt me-2"></i> Submit Review
          </a>
        </li>
        <li class="nav-item mt-4">
          <a class="nav-link" href="MemberLogoutServlet">
            <i class="fas fa-sign-out-alt me-2"></i> Logout
          </a>
        </li>
      </ul>
    </nav>

    <!-- Main Content -->
    <main class="col-md-9 col-lg-10 ms-sm-auto p-4">
      <h2 class="profile-header"><i class="fas fa-user-circle"></i> My Profile</h2>
      <% Member member = (Member) session.getAttribute("member"); %>
      <div class="row">
        <div class="col-md-4 text-center mb-4">
          <img src="https://ui-avatars.com/api/?name=<%= member.getName() %>&size=150"
               alt="Profile Image" class="rounded-circle mb-3" width="150" height="150">
          <h4><%= member.getName() %></h4>
          <p class="text-muted"><%= member.getMembershipType() %> Member</p>
            <p class="text-muted">Member ID: <%= member.getMemberId() %></p>
            <p class="text-muted">Registered Date: <%= member.getLastRenewalDate() %></p>
        </div>
        <div class="col-md-8">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title mb-4"><i class="fas fa-id-card"></i> Personal Information</h4>
              <form action="UpdateMemberServlet" method="POST" autocomplete="off">
                <input type="hidden" name="memberId" value="<%= member.getMemberId() %>">
                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="name" class="form-label">Full Name</label>
                      <input type="text" class="form-control" id="name" name="name"
                             value="<%= member.getName() %>" required>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="email" class="form-label">Email</label>
                      <input type="email" class="form-control" id="email" name="email"
                             value="<%= member.getEmail() %>" required>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="contactNumber" class="form-label">Contact Number</label>
                      <input type="tel" class="form-control" id="contactNumber" name="contactNumber"
                             value="<%= member.getContactNumber() %>" required>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label for="membershipType" class="form-label">Membership Type</label>
                      <select class="form-select" id="membershipType" name="membershipType" required>
                        <option value="Regular" <%= member.getMembershipType().equals("Regular") ? "selected" : "" %>>Regular</option>
                        <option value="Premium" <%= member.getMembershipType().equals("Premium") ? "selected" : "" %>>Premium</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <input type="password" class="form-control" id="password" name="password"
                         value="<%= member.getPassword() %>" required>
                </div>
                <button type="submit" class="btn btn-pulse"><i class="fas fa-save"></i> Update Profile</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
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
