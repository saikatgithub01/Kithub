package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("nm");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String password = request.getParameter("pass");

        UserDao udao = new UserDao();
        boolean isRegistered = udao.registerUser(name, email, city, password);

        if (isRegistered) {
            response.sendRedirect("pages/LogIn.jsp?signup=success");
        } else {
            response.sendRedirect("pages/SignUp.jsp?error=failed");
        }

    }
}
