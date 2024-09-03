<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Student Profile</title>
    <style>
        /* Your CSS styles for layout */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
        }
        .container {
            background-color: #fff;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
        }
        .form-group {
            margin: 10px 0;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-top: 5px;
        }
        .button-container {
            text-align: center;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <!-- Sidebar content -->
        
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
        <div class="profile-content">
            <h1>Student Profile</h1>
            <form action="" method="post">
                <div class="form-group" th:if="${student}">
                    <label>ID:</label>
                    <input type="text" th:value="${student.id}" disabled>
                </div>
                <div class="form-group">
                    <label>First Name:</label>
                    <input type="text" th:value="${student.firstName}" disabled>
                </div>
                <div class="form-group">
                    <label>Last Name:</label>
                    <input type="text" th:value="${student.lastName}" disabled>
                </div>
                <div class="form-group">
                    <label>Year:</label>
                    <input type="text" th:value="${student.year}" disabled>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
