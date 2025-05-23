<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Trainer | Pulse Gym</title>
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
        .alert-success {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
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
                    <a class="nav-link active" href="addTrainer.jsp"><i class="fas fa-user-plus me-1"></i> Add Trainer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="trainerList.jsp"><i class="fas fa-list me-1"></i> Trainer List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-sign-in-alt me-1"></i> Back</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="form-container mx-auto col-lg-8">
        <h2 class="text-center"><i class="fas fa-user-plus me-2"></i>Add New Trainer</h2>

        <%-- Display message if any --%>
        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle me-2"></i><%= request.getAttribute("message") %>
        </div>
        <% } %>

        <form action="AddTrainerServlet" method="POST" autocomplete="off">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="trainerId" class="form-label">Trainer ID</label>
                    <input type="text" class="form-control" id="trainerId" name="trainerId" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="contactNumber" class="form-label">Contact Number</label>
                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="specialty" class="form-label">Specialty</label>
                <input type="text" class="form-control" id="specialty" name="specialty" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Trainer Type</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="trainerType" id="fullTime" value="FULLTIME" checked>
                    <label class="form-check-label" for="fullTime">Full-Time</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="trainerType" id="partTime" value="PARTTIME">
                    <label class="form-check-label" for="partTime">Part-Time</label>
                </div>
            </div>
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-pulse"><i class="fas fa-user-plus me-2"></i>Add Trainer</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Remove the JavaScript for toggling fields since they are no longer needed
</script>
</body>
</html>