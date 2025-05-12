<%--&lt;%&ndash;<%@ page import="java.io.*" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!DOCTYPE html>&ndash;%&gt;--%>
<%--&lt;%&ndash;<html lang="en">&ndash;%&gt;--%>
<%--&lt;%&ndash;<head>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta charset="UTF-8">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta name="viewport" content="width=device-width, initial-scale=1.0">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <title>Plans List</title>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">&ndash;%&gt;--%>
<%--&lt;%&ndash;</head>&ndash;%&gt;--%>
<%--&lt;%&ndash;<body>&ndash;%&gt;--%>

<%--&lt;%&ndash;<div class="container mt-5">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="d-flex justify-content-between align-items-center mb-4">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <h2 class="mb-0 text-primary"><i class="bi bi-car-front"></i> Yearly plans</h2>&ndash;%&gt;--%>

<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="table-responsive">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <table class="table table-bordered table-hover text-center">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <thead class="table-dark">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Plan ID</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Plan</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Base Price(LKR)</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Addons(LKR)(LKR)</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Subtotal</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Discount</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <th>Final Price</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;            &lt;%&ndash;%>--%>
<%--&lt;%&ndash;                String filePath = "C:\\Users\\yuthi\\Desktop\\Add Member plans\\Plan.info\\yearly-plan.txt";&ndash;%&gt;--%>
<%--&lt;%&ndash;                File file = new File(filePath);&ndash;%&gt;--%>
<%--&lt;%&ndash;                if (file.exists()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    BufferedReader reader = new BufferedReader(new FileReader(file));&ndash;%&gt;--%>
<%--&lt;%&ndash;                    String line;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    while ((line = reader.readLine()) != null) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                        String[] data = line.split(",");&ndash;%&gt;--%>
<%--&lt;%&ndash;                        if (data.length == 7) {&ndash;%&gt;--%>
<%--&lt;%&ndash;            %>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[0] %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[1] %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[2] %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[3] %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[4] %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[5] %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <td><%= data[6] %></td>&ndash;%&gt;--%>


<%--&lt;%&ndash;            </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            &lt;%&ndash;%>--%>
<%--&lt;%&ndash;                        }&ndash;%&gt;--%>
<%--&lt;%&ndash;                    }&ndash;%&gt;--%>
<%--&lt;%&ndash;                    reader.close();&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>
<%--&lt;%&ndash;            %>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </table>&ndash;%&gt;--%>

<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="text-center mt-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <a href="index.jsp" class="btn btn-primary">Go Back</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

<%--&lt;%&ndash;<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>




