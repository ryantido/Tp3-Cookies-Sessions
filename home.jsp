<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Récupération de la session
    HttpSession session = request.getSession(false);
    String userLogin = null;

    if (session != null) {
        userLogin = (String) session.getAttribute("userLogin");
    }

    if (userLogin == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue, <%= userLogin %>!</h1>
        <p>Vous êtes connecté avec succès.</p>
        <a href="logout.jsp">Se déconnecter</a>
    </div>
</body>
</html>