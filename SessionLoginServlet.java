import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionLoginServlet")
public class SessionLoginServlet extends HttpServlet {
    private static final String CORRECT_LOGIN = "admin";
    private static final String CORRECT_PASSWORD = "password123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (CORRECT_LOGIN.equals(login) && CORRECT_PASSWORD.equals(password)) {
            // Création de la session
            HttpSession session = request.getSession();
            session.setAttribute("userLogin", login);

            // Redirection vers la page d'accueil
            response.sendRedirect("home.jsp");
        } else {
            // Redirection vers login avec un message d'erreur
            request.setAttribute("error", "Login ou mot de passe incorrect.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}