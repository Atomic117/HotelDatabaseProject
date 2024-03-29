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

    <label for="pricebox" class="labelbox">Max Price:</label>
    <select id="pricebox" name="pricebox">
      <option value="1000">Any</option>
      <option value="100">$100</option>
      <option value="200">$200</option>
      <option value="300">$300</option>
      <option value="400">$400</option>
      <option value="500">$500</option>
    </select><br>

    <label for="checkOutDate" class="labelbox">Check-Out Date:</label>
    <input type="date" id="checkOutDate" name="checkOutDate"><br><br>

   <button type="submit" class="submitbutton">Submit</button>
       </form>
</div>
<div class='button-container1'>
    <button onclick="window.location.href='employee.jsp'" class="button1"> Go back</button>
</div>

<%
    session.setAttribute("filter1", "no");


     if(session.getAttribute("type").equals("customer")){
         response.sendRedirect("customer.jsp");
     } else if (session.getAttribute("type").equals("admin")){
         response.sendRedirect("admin.jsp");
     } else if (session.getAttribute("type").equals("employee")){

     } else {
        response.sendRedirect("index.jsp");
     }


    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form data from the request
        String roomType = request.getParameter("roomtypebox");
        double price = Double.parseDouble(request.getParameter("pricebox"));
        String checkOutDate = request.getParameter("checkOutDate");

        if (Objects.isNull(checkOutDate) || checkOutDate.isEmpty()) {
              response.sendRedirect("employee_filter.jsp?error=dates");
              return;
        }

        LocalDate formattedCheckOut = LocalDate.parse(checkOutDate);
        LocalDate currentDate = LocalDate.now();

        if (formattedCheckOut.isBefore(currentDate)) {
            response.sendRedirect("employee_filter.jsp?error=invalid");
            return;
        }

        Date formattedCheckOut1 = java.sql.Date.valueOf(checkOutDate);

        session.setAttribute("filter1", "yes");
        session.setAttribute("room1", roomType);
        session.setAttribute("price1", price);
        session.setAttribute("outdate1", formattedCheckOut1);

        response.sendRedirect("employee_search.jsp");
    }
%>
</body>
</html