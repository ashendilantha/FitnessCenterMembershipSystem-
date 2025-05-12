<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Edit Customer</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container mt-5">--%>
<%--    <h2 class="mb-4">Edit Monthly Plan</h2>--%>
<%--    <form action="monthlyPlanServlet" method="post">--%>
<%--        <input type="hidden" name="action" value="updateMonthlyplan">--%>
<%--        <input type="hidden" name="originalID" value="<%= request.getParameter("planId") %>">--%>

<%--        <div class="mb-3">--%>
<%--            <label for="planId" class="form-label">Plan ID</label>--%>
<%--            <input type="text" class="form-control" id="planId" name="planId"--%>
<%--                   value="<%= request.getParameter("planId") %>" required>--%>
<%--        </div>--%>

<%--        <div class="mb-3">--%>
<%--            <label for="planName" class="form-label">Plan Name</label>--%>
<%--            <input type="text" class="form-control" id="planName" name="planName"--%>
<%--                   value="<%= request.getParameter("planName") %>" required>--%>
<%--        </div>--%>

<%--        <div class="mb-3">--%>
<%--            <label for="price" class="form-label">Price</label>--%>
<%--            <input type="text" class="form-control" id="price" name="price"--%>
<%--                   value="<%= request.getParameter("price") %>" required>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="notes" class="form-label">Notes</label>--%>
<%--            <input type="text" class="form-control" id="notes" name="notes"--%>
<%--                   value="<%= request.getParameter("notes") %>" required>--%>
<%--        </div>--%>


<%--        <button type="submit" class="btn btn-primary">Update Plan</button>--%>
<%--        <a href="Monthly-plan-admin.jsp" class="btn btn-secondary">Cancel</a>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Monthly Plan | Pulse Gym</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #15171b;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
        }
        .card {
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.10);
            color: #e0e0e0;
            border: none;
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            margin-bottom: 32px;
            text-align: center;
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
        .btn-pulse, .btn-primary {
            background: #1e7a53;
            color: #e0e0e0;
            border: none;
            font-weight: bold;
            border-radius: 0.5rem;
            transition: background 0.2s, color 0.2s;
        }
        .btn-pulse:hover, .btn-primary:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .btn-secondary {
            background: #23272f;
            color: #e0e0e0;
            border: none;
            font-weight: bold;
            border-radius: 0.5rem;
            transition: background 0.2s, color 0.2s;
        }
        .btn-secondary:hover {
            background: #1e7a53;
            color: #fff;
        }
        .card-form {
            max-width: 500px;
            margin: 60px auto 0 auto;
            padding: 32px;
        }
        @media (max-width: 600px) {
            .card-form {
                padding: 16px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card card-form">
        <h2><i class="fas fa-edit me-2"></i>Edit Monthly Plan</h2>
        <form action="monthlyPlanServlet" method="post" autocomplete="off">
            <input type="hidden" name="action" value="updateMonthlyplan">
            <input type="hidden" name="originalID" value="<%= request.getParameter("planId") %>">

            <div class="mb-3">
                <label for="planId" class="form-label">Plan ID</label>
                <input type="text" class="form-control" id="planId" name="planId"
                       value="<%= request.getParameter("planId") %>" required>
            </div>

            <div class="mb-3">
                <label for="planName" class="form-label">Plan Name</label>
                <input type="text" class="form-control" id="planName" name="planName"
                       value="<%= request.getParameter("planName") %>" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price (LKR)</label>
                <input type="number" class="form-control" id="price" name="price"
                       value="<%= request.getParameter("price") %>" required min="0" step="0.01">
            </div>
            <div class="mb-3">
                <label for="notes" class="form-label">Notes</label>
                <input type="text" class="form-control" id="notes" name="notes"
                       value="<%= request.getParameter("notes") %>" required>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-pulse">Update Plan</button>
                <a href="Monthly-plan-admin.jsp" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome for icons -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>
