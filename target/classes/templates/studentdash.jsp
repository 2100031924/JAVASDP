<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <!-- Include your CSS styles here -->
    <style>
        /* Add your CSS styles for layout here */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            height: 100%;
            background-color: #333;
            color: #fff;
            position: fixed; /* Keep the sidebar fixed */
            left: 0; /* Fixed to the left corner */
            top: 0; /* Fixed to the top corner */
            overflow-y: auto; /* Add scroll to the sidebar */
        }

        /* User Profile Styles */
        .user-profile {
            text-align: center;
            padding: 20px;
        }

        .user-profile img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }

        /* Sidebar Menu Styles */
        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px 0;
        }

        .sidebar ul li a {
            display: block;
            text-decoration: none;
            color: #fff;
            padding: 10px 20px;
            transition: background-color 0.3s; /* Add a smooth background color transition */
        }

        .sidebar ul li a:hover {
            background-color: #555; /* Change background color on hover */
        }

        /* Navbar Styles */
        .navbar {
            background-color: #444;
            color: #fff;
            padding: 10px;
            position: fixed; /* Keep the navbar fixed */
            top: 0; /* Fixed to the top corner */
            width: 100%; /* Full width */
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Main Content Styles */
        .content {
            flex: 1;
            overflow: auto;
            padding: 20px;
            margin-left: 250px; /* Push the content area to the right to accommodate the expanded sidebar */
        }

        /* Center the profile content */
        .profile-content {
            text-align: center;
        }

        /* Add additional CSS styles for profile content as needed */
    </style>
</head>
<body>
    <div class="sidebar">
        <!-- Sidebar content -->
        <div class="user-profile">
            <!-- Display user name and avatar -->
        </div>
        <ul>
            <li><a href="/courses">Courses</a></li>
            <li><a href="/homeassignments">Home Assignments</a></li>
            <li><a href="/student">Profile</a></li>
            <li><a href="/logout">Logout</a></li>
            <li><a href="/feepayments">Fee Payments</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="navbar">
		<span>Welcome, <span th:text="${user.username}">User</span></span>
            <!-- Include user settings and logout button -->
        </div>
        <div class="main-content">
            <!-- Content pages will be loaded here dynamically -->
        </div>
    </div>
</body>
</html>
