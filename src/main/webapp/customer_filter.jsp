<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer</title>
    <link rel="stylesheet" href="MainStyle.css">
            <script>
                var urlParams = new URLSearchParams(window.location.search);
                var error = urlParams.get('error');
                if (error === 'dates') {
                    alert("Error: select a date");
                } else if (error === 'invalid'){
                    alert("Error: invalid dates");
                }
            </script>
</head>
<body>

   <nav>
       <ul>
           <li><a href="index.jsp">Home</a></li>
           <li><a href="login.jsp">Login</a></li>
           <li><a href="customer_search.jsp">Search Rooms</a></li>
           <li><a href="about.jsp">About Us</a></li>
       </ul>
   </nav>

<h1> Search for rooms</h1>
<div class="box_container">
    <form id="combinedForm" method="post" class = "formstuff">

    <label for="roomtypebox" class="labelbox">Room Size:</label>
    <select id="roomtypebox" name="roomtypebox">
      <option value="any">Any</option>
      <option value="Single">Single</option>
      <option value="Double">Double</option>
      <option value="Queen">Queen</option>
      <option value="King">King</option>
      <option value="Suite">Suite</option>
    </select><br>

    <label for="hotelbrandbox" class="labelbox">Hotel Chain:</label>
    <select id="hotelbrandbox" name="hotelbrandbox">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
    </select><br>

    <label for="numberroomsbox" class="labelbox">Minimum Number of Rooms:</label>
    <select id="numberroomsbox" name="numberroomsbox">
      <option value="0">Any</option>
      <option value="2">2 rooms</option>
      <option value="4">4 rooms</option>
      <option value="6">6 rooms</option>
      <option value="8">8 rooms</option>
      <option value="10">10 rooms</option>
      <option value="12">12 rooms</option>
      <option value="14">14 rooms</option>
      <option value="16">16 rooms</option>
    </select><br>

    <label for="pricebox" class="labelbox">Max Price:</label>
    <select id="pricebox" name="pricebox">
      <option value="1000">Any</option>
      <option value="100">$100</option>
      <option value="200">$200</option>
      <option value="300">$300</option>
      <option value="400">$400</option>
      <option value="500">$500</option>
    </select><br>

    <label for="categorybox" class="labelbox">Stars:</label>
    <select id="categorybox" name="categorybox">
      <option value="1">1 Star</option>
      <option value="2">2 Star</option>
      <option value="3">3 Star</option>
      <option value="4">4 Star</option>
      <option value="5">5 Star</option>
    </select><br>

    <label for="checkInDate" class="labelbox">Check-In Date:</label>
    <input type="date" id="checkInDate" name="checkInDate"><br><br>

    <label for="checkOutDate" class="labelbox">Check-Out Date:</label>
    <input type="date" id="checkOutDate" name="checkOutDate"><br><br>

   <button type="submit" class="submitbutton">Submit</button>
       </form>
</div>
<div class='button-container1'>
    <button onclick="window.location.href='customer_search.jsp'" class="button1"> Go back</button>
</div>

<%
    session.setAttribute("filter", "no");

    if(session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form data from the request
        String roomType = request.getParameter("roomtypebox");
        int hotelChain = Integer.parseInt(request.getParameter("hotelbrandbox"));
        int totalRooms = Integer.parseInt(request.getParameter("numberroomsbox"));
        double price = Double.parseDouble(request.getParameter("pricebox"));
        int stars = Integer.parseInt(request.getParameter("categorybox"));
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");

        if (Objects.isNull(checkInDate) || Objects.isNull(checkOutDate) || checkInDate.isEmpty() || checkOutDate.isEmpty()) {
              response.sendRedirect("customer_filter.jsp?error=dates");
              return;
        }

        LocalDate formattedCheckIn = LocalDate.parse(checkInDate);
        LocalDate formattedCheckOut = LocalDate.parse(checkOutDate);

        LocalDate currentDate = LocalDate.now();

        if (formattedCheckIn.isBefore(currentDate) || formattedCheckOut.isBefore(currentDate)) {
            response.sendRedirect("customer_filter.jsp?error=invalid");
            return;
        }

        if (formattedCheckOut.isBefore(formattedCheckIn)) {
             response.sendRedirect("customer_filter.jsp?error=invalid");
             return;
        }

        Date formattedCheckIn1 = java.sql.Date.valueOf(checkInDate);
        Date formattedCheckOut1 = java.sql.Date.valueOf(checkOutDate);

        session.setAttribute("filter", "yes");
        session.setAttribute("room", roomType);
        session.setAttribute("star", stars);
        session.setAttribute("chainid", hotelChain);
        session.setAttribute("price", price);
        session.setAttribute("total", totalRooms);
        session.setAttribute("indate", formattedCheckIn1);
        session.setAttribute("outdate", formattedCheckOut1);

        response.sendRedirect("customer_filter_search.jsp");
    }
%>
</body>
</html