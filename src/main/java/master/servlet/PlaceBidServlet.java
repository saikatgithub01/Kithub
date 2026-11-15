package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.BidDao;

@WebServlet("/PlaceBidServlet")
public class PlaceBidServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("pages/LogIn.jsp");
            return;
        }

        try {
            int lid = Integer.parseInt(request.getParameter("lid"));
            double amount = Double.parseDouble(request.getParameter("bid_amount"));
            
            BidDao dao = new BidDao();
            dao.placeBid(lid, userId, amount);

            response.sendRedirect("pages/my_bids.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/marketplace.jsp");
        }
    }
}