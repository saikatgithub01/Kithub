package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("pass");


        UserDao udao = new UserDao();
        String[] userData = udao.loginUser(email, password);

        if (userData != null) {

            HttpSession session = request.getSession();
            session.setAttribute("userId", Integer.parseInt(userData[0]));
            session.setAttribute("userName", userData[1]);
            session.setAttribute("userEmail", userData[2]);


            response.sendRedirect("pages/Dashboard.jsp");
        } else {

            response.sendRedirect("pages/LogIn.jsp?error=invalid");
        }
    }
}