<%--<%@ page import="java.io.*" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Plans List | Pulse Gym</title>--%>
<%--    <!-- Bootstrap 5 CSS -->--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <!-- Font Awesome for icons -->--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--%>
<%--    <!-- Google Fonts -->--%>
<%--    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">--%>
<%--    <link href="https://fonts.googleapis.com/css?family=Oswald:700&display=swap" rel="stylesheet">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background: #15171b;--%>
<%--            color: #e0e0e0;--%>
<%--            font-family: 'Poppins', sans-serif;--%>
<%--        }--%>
<%--        .navbar {--%>
<%--            background: #181c23 !important;--%>
<%--            border-bottom: 2px solid #1e7a53;--%>
<%--        }--%>
<%--        .navbar-brand {--%>
<%--            font-family: 'Oswald', sans-serif;--%>
<%--            font-size: 2rem;--%>
<%--            color: #1e7a53 !important;--%>
<%--        }--%>
<%--        h2 {--%>
<%--            font-family: 'Oswald', sans-serif;--%>
<%--            color: #1e7a53;--%>
<%--            margin-bottom: 32px;--%>
<%--        }--%>
<%--        .table {--%>
<%--            color: #e0e0e0;--%>
<%--            background: #181c23;--%>
<%--        }--%>
<%--        .table thead {--%>
<%--            background: #1e7a53;--%>
<%--        }--%>
<%--        .table thead th {--%>
<%--            color: #e0e0e0;--%>
<%--            border-bottom: none;--%>
<%--        }--%>
<%--        .table tbody tr:nth-of-type(odd) {--%>
<%--            background-color: #1a1d22;--%>
<%--        }--%>
<%--        .btn-primary {--%>
<%--            background: #1e7a53;--%>
<%--            border: none;--%>
<%--            font-weight: bold;--%>
<%--        }--%>
<%--        .btn-primary:hover {--%>
<%--            background: #27ef8c;--%>
<%--            color: #181c23;--%>
<%--        }--%>
<%--        .text-primary {--%>
<%--            color: #27ef8c !important;--%>
<%--        }--%>
<%--        .icon {--%>
<%--            font-size: 1.5rem;--%>
<%--            vertical-align: middle;--%>
<%--            margin-right: 8px;--%>
<%--        }--%>
<%--        .container {--%>
<%--            margin-top: 60px;--%>
<%--            margin-bottom: 40px;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<nav class="navbar navbar-expand-lg navbar-dark fixed-top">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="index.jsp">Pulse Gym</a>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="container">--%>
<%--    <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--        <h2 class="mb-0 text-primary"><i class="fas fa-list icon"></i> Yearly Plans</h2>--%>
<%--    </div>--%>
<%--    <div class="table-responsive">--%>
<%--        <table class="table table-bordered table-hover text-center align-middle">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>Plan ID</th>--%>
<%--                <th>Plan</th>--%>
<%--                <th>Base Price (LKR)</th>--%>
<%--                <th>Addons (LKR)</th>--%>
<%--                <th>Subtotal (LKR)</th>--%>
<%--                <th>Discount (%)</th>--%>
<%--                <th>Final Price (LKR)</th>--%>
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
<%--            </tr>--%>
<%--            <%--%>
<%--                    }--%>
<%--                }--%>
<%--                reader.close();--%>
<%--            } else {--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td colspan="7" class="text-center text-warning">No plans found.</td>--%>
<%--            </tr>--%>
<%--            <%  }--%>
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



