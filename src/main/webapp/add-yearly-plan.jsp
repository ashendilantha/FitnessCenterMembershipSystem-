<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Add New Plan</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background-color: #f8f9fa;--%>
<%--        }--%>
<%--        .card {--%>
<%--            border-radius: 15px;--%>
<%--            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>
<%--        .btn-primary {--%>
<%--            background-color: #007bff;--%>
<%--            border: none;--%>
<%--            transition: 0.3s;--%>
<%--        }--%>
<%--        .btn-primary:hover {--%>
<%--            background-color: #0056b3;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container d-flex justify-content-center align-items-center vh-100">--%>
<%--    <div class="card p-4" style="max-width: 500px; width: 100%;">--%>
<%--        <h3 class="text-center mb-4">Add New Plan</h3>--%>
<%--        <form action="yearlyPlanServlet" method="post">--%>
<%--            <input type="hidden" name ="action" value = "addYearlyplan" />--%>
<%--            <div class="mb-3">--%>
<%--                <label for="planId" class="form-label">Plan ID</label>--%>
<%--                <input type="text" class="form-control" id="planId" name="planId" required>--%>
<%--            </div>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="planName" class="form-label">Plan Name</label>--%>
<%--                <input type="text" class="form-control" id="planName" name="planName" required>--%>

<%--                <div class="mb-3">--%>
<%--                    <label for="price" class="form-label">Price</label>--%>
<%--                    <input type="text" class="form-control" id="price" name="price" required>--%>
<%--                </div>--%>
<%--                <div class="mb-3">--%>
<%--                    <label for="addons" class="form-label">Addons</label>--%>
<%--                    <input type="text" class="form-control" id="addons" name="addons" required>--%>
<%--                </div>--%>
<%--                <div class="mb-3">--%>
<%--                    <label for="subTotal" class="form-label">Sub Total</label>--%>
<%--                    <input type="text" class="form-control" id="subTotal" name="subTotal" required>--%>
<%--                </div>--%>
<%--                <div class="mb-3">--%>
<%--                    <label for="discount" class="form-label">Discount</label>--%>
<%--                    <input type="text" class="form-control" id="discount" name="discount" required>--%>
<%--                </div>--%>
<%--                <div class="mb-3">--%>
<%--                    <label for="finalPrice" class="form-label">Final Price</label>--%>
<%--                    <input type="text" class="form-control" id="finalPrice" name="finalPrice" required>--%>
<%--                </div>--%>



<%--                <button type="submit" class="btn btn-primary w-100">Add Car</button>--%>
<%--            </div>--%>

<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Plan | Pulse Gym</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            min-height: 100vh;
        }
        .card {
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.10);
            color: #e0e0e0;
            border: none;
        }
        h3 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
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
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card p-4" style="max-width: 480px; width: 100%;">
        <h3 class="text-center mb-4"><i class="fas fa-plus-circle me-2"></i>Add New Plan</h3>
        <form action="yearlyPlanServlet" method="post" autocomplete="off">
            <input type="hidden" name="action" value="addYearlyplan" />
            <div class="mb-3">
                <label for="planId" class="form-label">Plan ID</label>
                <input type="text" class="form-control" id="planId" name="planId" required>
            </div>
            <div class="mb-3">
                <label for="planName" class="form-label">Plan Name</label>
                <input type="text" class="form-control" id="planName" name="planName" required>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label">Price (LKR)</label>
                <input type="number" class="form-control" id="price" name="price" required min="0" step="0.01">
            </div>
            <div class="mb-3">
                <label for="addons" class="form-label">Addons (LKR)</label>
                <input type="number" class="form-control" id="addons" name="addons" required min="0" step="0.01">
            </div>
            <div class="mb-3">
                <label for="subTotal" class="form-label">Sub Total (LKR)</label>
                <input type="number" class="form-control" id="subTotal" name="subTotal" required min="0" step="0.01">
            </div>
            <div class="mb-3">
                <label for="discount" class="form-label">Discount (%)</label>
                <input type="number" class="form-control" id="discount" name="discount" required min="0" max="100" step="0.01">
            </div>
            <div class="mb-3">
                <label for="finalPrice" class="form-label">Final Price (LKR)</label>
                <input type="number" class="form-control" id="finalPrice" name="finalPrice" required min="0" step="0.01">
            </div>
            <button type="submit" class="btn btn-pulse w-100">Add Plan</button>
        </form>
    </div>
</div>
<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome for icons -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>
