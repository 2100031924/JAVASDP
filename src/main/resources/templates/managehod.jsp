<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

    </style>
</head>
<body>

<div class="wrapper">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="profile">
            <img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
            <h3>Admin Dashboard!</h3>
            <p>Hello Admin</p>
        </div>
        <ul>
        <li>
                    <a href="/admin/dashboard" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="/managestudents">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">Manage Student</span>
                    </a>
                </li>
                <li>
                    <a href="/addstd">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">Add Student</span>
                    </a>
                </li>
                                <li>
                    <a href="/add-faculty">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Add Faculty</span>
                    </a>
                </li>
                <li>
                    <a href="/managefaculty">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">Manage Faculty</span>
                    </a>
                </li>
                  <li>
                    <a href="/add-hod">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">Add HOD's</span>
                    </a>
                </li>

                <li>
                    <a href="/managehod">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Manage Hod's</span>
                    </a>
                </li>
              
                <li>
                    <a href="/managecourse">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Manage Courses</span>
                    </a>
                </li>
                 <li>
                    <a href="/add-course">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Add Courses</span>
                    </a>
                </li>
                <li>
                    <a href="#users">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Manage Users</span>
                    </a>
                </li>
                 <li>
                    <a href="/logout">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Logout</span>
                    </a>
                </li>
            <!-- Sidebar menu items here -->
        </ul>
    </div>
    <!-- Main Content -->
    <div class="main-content">
        <!-- Card to display content -->
        <div class="card">
            <div class="card-header">
                <h3>Content Title</h3>
            </div>
            <div class="card-body">
                <!-- Content goes here -->
 <div class="main-content">
            <h1>Manage HOD</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Department</th>
                        <!-- Add more table headers as needed -->
                    </tr>
                </thead>
                <tbody>
                    <!-- Use Thymeleaf each loop to populate HOD data from the server-side -->
                    <tr th:each="hod : ${hodList}">
                        <td th:text="${hod.id}">ID</td>
                        <td th:text="${hod.firstName}">First Name</td>
                        <td th:text="${hod.lastName}">Last Name</td>
                        <td th:text="${hod.department}">Department</td>
                        <!-- Add more table data as needed -->
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

* {
    list-style: none;
    text-decoration: none;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Open Sans', sans-serif;
}
.dashboard-charts {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .dashboard-chart {
            width: 45%;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
         table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }

    /* Style the table headers */
    th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
        padding: 10px;
        text-align: left;
    }

    /* Style the table rows alternately for better readability */
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    /* Style the table data cells */
    td {
        padding: 10px;
    }

        .dashboard-elements {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

.wrapper .sidebar ul li a {
    display: block;
    padding: 13px 30px;
    border-bottom: 1px solid #10558d;
    color: rgb(241, 237, 237);
    font-size: 16px;
    position: relative;
}

.wrapper .sidebar ul li a .icon {
    color: #dee4ec;
    width: 30px;
    display: inline-block;
}

.wrapper .sidebar .profile {
    margin-bottom: 30px;
    text-align: center;
}

.wrapper .sidebar ul li a:hover,
.wrapper .sidebar ul li a.active {
    color: #0c7db1;
    background: white;
    border-right: 2px solid rgb(5, 68, 104);
}

.wrapper .sidebar ul li a:hover .icon,
.wrapper .sidebar ul li a.active .icon {
    color: #0c7db1;
}

.wrapper .sidebar ul li a:hover:before,
.wrapper .sidebar ul li a.active:before {
    display: block;
}

.wrapper .sidebar .profile img {
    display: block;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin: 0 auto;
}

.wrapper .sidebar .profile h3 {
    color: #ffffff;
    margin: 10px 0 5px;
}

.wrapper .sidebar .profile p {
    color: rgb(206, 240, 253);
    font-size: 14px;
}

body {
    background: #f5f6fa;
}

.wrapper {
    display: flex; /* Display sidebar and main content side by side */
}

.wrapper .sidebar {
    background: rgb(5, 68, 104);
    width: 225px;
    height: 100%;
    padding: 20px 0;
    transition: all 0.5s ease;
}

.main-content {
    flex: 1; /* Take up remaining available space */
    padding: 20px;
}

.card {
    background: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px;
}

.card-header {
    background: #f2f2f2;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.card-body {
    padding: 10px;
}
</style>
