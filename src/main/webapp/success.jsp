<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Success | Pulse Gym</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: #15171b;
            color: #e0e0e0;
            font-family: 'Poppins', Arial, sans-serif;
        }
        .success-card {
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(39,239,140,0.08);
            color: #e0e0e0;
            border: none;
        }
        .success-icon {
            font-size: 4rem;
            color: #27ef8c;
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
        .alert-success {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center min-vh-100">
        <div class="col-md-7 col-lg-6">
            <div class="card text-center success-card p-4">
                <div class="mb-4">
                    <i class="fas fa-check-circle success-icon"></i>
                </div>
                <h2 class="mb-4" style="color:#27ef8c; font-family: 'Oswald', sans-serif;">SUCCESS!</h2>
                <div class="alert alert-success">
                    <p class="lead mb-0"><%= request.getParameter("message") %></p>
                </div>
                <a href="index.jsp" class="btn btn-pulse mt-3">
                    <i class="fas fa-home me-2"></i> BACK TO HOME
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
