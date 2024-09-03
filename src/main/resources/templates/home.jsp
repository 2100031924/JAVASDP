<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Navigation Bar</title>
    <style type="text/css">
        * {
            text-decoration: none;
        }

        .navbar {
            background: crimson;
            font-family: calibri;
            padding-right: 15px;
            padding-left: 15px;
            position: relative; /* Add relative positioning */
        }

        .navdiv {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo a {
            font-size: 35px;
            font-weight: 600;
            color: white;
        }

        .logo img {
            max-height: 50px; /* Adjust the maximum height as needed */
            margin-right: 10px; /* Add some spacing between the logo and text */
        }

        li {
            list-style: none;
            display: inline-block;
        }

        li a {
            color: white;
            font-size: 18px;
            font-weight: bold;
            margin right: 25px;
        }

        button {
            background-color: black;
            margin-left: 10px;
            border-radius: 10px;
            padding: 10px;
            width: 90px;
        }

        button a {
            color: white;
            font-weight: bold;
            font-size: 15px;
        }

        /* Add hover effect */
        button:hover {
            background-color: white;
        }

        button:hover a {
            color: black;
        }

        /* Style for the card */
        .card {
            background: white; /* Change the background color to white */
            color: white;
            padding: 20px;
            border-radius: 50%; /* Make it circular */
            position: absolute;
            top: 50%; /* Position it in the center vertically */
            left: 50%; /* Position it in the center horizontally */
            transform: translate(-50%, -50%); /* Center it perfectly */
            width: 150px; /* Set a smaller value for width and height to make it smaller */
            height: 150px;
            overflow: hidden; /* Hide any content that goes beyond the circular shape */
            box-shadow: 0 0 10px 5px crimson, 0 0 20px 10px gold; /* Add mixed colors border */
        }

        /* Style for the circular logo image within the card */
        .logo-in-card {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Style for the image */
        img {
            width: 100%; /* Set the image width to 100% of its container */
            height: auto; /* Maintain the image's aspect ratio */
        }

        /* Style for the larger card */
        .larger-card {
            background: white; /* Change the background color to white */
            color: white;
            padding: 20px;
            border-radius: 50%; /* Make it circular */
            position: absolute;
            top: 70%; /* Adjust the position */
            left: 50%; /* Position it in the center horizontally */
            transform: translate(-50%, -50%); /* Center it perfectly */
            width: 250px; /* Set a larger width and height */
            height: 250px;
            overflow: hidden; /* Hide any content that goes beyond the circular shape */
            box-shadow: 0 0 15px 5px gold, 0 0 25px 10px crimson; /* Add mixed colors border */
        }/* Style for the circular logo image within the larger card */
        .logo-in-larger-card {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
                /* Footer Container */
        .footer {
            background-color: #0a4275;
            color: #fff;
            padding: 30px 0;
        }

        /* Footer Content */
        .footer-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        /* Footer Sections */
        .footer-section {
            flex: 1;
            margin: 0 20px;
        }

        /* Footer Links */
        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin: 8px 0;
        }

        .footer-links a {
            color: #fff;
            text-decoration: none;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        /* Copyright Section */
        .copyright {
            background-color: rgba(0, 0, 0, 0.2);
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navdiv">
            <div class="logo">
                <a href="#">KL UNIVERSITY</a>
            </div>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
                <button><a href="/login">SignIn</a></button>
                <button><a href="#">SignUp</a></button>
            </ul>
        </div>
    </nav>

    <!-- Circular card with logo image linked to the login page -->
    <a href="/login">
        <div class="card">
            <img class="logo-in-card" src="kl-university-logo.jpg" alt="Logo">
        </div>
    </a>

    <!-- Larger circular card with logo image */
    <div class="larger-card">
        <img class="logo-in-larger-card" src="kl2.jpeg" alt="Logo">
    </div>

    <!-- Image below the cards and navbar -->
    <img src="pang-yuhao-_kd5cxwZOK4-unsplash.jpg" alt="Image Description">
</body>
<footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <ul class="footer-links">
                    <li><a href="#">Admission</a></li><br>
                    <li><a href="#">Facaulty</a></li><br>                    <li><a href="#">Leadership</a></li>
                    <li><a href="#">Domains</a></li><br>                </ul>
            </div>
            <div class="footer-section">
                <h3>Academics</h3>
                <ul class="footer-links">
                    <li><a href="#">CSE-H</a></li><br>                    <li><a href="#">Admissions</a></li>
                    <li><a href="#">CSE</a></li><br>                    <li><a href="#">Library</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Campus Life</h3>
                <ul class="footer-links">
                    <li><a href="#">Environment</a></li><br>                    <li><a href="#">Events</a></li>
                    <li><a href="#">Campus Life</a></li><br>                </ul>
            </div>
        </div>
        <div class="copyright">
            © 2023 Kl university. All rights reserved.
        </div>
    </footer>
</html>