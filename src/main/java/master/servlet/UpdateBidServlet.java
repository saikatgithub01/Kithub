package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BidDao;

@WebServlet("/UpdateBidServlet")
public class UpdateBidServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer sellerPid = (Integer) session.getAttribute("sellerProfileId");
        if (sellerPid == null) sellerPid = 1;

        try {
            int bidId = Integer.parseInt(request.getParameter("bid"));
            String status = request.getParameter("status");

            if ("Accepted".equalsIgnoreCase(status) || "Rejected".equalsIgnoreCase(status)) {
                BidDao dao = new BidDao();
                dao.updateBidStatus(bidId, status, sellerPid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("pages/Seller_Dashboard.jsp#offers");
    }
}