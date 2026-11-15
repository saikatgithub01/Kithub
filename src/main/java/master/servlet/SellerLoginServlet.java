package master.servlet;

import java.io.IOException;

import dao.SellerDao;
import models.SellerProfile;
import javax.servlet.ServletException; // Use javax.servlet if Tomcat 9
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SellerLoginServlet")
public class SellerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String sellerUname = request.getParameter("seller_username");
        String kspId       = request.getParameter("seller_unique_id");

        if (sellerUname == null || kspId == null 
                || sellerUname.trim().isEmpty() || kspId.trim().isEmpty()) {
            response.sendRedirect("pages/seller_login.jsp?error=empty");
            return;
        }

        SellerDao dao = new SellerDao();
        SellerProfile sp = dao.loginSeller(sellerUname.trim(), kspId.trim());

        if (sp != null) {
            // Success: Store seller details in session
            HttpSession session = request.getSession();
            session.setAttribute("sellerProfileId", sp.getSellerPid());
            session.setAttribute("sellerUsername", sp.getSellerUname());
            session.setAttribute("sellerUniqueId", sp.getSellerUniqueId());

            response.sendRedirect("pages/Seller_Dashboard.jsp");
        } else {
            // Failure: Redirect back to seller login with error
            response.sendRedirect("pages/seller_login.jsp?error=invalid");
        }
    }
}