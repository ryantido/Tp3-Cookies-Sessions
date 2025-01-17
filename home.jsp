<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.Arrays" %>
<%
    // Vérification de la présence du cookie
    Cookie[] cookies = request.getCookies();
    String userLogin = null;

    if (cookies != null) {
        userLogin = Arrays.stream(cookies)
                          .filter(cookie -> "userLogin".equals(cookie.getName()))
                          .map(Cookie::getValue)
                          .findFirst()
                          .orElse(null);
    }

    if (userLogin == null) {
        response.sendRedirect("login.jsp");
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