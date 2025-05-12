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
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:600,700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #15171b;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
        }
        .navbar {
            background: #181c23 !important;
            border-bottom: 2px solid #1e7a53;
            padding: 12px 0;
        }
        .navbar-brand {
            font-family: 'Oswald', sans-serif;
            font-size: 2.2rem;
            color: #1e7a53 !important;
            transition: color 0.3s ease;
        }
        .navbar-brand:hover {
            color: #27ef8c !important;
        }
        .plans-card {
            max-width: 900px;
            margin: 80px auto 40px auto;
            background: #1a1d22;
            border-radius: 1.2rem;
            box-shadow: 0 8px 32px rgba(30, 122, 83, 0.15);
            padding: 40px 32px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeIn 0.8s ease-out;
        }
        .plans-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(30, 122, 83, 0.2);
        }
        h2 {
            font-family: 'Oswald', sans-serif;
            color: #1e7a53;
            font-size: 2.5rem;
            margin-bottom: 32px;
            text-align: center;
            letter-spacing: 1px;
        }
        .table {
            color: #e0e0e0;
            background: #181c23;
            border-radius: 0.8rem;
            overflow: hidden;
            margin-bottom: 0;
        }
        .table thead {
            background: #1e7a53;
        }
        .table thead th {
            color: #e0e0e0;
            font-weight: 600;
            border-bottom: none;
            padding: 16px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .table tbody tr {
            transition: background 0.2s ease, transform 0.2s ease;
        }
        .table tbody tr:nth-of-type(odd) {
            background-color: #1a1d22;
        }
        .table tbody tr:hover {
            background-color: #202429;
            transform: scale(1.01);
        }
        .table td {
            padding: 14px;
            vertical-align: middle;
            border-color: #2a2e35;
        }
        .btn-primary, .btn-success, .btn-warning, .btn-danger {
            border: none;
            font-weight: 600;
            border-radius: 0.6rem;
            padding: 8px 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .btn-primary {
            background: #1e7a53;
        }
        .btn-primary:hover {
            background: #27ef8c;
            color: #181c23;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(39, 239, 140, 0.4);
        }
        .btn-success {
            background: #1e7a53;
        }
        .btn-success:hover {
            background: #27ef8c;
            color: #181c23;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(39, 239, 140, 0.4);
        }
        .btn-warning {
            background: #ffc107;
            color: #181c23;
        }
        .btn-warning:hover {
            background: #ffecb3;
            color: #181c23;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(255, 236, 179, 0.4);
        }
        .btn-danger {
            background: #8c2327;
        }
        .btn-danger:hover {
            background: #e63946;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(230, 57, 70, 0.4);
        }
        .btn-sm {
            padding: 6px 12px;
            font-size: 0.85rem;
        }
        .icon {
            font-size: 1.8rem;
            vertical-align: middle;
            margin-right: 10px;
        }
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .table tbody tr {
            animation: fadeIn 0.5s ease-out;
            animation-delay: calc(0.1s * var(--row-index));
        }
        /* Responsive Design */
        @media (max-width: 1000px) {
            .plans-card {
                max-width: 95vw;
                padding: 24px 16px;
                margin: 60px auto 30px auto;
            }
            .table thead th, .table td {
                font-size: 0.9rem;
                padding: 12px;
            }
        }
        @media (max-width: 600px) {
            .plans-card {
                padding: 16px 8px;
                margin: 50px auto 20px auto;
            }
            h2 {
                font-size: 1.8rem;
            }
            .table thead th, .table td {
                font-size: 0.85rem;
                padding: 10px;
            }
            .btn-primary, .btn-success, .btn-warning, .btn-danger {
                padding: 6px 16px;
                font-size: 0.9rem;
            }
            .btn-sm {
                padding: 4px 8px;
                font-size: 0.8rem;
            }
            .table-responsive {
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp" aria-label="Pulse Gym Home">Pulse Gym</a>
    </div>
</nav>

<div class="plans-card" aria-labelledby="monthly-plans-heading">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4">
        <h2 id="monthly-plans-heading" class="mb-3 mb-md-0"><i class="fas fa-calendar-alt icon"></i> Monthly Plans</h2>
        <a href="add-Monthly-plan.jsp" class="btn btn-success" aria-label="Add New Monthly Plan">
            <i class="fas fa-plus me-1"></i> Add New Monthly Plan
        </a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
            <thead>
            <tr>
                <th scope="col">Plan ID</th>
                <th scope="col">Plan Name</th>
                <th scope="col">Price (LKR)</th>
                <th scope="col">Notes</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                String filePath = System.getProperty("user.home") + "/Hansana/monthly-plan.txt";
                File file = new File(filePath);
                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    int rowIndex = 0;
                    while ((line = reader.readLine()) != null) {
                        String[] data = line.split(",");
                        if (data.length == 4) {
            %>
            <tr style="--row-index: <%= rowIndex++ %>;">
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
                        <button type="submit" class="btn btn-sm btn-warning me-2" aria-label="Edit Plan <%= data[0] %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                    </form>
                    <form action="monthlyPlanServlet" method="post" class="d-inline">
                        <input type="hidden" name="action" value="deleteMonthlyplan">
                        <input type="hidden" name="planId" value="<%= data[0] %>">
                        <button type="submit" class="btn btn-sm btn-danger" aria-label="Delete Plan <%= data[0] %>" onclick="return confirm('Are you sure you want to delete this plan?');">
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
                <td colspan="5" class="text-center text-warning">No plans found.</td>
            </tr>
            <%  }
            %>
            </tbody>
        </table>
    </div>
    <div class="text-center mt-5">
        <a href="adminDashboard.jsp" class="btn btn-primary" aria-label="Go back to home page">Go Back</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>