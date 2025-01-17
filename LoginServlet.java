import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String CORRECT_LOGIN = "admin";
    private static final String CORRECT_PASSWORD = "password123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (CORRECT_LOGIN.equals(login) && CORRECT_PASSWORD.equals(password)) {
            // Crée un cookie avec une durée de vie de 2 minutes
            Cookie loginCookie = new Cookie("userLogin", login);
            loginCookie.setMaxAge(2 * 60); // 2 minutes
            response.addCookie(loginCookie);

            // Redirection vers la page d'accueil
            response.sendRedirect("home.jsp");
        } else {
            // Redirection vers login avec un message d'erreur
            request.setAttribute("error", "Login ou mot de passe incorrect.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}