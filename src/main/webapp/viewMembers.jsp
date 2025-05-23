<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pulse Gym | Member Management</title>
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
        .card {
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.08);
            color: #e0e0e0;
            border: none;
        }
        .card-header, .card-footer {
            background: #181c23;
            color: #27ef8c;
            border-bottom: none;
            border-top: none;
        }
        .card-header h3 {
            color: #1e7a53;
            font-family: 'Oswald', sans-serif;
            margin-bottom: 0;
        }
        .btn-primary, .btn-outline-secondary {
            font-weight: bold;
        }
        .btn-primary {
            background: #1e7a53;
            border: none;
        }
        .btn-primary:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .btn-outline-secondary {
            border-color: #27ef8c;
            color: #27ef8c;
        }
        .btn-outline-secondary:hover {
            background: #27ef8c;
            color: #181c23;
            border-color: #27ef8c;
        }
        .btn-outline-danger {
            border-color: #8c2327;
            color: #e0e0e0;
        }
        .btn-outline-danger:hover {
            background: #8c2327;
            color: #fff;
            border-color: #8c2327;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
        }
        .table th {
            background: #181c23;
            color: #1e7a53;
            border-bottom: 2px solid #1e7a53;
        }
        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #17191d;
        }
        .badge.bg-primary {
            background: #27ef8c !important;
            color: #181c23;
        }
        .badge.bg-secondary {
            background: #1e7a53 !important;
            color: #e0e0e0;
        }
        footer {
            background: #181c23;
            color: #1e7a53;
            margin-top: 40px;
        }
        @media (max-width: 991px) {
            .card-header, .card-footer {
                text-align: center;
            }
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
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
                    <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="viewMembers.jsp"><i class="fas fa-users me-1"></i> Members</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5 pt-3">
    <div class="card">
        <div class="card-header">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
                <h3 class="mb-3 mb-md-0"><i class="fas fa-users me-2"></i>MEMBER MANAGEMENT</h3>
                <div>
                    <a href="MemberServlet?action=sortByRenewalDate" class="btn btn-outline-secondary me-2 mb-2 mb-md-0">
                        <i class="fas fa-sort me-1"></i> SORT BY RENEWAL
                    </a>
                    <a href="addMember.jsp" class="btn btn-primary">
                        <i class="fas fa-user-plus me-1"></i> ADD MEMBER
                    </a>
                </div>
            </div>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover table-striped align-middle">
                    <thead>
                    <tr>
                        <th>MEMBER ID</th>
                        <th>NAME</th>
                        <th>EMAIL</th>
                        <th>MEMBERSHIP</th>
                        <th>CONTACT</th>
                        <th>RENEWAL DATE</th>
                        <th>ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="member" items="${members}">
                        <tr>
                            <td>${member.memberId}</td>
                            <td>${member.name}</td>
                            <td>${member.email}</td>
                            <td>
                                <span class="badge ${member.membershipType eq 'Premium' ? 'bg-primary' : 'bg-secondary'}">
                                        ${member.membershipType}
                                </span>
                            </td>
                            <td>${member.contactNumber}</td>
                            <td>${member.lastRenewalDate}</td>
                            <td>
                                <a href="MemberServlet?action=delete&memberID=${member.memberId}"
                                   class="btn btn-outline-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this member?')">
                                    <i class="fas fa-trash-alt"></i> DELETE
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="card-footer">
            <a href="adminDashboard.jsp" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left me-1"></i> BACK TO DASHBOARD
            </a>
        </div>
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
