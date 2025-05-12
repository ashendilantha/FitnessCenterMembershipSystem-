<%--<%@ page import="java.io.*" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Plans List</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="container mt-5">--%>
<%--    <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--        <h2 class="mb-0 text-primary"><i class="bi bi-car-front"></i> Monthly Plans</h2>--%>
<%--        <a href="add-Monthly-plan.jsp" class="btn btn-success">--%>
<%--            <i class="bi bi-plus-lg"></i> Add New Monthly Plan--%>
<%--        </a>--%>
<%--    </div>--%>
<%--    <div class="table-responsive">--%>
<%--        <table class="table table-bordered table-hover text-center">--%>
<%--            <thead class="table-dark">--%>
<%--            <tr>--%>
<%--                <th>Plan ID</th>--%>
<%--                <th>Plane Name</th>--%>
<%--                <th>Price(LKR)</th>--%>
<%--                <th>Notes</th>--%>
<%--                <th>Action</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <%--%>
<%--                String filePath = "C:\\Users\\yuthi\\Desktop\\Add Member plans\\Plan.info\\monthly-plan.txt";--%>
<%--                File file = new File(filePath);--%>
<%--                if (file.exists()) {--%>
<%--                    BufferedReader reader = new BufferedReader(new FileReader(file));--%>
<%--                    String line;--%>
<%--                    while ((line = reader.readLine()) != null) {--%>
<%--                        String[] data = line.split(",");--%>
<%--                        if (data.length == 4) {--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td><%= data[0] %></td>--%>
<%--                <td><%= data[1] %></td>--%>
<%--                <td><%= data[2] %></td>--%>
<%--                <td><%= data[3] %></td>--%>


<%--                <td>--%>
<%--                    <form action="edit-Monthly-plan.jsp" method="get" class="d-inline">--%>
<%--                        <input type="hidden" name="planId" value="<%= data[0] %>">--%>
<%--                        <input type="hidden" name="planName" value="<%= data[1] %>">--%>
<%--                        <input type="hidden" name="price" value="<%= data[2] %>">--%>
<%--                        <input type="hidden" name="notes" value="<%= data[3] %>">--%>
<%--                        <button type="submit" class="btn btn-sm btn-warning me-2">Edit</button>--%>
<%--                    </form>--%>

<%--                    <form action="monthlyPlanServlet" method="post" class="d-inline">--%>
<%--                        <input type="hidden" name="action" value="deleteMonthlyplan">--%>
<%--                        <input type="hidden" name="planId" value="<%= data[0] %>">--%>
<%--                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this vehicle?');">Delete</button>--%>
<%--                    </form>--%>

<%--                </td>--%>
<%--            </tr>--%>
<%--            <%--%>
<%--                        }--%>
<%--                    }--%>
<%--                    reader.close();--%>
<%--                }--%>
<%--            %>--%>
<%--            </tbody>--%>
<%--        </table>--%>

<%--    </div>--%>
<%--    <div class="text-center mt-3">--%>
<%--        <a href="index.jsp" class="btn btn-primary">Go Back</a>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>



<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Plans | Pulse Gym</title>
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
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
        }
        .table thead {
            background: #1e7a53;
        }
        .table thead th {
            color: #e0e0e0;
            border-bottom: none;
        }
        .table tbody tr:nth-of-type(odd) {
            background-color: #1a1d22;
        }
        .btn-success {
            background: #1e7a53;
            border: none;
            font-weight: bold;
        }
        .btn-success:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .btn-primary {
            background: #1e7a53;
            border: none;
            font-weight: bold;
        }
        .btn-primary:hover {
            background: #27ef8c;
            color: #181c23;
        }
        .btn-warning {
            background: #ffc107;
            color: #181c23;
            border: none;
        }
        .btn-warning:hover {
            background: #ffecb3;
            color: #181c23;
        }
        .btn-danger {
            background: #8c2327;
            border: none;
        }
        .btn-danger:hover {
            background: #e63946;
            color: #fff;
        }
        .container {
            margin-top: 60px;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>

<!-- Optional Navbar could go here -->

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0 text-primary"><i class="fas fa-calendar-alt me-2"></i> Monthly Plans</h2>
        <a href="add-Monthly-plan.jsp" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Add New Monthly Plan
        </a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
            <thead>
            <tr>
                <th>Plan ID</th>
                <th>Plan Name</th>
                <th>Price (LKR)</th>
                <th>Notes</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                String filePath = System.getProperty("user.home") + "/Hansana/monthly-plan.txt";
                File file = new File(filePath);
                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] data = line.split(",");
                        if (data.length == 4) {
            %>
            <tr>
                <td><%= data[0] %></td>
                <td><%= data[1] %></td>
                <td><%= data[2] %></td>
                <td><%= data[3] %></td>
                <td>
                    <form action="edit-Monthly-plan.jsp" method="get" class="d-inline">
                        <input type="hidden" name="planId" value="<%= data[0] %>">
                        <input type="hidden" name="planName" value="<%= data[1] %>">
                        <input type="hidden" name="price" value="<%= data[2] %>">
                        <input type="hidden" name="notes" value="<%= data[3] %>">
                        <button type="submit" class="btn btn-sm btn-warning me-2">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                    </form>
                    <form action="monthlyPlanServlet" method="post" class="d-inline">
                        <input type="hidden" name="action" value="deleteMonthlyplan">
                        <input type="hidden" name="planId" value="<%= data[0] %>">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this plan?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </form>
                </td>
            </tr>
            <%
                        }
                    }
                    reader.close();
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-primary">Go Back</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
