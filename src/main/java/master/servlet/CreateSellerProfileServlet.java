package master.servlet;

import java.io.IOException;
import dao.SellerDao;
import models.SellerProfile;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CreateSellerProfileServlet")
public class CreateSellerProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("pages/LogIn.jsp");
            return;
        }

        String pendingUname = (String) session.getAttribute("pendingSellerUsername");
        String pendingId    = (String) session.getAttribute("pendingSellerUniqueId");


        if (pendingUname == null || pendingId == null) {
            session.setAttribute("sellerError", "Please generate your KSP ID first");
            response.sendRedirect("pages/seller_signup.jsp");
            return;
        }

        SellerDao dao = new SellerDao();
        int userId = dao.getUserIdByEmail(userEmail);
        if (userId == -1) {
            response.sendRedirect("pages/LogIn.jsp");
            return;
        }

        SellerProfile sp = new SellerProfile();
        sp.setUserId(userId);
        sp.setSellerUname(pendingUname);
        sp.setSellerUniqueId(pendingId);

        int newSellerPid = dao.createSellerProfile(sp);

        if (newSellerPid > 0) {

            session.removeAttribute("pendingSellerUsername");
            session.removeAttribute("pendingSellerUniqueId");
            session.removeAttribute("sellerError");

            session.setAttribute("newKspId", pendingId);
            session.setAttribute("newKspUsername", pendingUname);

            response.sendRedirect("pages/ksp_success.jsp");
        } else {
            session.setAttribute("sellerError", "Could not create profile. Please try again.");
            response.sendRedirect("pages/seller_signup.jsp");
        }
    }
}