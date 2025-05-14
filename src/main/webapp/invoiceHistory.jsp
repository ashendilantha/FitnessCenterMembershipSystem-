<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pulse Gym | Invoice History</title>
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
        .invoice-header {
            margin-top: 40px;
            margin-bottom: 32px;
            text-align: left;
        }
        .invoice-header h1 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        .invoice-header p {
            color: #27ef8c;
            font-size: 1.1rem;
        }
        .filter-form {
            margin-bottom: 28px;
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
        }
        .filter-form form {
            display: inline-block;
        }
        .btn-pulse {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
            font-weight: bold;
            border-radius: 0.5rem;
            padding: 6px 18px;
            margin-right: 10px;
            transition: background 0.2s, color 0.2s;
        }
        .btn-pulse:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
            border-radius: 0.5rem;
            overflow: hidden;
        }
        .table thead {
            background: #1e7a53;
        }
        .table thead th {
            color: black;
            border-bottom: none;
        }
        .table tbody tr:nth-of-type(odd) {
            background-color: #1a1d22;
        }
        .table tbody tr {
            vertical-align: middle;
        }
        .alert-warning {
            background: #23272f;
            color: #ffb347;
            border: none;
        }
        footer {
            background: #181c23;
            color: #1e7a53;
            margin-top: 40px;
        }
        @media (max-width: 991px) {
            .invoice-header {
                text-align: center;
            }
            .filter-form {
                flex-direction: column;
                gap: 10px;
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
                <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="viewMembers.jsp">Members</a></li>
                <li class="nav-item"><a class="nav-link" href="viewPlans.jsp">Plans</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <!-- Header -->
    <div class="invoice-header">
        <h1><i class="fas fa-file-invoice-dollar me-2"></i>Invoice History</h1>
        <p>All member payment records and invoice actions</p>
    </div>

    <!-- Filter Forms -->
    <div class="filter-form">
        <form action="PaymentServlet" method="get">
            <input type="hidden" name="action" value="viewAll">
            <button type="submit" class="btn btn-pulse"><i class="fas fa-list"></i> View All Payments</button>
        </form>
        <form action="PaymentServlet" method="get">
            <input type="hidden" name="action" value="viewSorted">
            <button type="submit" class="btn btn-pulse"><i class="fas fa-sort-amount-down"></i> Sort by Date</button>
        </form>
        <form action="PaymentServlet" method="get" class="d-flex align-items-center">
            <input type="hidden" name="action" value="viewByMember">
            <label for="memberId" class="me-2 mb-0">Member ID:</label>
            <input type="number" id="memberId" name="memberId" class="form-control me-2" style="width:120px;" required>
            <button type="submit" class="btn btn-pulse"><i class="fas fa-filter"></i> Filter by Member</button>
        </form>
    </div>

    <!-- Invoice Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead>
            <tr>
                <th>Payment ID</th>
                <th>Member ID</th>
                <th>Plan ID</th>
                <th>Class ID</th>
                <th>Amount</th>
                <th>Date & Time</th>
                <th>Description</th>
                <th>Payment Method</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="payment" items="${payments}">
                <tr>
                    <td>${payment.paymentId}</td>
                    <td>${payment.memberId}</td>
                    <td>${payment.planId}</td>
                    <td>${payment.classId}</td>
                    <td>LKR ${payment.amount}</td>
                    <td>${payment.paymentDate}</td>
                    <td>${payment.description}</td>
                    <td>${payment.paymentMethod}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty payments}">
            <div class="alert alert-warning text-center my-3">No payment records found.</div>
        </c:if>
    </div>
</div>

<div class="text-center mt-5">
    <a href="adminDashboard.jsp" class="btn btn-primary" aria-label="Go back to home page">Go Back</a>
</div>

<footer class="text-center py-4 mt-5">
    <div class="container">
        <span>&copy; 2025 Pulse Gym. All rights reserved.</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
