<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalider la session
    HttpSession session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }

    // Redirection vers la page de connexion
    response.sendRedirect("login.jsp");
%>