<%--<%@ page import="java.io.*" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Yearly Plans | Pulse Gym</title>--%>
<%--    <!-- Bootstrap 5 CSS -->--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <!-- Font Awesome for icons -->--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--%>
<%--    <!-- Google Fonts -->--%>
<%--    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">--%>
<%--    <link href="https://fonts.googleapis.com/css?family=Oswald:700&display=swap" rel="stylesheet">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background: #15171b;--%>
<%--            color: #e0e0e0;--%>
<%--            font-family: 'Poppins', sans-serif;--%>
<%--        }--%>
<%--        .navbar {--%>
<%--            background: #181c23 !important;--%>
<%--            border-bottom: 2px solid #1e7a53;--%>
<%--            margin-bottom: 0;--%>
<%--        }--%>
<%--        .navbar-brand {--%>
<%--            font-family: 'Oswald', sans-serif;--%>
<%--            font-size: 2rem;--%>
<%--            color: #1e7a53 !important;--%>
<%--        }--%>
<%--        .plans-container {--%>
<%--            max-width: 1100px;--%>
<%--            margin: 40px auto 0 auto;--%>
<%--            padding: 32px 24px 24px 24px;--%>
<%--            background: #1a1d22;--%>
<%--            border-radius: 1rem;--%>
<%--            box-shadow: 0 4px 24px rgba(30,122,83,0.10);--%>
<%--        }--%>
<%--        h2 {--%>
<%--            font-family: 'Oswald', sans-serif;--%>
<%--            color: #1e7a53;--%>
<%--            margin-bottom: 28px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        .table {--%>
<%--            color: #e0e0e0;--%>
<%--            background: #181c23;--%>
<%--            margin-bottom: 0;--%>
<%--        }--%>
<%--        .table thead {--%>
<%--            background: #1e7a53;--%>
<%--        }--%>
<%--        .table thead th {--%>
<%--            color: #e0e0e0;--%>
<%--            border-bottom: none;--%>
<%--        }--%>
<%--        .table tbody tr:nth-of-type(odd) {--%>
<%--            background-color: #1a1d22;--%>
<%--        }--%>
<%--        .btn-primary {--%>
<%--            background: #1e7a53;--%>
<%--            border: none;--%>
<%--            font-weight: bold;--%>
<%--            border-radius: 0.5rem;--%>
<%--            padding: 8px 28px;--%>
<%--        }--%>
<%--        .btn-primary:hover {--%>
<%--            background: #27ef8c;--%>
<%--            color: #181c23;--%>
<%--        }--%>
<%--        .text-primary {--%>
<%--            color: #27ef8c !important;--%>
<%--        }--%>
<%--        .icon {--%>
<%--            font-size: 1.5rem;--%>
<%--            vertical-align: middle;--%>
<%--            margin-right: 8px;--%>
<%--        }--%>
<%--        @media (max-width: 1200px) {--%>
<%--            .plans-container {--%>
<%--                max-width: 98vw;--%>
<%--                padding: 16px 4px;--%>
<%--            }--%>
<%--        }--%>
<%--        @media (max-width: 600px) {--%>
<%--            .plans-container {--%>
<%--                padding: 8px 0;--%>
<%--            }--%>
<%--            h2 {--%>
<%--                font-size: 1.3rem;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<nav class="navbar navbar-expand-lg navbar-dark fixed-top">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="index.jsp">Pulse Gym</a>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="plans-container mt-5">--%>
<%--    <h2><i class="fas fa-list icon"></i>Yearly Plans</h2>--%>
<%--    <div class="table-responsive">--%>
<%--        <table class="table table-bordered table-hover text-center align-middle">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>Plan ID</th>--%>
<%--                <th>Plan</th>--%>
<%--                <th>Base Price (LKR)</th>--%>
<%--                <th>Addons (LKR)</th>--%>
<%--                <th>Subtotal (LKR)</th>--%>
<%--                <th>Discount (%)</th>--%>
<%--                <th>Final Price (LKR)</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <%--%>
<%--                String filePath = System.getProperty("user.home") + "/Hansana/yearly-plan.txt";--%>
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
<%--            </tr>--%>
<%--            <%--%>
<%--                    }--%>
<%--                }--%>
<%--                reader.close();--%>
<%--            } else {--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td colspan="7" class="text-center text-warning">No plans found.</td>--%>
<%--            </tr>--%>
<%--            <%  }--%>
<%--            %>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--    <div class="text-center mt-4">--%>
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
            max-width: 1100px;
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
        .text-primary {
            color: #27ef8c !important;
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
        @media (max-width: 1200px) {
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
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp" aria-label="Pulse Gym Home">Pulse Gym</a>
    </div>
</nav>

<div class="plans-card" aria-labelledby="yearly-plans-heading">
    <h2 id="yearly-plans-heading"><i class="fas fa-list icon"></i>Yearly Plans</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
            <thead>
            <tr>
                <th scope="col">Plan ID</th>
                <th scope="col">Plan</th>
                <th scope="col">Base Price (LKR)</th>
                <th scope="col">Addons (LKR)</th>
                <th scope="col">Subtotal (LKR)</th>
                <th scope="col">Discount (%)</th>
                <th scope="col">Final Price (LKR)</th>
            </tr>
            </thead>
            <tbody>
            <%
                String filePath = System.getProperty("user.home") + "/Hansana/yearly-plan.txt";
                File file = new File(filePath);
                if (file.exists()) {
                    BufferedReader reader = new BufferedReader(new FileReader(file));
                    String line;
                    int rowIndex = 0;
                    while ((line = reader.readLine()) != null) {
                        String[] data = line.split(",");
                        if (data.length == 7) {
            %>
            <tr style="--row-index: <%= rowIndex++ %>;">
                <td><%= data[0] %></td>
                <td><%= data[1] %></td>
                <td><%= data[2] %></td>
                <td><%= data[3] %></td>
                <td><%= data[4] %></td>
                <td><%= data[5] %></td>
                <td><%= data[6] %></td>
            </tr>
            <%
                    }
                }
                reader.close();
            } else {
            %>
            <tr>
                <td colspan="7" class="text-center text-warning">No plans found.</td>
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