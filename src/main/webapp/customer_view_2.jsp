<%@ page import="com.demo.ViewService" %>
<%@ page import="com.demo.View2" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer</title>
    <link rel="stylesheet" href="MainStyle.css">
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

<%
     if (session.getAttribute("type").equals("employee")){
         response.sendRedirect("employee.jsp");
     } else if (session.getAttribute("type").equals("admin")){
         response.sendRedirect("admin.jsp");
     }
 %>

 <%
     ViewService service = new ViewService();
     ArrayList<View2> viewList = null;

     try {
         viewList = service.displayView2();
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("customer_view_error.jsp");
     }
 %>

 <h2>Total capacity per Hotel</h2>
 <div>
     <%
         if (viewList != null && !viewList.isEmpty()) {
             for (View2 currentView : viewList) {
     %>
     <div class="room-container">
         <ul class="room-info">
             <li><span>Hotel ID: </span> <%= currentView.getHotelID() %></li>
             <li><span>Total Capacity: </span> <%= currentView.getTotal_capacity() %></li>
         </ul>
     </div>
     <%
             }
         } else {
             out.println("<p>No views found.</p>");
         }
     %>
 </div>

 <div class="button-container1">
     <form action="customer_search.jsp">
         <button type="submit" class="button1">Go back</button>
     </form>
 </div>


  </body>
  </html>