<%@ page import="java.io.File" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
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
            color: black;
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
        .btn-primary {
            background: #1e7a53;
            border: none;
            font-weight: 600;
            border-radius: 0.6rem;
            padding: 10px 32px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(30, 122, 83, 0.3);
        }
        .btn-primary:hover {
            background: #27ef8c;
            color: #181c23;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(39, 239, 140, 0.4);
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
            .btn-primary {
                padding: 8px 24px;
                font-size: 0.9rem;
            }
            .table-responsive {
                font-size: 0.8rem;
            }
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
        .nav-link {
            color: #e0e0e0 !important;
            font-weight: 500;
            margin: 0 12px;
            position: relative;
            padding: 5px 0 !important;
            transition: color 0.3s ease;
        }
        .nav-link:before {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #27ef8c;
            visibility: hidden;
            transition: all 0.3s ease-in-out;
        }
        .nav-link:hover:before, .nav-link.active:before {
            visibility: visible;
            width: 100%;
        }
        .nav-link:hover, .nav-link.active {
            color: #27ef8c !important;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            PULSE<span>GYM</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addMember.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Monthly-plan-member.jsp"><i class="fas fa-list-alt me-1"></i>Monthly Plans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Yearly-plan-member.jsp"><i class="fas fa-list-alt me-1"></i>Yearly Plans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="publicTrainers.jsp"><i class="fas fa-users me-1"></i> Trainers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="publicClassSchedule.jsp"><i class="fas fa-calendar-alt me-1"></i> Classes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loginMember.jsp"><i class="fas fa-sign-in-alt me-1"></i> Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="plans-card" aria-labelledby="monthly-plans-heading">
    <h2 id="monthly-plans-heading"><i class="fas fa-calendar-alt icon"></i> Monthly Plans</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
            <thead>
            <tr>
                <th scope="col">Plan ID</th>
                <th scope="col">Plan Name</th>
                <th scope="col">Price (LKR)</th>
                <th scope="col">Notes</th>
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
            </tr>
            <%
                    }
                }
                reader.close();
            } else {
            %>
            <tr>
                <td colspan="4" class="text-center text-warning">No plans found.</td>
            </tr>
            <%  }
            %>
            </tbody>
        </table>
    </div>
    <div class="text-center mt-5">
        <a href="index.jsp" class="btn btn-primary" aria-label="Go back to home page">Go Back</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>