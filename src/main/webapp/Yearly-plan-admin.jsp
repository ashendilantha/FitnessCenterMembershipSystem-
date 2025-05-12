<%--<%@ page import="java.io.*" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title> Yearly Plans</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="container mt-5">--%>
<%--    <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--        <h2 class="mb-0 text-primary"><i class="bi bi-car-front"></i>Yearly plans</h2>--%>
<%--        <a href="add-yearly-plan.jsp" class="btn btn-success">--%>
<%--            <i class="bi bi-plus-lg"></i> Add New Yearly plan--%>
<%--        </a>--%>
<%--    </div>--%>
<%--    <div class="table-responsive">--%>
<%--        <table class="table table-bordered table-hover text-center">--%>
<%--            <thead class="table-dark">--%>
<%--            <tr>--%>
<%--                <th>Plan ID</th>--%>
<%--                <th>Plan</th>--%>
<%--                <th>Base Price(LKR)</th>--%>
<%--                <th>Addons(LKR)(LKR)</th>--%>
<%--                <th>Subtotal</th>--%>
<%--                <th>Discount</th>--%>
<%--                <th>Final Price</th>--%>
<%--                <th>Action</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <%--%>
<%--                String filePath = "C:\\Users\\yuthi\\Desktop\\Add Member plans\\Plan.info\\yearly-plan.txt";--%>
<%--                File file = new File(filePath);--%>
<%--                if (file.exists()) {--%>
<%--                    BufferedReader reader = new BufferedReader(new FileReader(file));--%>
<%--                    String line;--%>
<%--                    while ((line = reader.readLine()) != null) {--%>
<%--                        String[] data = line.split(",");--%>
<%--                        if (data.length == 7) {--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td><%= data[0] %></td>--%>
<%--                <td><%= data[1] %></td>--%>
<%--                <td><%= data[2] %></td>--%>
<%--                <td><%= data[3] %></td>--%>
<%--                <td><%= data[4] %></td>--%>
<%--                <td><%= data[5] %></td>--%>
<%--                <td><%= data[6] %></td>--%>

<%--                <td>--%>
<%--                    <form action="edit-yearly-plan.jsp" method="get" class="d-inline">--%>
<%--                        <input type="hidden" name="planId" value="<%= data[0] %>">--%>
<%--                        <input type="hidden" name="planName" value="<%= data[1] %>">--%>
<%--                        <input type="hidden" name="price" value="<%= data[2] %>">--%>
<%--                        <input type="hidden" name="addons" value="<%= data[3] %>">--%>
<%--                        <input type="hidden" name="subTotal" value="<%= data[4] %>">--%>
<%--                        <input type="hidden" name="discount" value="<%= data[5] %>">--%>
<%--                        <input type="hidden" name="finalPrice" value="<%= data[6] %>">--%>
<%--                        <button type="submit" class="btn btn-sm btn-warning me-2">Edit</button>--%>
<%--                    </form>--%>

<%--                    <form action="yearlyPlanServlet" method="post" class="d-inline">--%>
<%--                        <input type="hidden" name="action" value="deleteYearlyplan">--%>
<%--                        <input type="hidden" name="planId" value="<%= data[0] %>">--%>
<%--                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this Plan?');">Delete</button>--%>
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
    <title>Yearly Plans | Pulse Gym</title>
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
        .plans-card {
            max-width: 1100px;
            margin: 60px auto 0 auto;
            background: #1a1d22;
            border-radius: 1rem;
            box-shadow: 0 4px 24px rgba(30,122,83,0.10);
            padding: 32px 24px 24px 24px;
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            margin-bottom: 28px;
            text-align: center;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
            margin-bottom: 0;
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
            border-radius: 0.5rem;
            padding: 8px 28px;
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
        .icon {
            font-size: 1.5rem;
            vertical-align: middle;
            margin-right: 8px;
        }
        @media (max-width: 1200px) {
            .plans-card {
                max-width: 98vw;
                padding: 16px 4px;
            }
        }
        @media (max-width: 600px) {
            .plans-card {
                padding: 8px 0;
            }
            h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Pulse Gym</a>
    </div>
</nav>

<div class="plans-card">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4">
        <h2 class="mb-3 mb-md-0"><i class="fas fa-list icon"></i>Yearly Plans</h2>
        <a href="add-yearly-plan.jsp" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Add New Yearly Plan
        </a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle w-auto mx-auto">
            <thead>
            <tr>
                <th>Plan ID</th>
                <th>Plan</th>
                <th>Base Price (LKR)</th>
                <th>Addons (LKR)</th>
                <th>Subtotal (LKR)</th>
                <th>Discount (%)</th>
                <th>Final Price (LKR)</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                String filePath = System.getProperty("user.home") + "/Hansana/yearly-plan.txt";
                File file = new File(filePath);
                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] data = line.split(",");
                        if (data.length == 7) {
            %>
            <tr>
                <td><%= data[0] %></td>
                <td><%= data[1] %></td>
                <td><%= data[2] %></td>
                <td><%= data[3] %></td>
                <td><%= data[4] %></td>
                <td><%= data[5] %></td>
                <td><%= data[6] %></td>
                <td>
                    <form action="edit-yearly-plan.jsp" method="get" class="d-inline">
                        <input type="hidden" name="planId" value="<%= data[0] %>">
                        <input type="hidden" name="planName" value="<%= data[1] %>">
                        <input type="hidden" name="price" value="<%= data[2] %>">
                        <input type="hidden" name="addons" value="<%= data[3] %>">
                        <input type="hidden" name="subTotal" value="<%= data[4] %>">
                        <input type="hidden" name="discount" value="<%= data[5] %>">
                        <input type="hidden" name="finalPrice" value="<%= data[6] %>">
                        <button type="submit" class="btn btn-sm btn-warning me-2">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                    </form>
                    <form action="yearlyPlanServlet" method="post" class="d-inline">
                        <input type="hidden" name="action" value="deleteYearlyplan">
                        <input type="hidden" name="planId" value="<%= data[0] %>">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this Plan?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
                reader.close();
            } else {
            %>
            <tr>
                <td colspan="8" class="text-center text-warning">No plans found.</td>
            </tr>
            <%  }
            %>
            </tbody>
        </table>
    </div>
    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-primary">Go Back</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
