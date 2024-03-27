<%
    // Invalidate the session
    session.setAttribute("name", "");
    session.setAttribute("type", "");

    // Redirect the user to the homepage
    response.sendRedirect("index.jsp");
%>