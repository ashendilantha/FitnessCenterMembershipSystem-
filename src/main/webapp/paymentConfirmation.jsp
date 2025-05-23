<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Payment Confirmation | Pulse Gym</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: #15171b;
      color: #e0e0e0;
      font-family: 'Poppins', Arial, sans-serif;
    }
    .confirmation-card {
      max-width: 520px;
      margin: 60px auto 0 auto;
      background: #1a1d22;
      border-radius: 1rem;
      box-shadow: 0 4px 24px rgba(30,122,83,0.10);
      padding: 32px 24px 24px 24px;
    }
    h1, .invoice-title {
      color: #1e7a53;
      font-family: 'Oswald', sans-serif;
      text-align: center;
      margin-bottom: 28px;
    }
    .success {
      color: #27ef8c;
      font-weight: bold;
      font-size: 1.2rem;
      text-align: center;
      margin-bottom: 18px;
    }
    .invoice-row {
      margin-bottom: 10px;
      display: flex;
      justify-content: space-between;
    }
    .label {
      font-weight: bold;
      color: #27ef8c;
    }
    .btn-pulse {
      background: #1e7a53;
      color: #e0e0e0;
      border: none;
      font-weight: bold;
      border-radius: 0.5rem;
      padding: 8px 22px;
      transition: background 0.2s, color 0.2s;
      display: block;
      margin: 0 auto;
      margin-top: 32px;
      width: 70%;
      text-align: center;
    }
    .btn-pulse:hover {
      background: #27ef8c;
      color: #181c23;
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
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
  </div>
</nav>

<div class="confirmation-card">
  <h1><i class="fas fa-credit-card me-2"></i>Payment Confirmation</h1>
  <div class="success">
    <i class="fas fa-check-circle me-2"></i>${message}
  </div>
  <h2 class="invoice-title"><i class="fas fa-file-invoice-dollar me-2"></i>Invoice Details</h2>

  <div class="invoice-row">
    <span class="label">Payment ID:</span>
    <span>${payment.paymentId}</span>
  </div>
  <div class="invoice-row">
    <span class="label">Member ID:</span>
    <span>${payment.memberId}</span>
  </div>
  <c:if test="${not empty payment.planId}">
    <div class="invoice-row">
      <span class="label">Plan ID:</span>
      <span>${payment.planId}</span>
    </div>
  </c:if>
  <div class="invoice-row">
    <span class="label">Class ID:</span>
    <span>${payment.classId}</span>
  </div>
  <div class="invoice-row">
    <span class="label">Amount:</span>
    <span>LKR ${payment.amount}</span>
  </div>
  <div class="invoice-row">
    <span class="label">Date & Time:</span>
    <span>${payment.paymentDate}</span>
  </div>
  <div class="invoice-row">
    <span class="label">Description:</span>
    <span>${payment.description}</span>
  </div>
  <div class="invoice-row">
    <span class="label">Payment Method:</span>
    <span>${payment.paymentMethod}</span>
  </div>

  <a href="memberProfile.jsp" class="btn btn-pulse mt-3"><i class="fas fa-arrow-left me-2"></i>Back to Member Profile</a>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>