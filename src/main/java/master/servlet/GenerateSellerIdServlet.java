package master.servlet;

import java.io.IOException;
import dao.SellerDao;
import utilities.SellerIdGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/GenerateSellerIdServlet")
public class GenerateSellerIdServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        HttpSession session = request.getSession();


	        if (session.getAttribute("userEmail") == null) {
	            response.sendRedirect("pages/LogIn.jsp");
	            return;
	        }

	        String sellerUname = request.getParameter("seller_username");
	        if (sellerUname == null || sellerUname.trim().length() < 3) {
	            session.setAttribute("sellerError", "Username must be at least 3 characters");
	            response.sendRedirect("pages/seller_signup.jsp");
	            return;
	        }

	        SellerDao dao = new SellerDao();

	        if (dao.isUsernameTaken(sellerUname.trim())) {
	            session.setAttribute("sellerError", "That seller username is already taken");
	            response.sendRedirect("pages/seller_signup.jsp");
	            return;
	        }


	        String kspId = null;
	        for (int i = 0; i < 5; i++) {
	            String candidate = SellerIdGenerator.generateKspId();
	            if (!dao.isKspIdTaken(candidate)) {
	                kspId = candidate;
	                break;
	            }
	        }

	        if (kspId == null) {
	            session.setAttribute("sellerError", "Could not generate ID. Please try again.");
	            response.sendRedirect("pages/seller_signup.jsp");
	            return;
	        }

	        session.setAttribute("pendingSellerUsername", sellerUname.trim());
	        session.setAttribute("pendingSellerUniqueId", kspId);
	        session.removeAttribute("sellerError");

	        response.sendRedirect("pages/seller_signup.jsp");
	    }
	}

