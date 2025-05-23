<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.*, java.util.List" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.FitnessClassDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FitnessClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.YogaClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.WeightTrainingClass" %>
<!DOCTYPE html>
<html>
<head>
  <title>Class Management | Pulse Gym</title>
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
    .management-card {
      max-width: 1200px;
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
    .table {
      color: #e0e0e0;
      background: #181c23;
    }
    .table thead {
      background: #1e7a53;
    }
    .table th {
      border-bottom: 2px solid #1e7a53;
    }
    .table-striped > tbody > tr:nth-of-type(odd) {
      background-color: #1a1d22;
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
    .btn-danger {
      background: #8c2327;
      border: none;
    }
    .btn-danger:hover {
      background: #e63946;
    }
    .badge-general {
      background: #27ef8c;
      color: #181c23;
    }
    .badge-group {
      background: #1e7a53;
      color: #e0e0e0;
    }
    .badge-personal {
      background: #ffc107;
      color: #181c23;
    }
    @media (max-width: 768px) {
      .management-card {
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

<div class="management-card">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h3><i class="fas fa-dumbbell me-2"></i>CLASS MANAGEMENT</h3>
    <a href="addClass.jsp" class="btn btn-pulse">
      <i class="fas fa-plus me-2"></i>Add Class
    </a>
  </div>

  <%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    if (success != null) { %>
  <div class="alert alert-success mb-4"><%= success %></div>
  <% } %>
  <% if (error != null) { %>
  <div class="alert alert-danger mb-4"><%= error %></div>
  <% } %>

  <div class="table-responsive">
    <table class="table table-striped table-hover align-middle">
      <thead>
      <tr>
        <th>CLASS ID</th>
        <th>CLASS NAME</th>
        <th>DATE & TIME</th>
        <th>TRAINER</th>
        <th>TYPE</th>
        <th>ACTIONS</th>
      </tr>
      </thead>
      <tbody>
      <%
        FitnessClassDAO classDAO = new FitnessClassDAO();
        TrainerDAO trainerDAO = new TrainerDAO();
        List<FitnessClass> classes = classDAO.getAllClasses();
        List<Trainer> trainers = trainerDAO.getAllTrainers();

        if (classes.isEmpty()) {
      %>
      <tr>
        <td colspan="7" class="text-center text-muted">No classes found</td>
      </tr>
      <%
      } else {
        for (FitnessClass fc : classes) {
          String trainerName = "";
          for (Trainer t : trainers) {
            if (t.getTrainerId().equals(fc.getTrainerId())) {
              trainerName = t.getName();
              break;
            }
          }
      %>
      <tr>
        <td><%= fc.getClassId() %></td>
        <td><%= fc.getClassName() %></td>
        <td><%= fc.getFormattedDateTime() %></td>
        <td><%= trainerName %></td>
        <td>
          <% if (fc instanceof YogaClass) { %>
          <span class="badge badge-group">Yoga</span>
          <% } else if (fc instanceof WeightTrainingClass) { %>
          <span class="badge badge-personal">Weight Training</span>
          <% }  %>
        </td>
        <td>
          <a href="editClass.jsp?classId=<%= fc.getClassId() %>" class="btn btn-sm btn-pulse me-2">
            <i class="fas fa-edit"></i>
          </a>
          <form method="post" action="DeleteClassServlet" class="d-inline">
            <input type="hidden" name="classId" value="<%= fc.getClassId() %>">
            <button type="submit" class="btn btn-sm btn-danger"
                    onclick="return confirm('Are you sure you want to delete this class?')">
              <i class="fas fa-trash-alt"></i>
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

<footer class="text-center py-4">
  <div class="container">
    <p class="mb-0">&copy; 2023 Pulse Gym. All rights reserved.</p>
  </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
