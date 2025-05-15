<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.dao.FitnessClassDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscentermembershipsystem.model.FitnessClass" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Processing | Pulse Gym</title>
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
        .payment-card {
            max-width: 520px;
            margin: 60px auto 0 auto;
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.10);
            padding: 32px 24px 24px 24px;
        }
        h1 {
            color: #1e7a53;
            font-family: 'Oswald', sans-serif;
            text-align: center;
            margin-bottom: 28px;
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
            border-radius: 0.5rem;
            padding: 10px 28px;
            transition: background 0.2s, color 0.2s;
            width: 100%;
        }
        .btn-pulse:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .payment-method-section {
            display: none;
            margin-top: 18px;
            background: #23272f;
            border-radius: 0.5rem;
            padding: 16px;
        }
        .error-message {
            color: #ffb347;
            text-align: center;
            margin-bottom: 18px;
        }
    </style>
    <script>
        function showPaymentMethod() {
            var method = document.getElementById("paymentMethod").value;
            document.getElementById("creditCardDetails").style.display =
                (method === "Credit Card") ? "block" : "none";
            document.getElementById("cashDetails").style.display =
                (method === "Cash") ? "block" : "none";
        }
    </script>
</head>
<body>
<div class="payment-card">
    <h1><i class="fas fa-credit-card me-2"></i>Payment Processing</h1>
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>
    <form action="PaymentServlet" method="post" autocomplete="off">
        <input type="hidden" name="action" value="processPayment">

        <div class="mb-3">
            <label for="memberId" class="form-label">Member ID</label>
            <input type="number" class="form-control" id="memberId" name="memberId" required>
        </div>

        <div class="mb-3">
            <label for="planId" class="form-label">Plan ID</label>
            <input type="text" class="form-control" id="planId" name="planId">
        </div>

        <div class="mb-3">
            <label for="classId" class="form-label">Class</label>
            <select class="form-select" id="classId" name="classId">
                <option value="">Select Class (Optional)</option>
                <%
                    FitnessClassDAO fitnessClassDAO = new FitnessClassDAO();
                    List<FitnessClass> fitnessClasses = fitnessClassDAO.getAllClasses();
                    for (FitnessClass fitnessClass : fitnessClasses) {
                %>
                <option value="<%= fitnessClass.getClassId() %>">
                    <%= fitnessClass.getClassName() %>
                </option>
                <%
                    }
                %>
            </select>
            <div id="classIdError" class="error-message"></div>
        </div>

        <div class="mb-3">
            <label for="amount" class="form-label">Amount</label>
            <input type="number" class="form-control" id="amount" name="amount" step="0.01" required>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" class="form-control" id="description" name="description" required>
        </div>

        <div class="mb-3">
            <label for="paymentMethod" class="form-label">Payment Method</label>
            <select id="paymentMethod" name="paymentMethod" class="form-select" onchange="showPaymentMethod()" required>
                <option value="">Select Method</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Cash">Cash</option>
            </select>
        </div>

        <div id="creditCardDetails" class="payment-method-section">
            <h5 class="mb-3">Credit Card Details</h5>
            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456">
            </div>
            <div class="mb-3">
                <label for="cardHolderName" class="form-label">Card Holder Name</label>
                <input type="text" class="form-control" id="cardHolderName" name="cardHolderName" placeholder="John Doe">
            </div>
            <div class="mb-3">
                <label for="expiryDate" class="form-label">Expiry Date</label>
                <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY">
            </div>
            <div class="mb-3">
                <label for="cvv" class="form-label">CVV</label>
                <input type="text" class="form-control" id="cvv" name="cvv" placeholder="123">
            </div>
        </div>

        <div id="cashDetails" class="payment-method-section">
            <h5 class="mb-3">Cash Payment Details</h5>
            <div class="mb-3">
                <label for="receiptNumber" class="form-label">Receipt Number</label>
                <input type="text" class="form-control" id="receiptNumber" name="receiptNumber">
            </div>
        </div>

        <button type="submit" class="btn btn-pulse mt-2"><i class="fas fa-check-circle me-2"></i>Process Payment</button>
        <a href="memberProfile.jsp" class="btn btn-pulse mt-3"><i class="fas fa-arrow-left me-2"></i>Member Profile</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
