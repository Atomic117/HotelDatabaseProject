
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="MainStyle.css">
</head>
<body>

<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="searchforrooms.jsp">Rent</a></li>
        <li><a href="about.jsp">About Us</a></li>
    </ul>
</nav>

<h1> Hotel Booking Website</h1>
<div class="image-container">
    <img src="img/hotelimage_0.jpg" alt="Image 1" width ="500" height = "300">
    <img src="img/hotelimage_1.jpg" alt="Image 2" width ="500" height = "300">
    <img src="img/hotelimage_2.jpg" alt="Image 3" width ="500" height = "300">
</div>

    <div class="button-container1">

        <form action="login.jsp">
            <button type="submit" class="button1">Login</button>
        </form>

        <form action="searchforrooms.jsp">
            <button type="submit" class="button1">Search for Rooms</button>
        </form>
    </div>

<p> Welcome to the Hotel Booking Website! If you want to view rooms, click Search for Rooms. If you would like to rent, please Login </p>
</body>
</html>