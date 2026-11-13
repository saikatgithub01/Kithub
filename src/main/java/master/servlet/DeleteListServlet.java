package master.servlet;

import java.io.IOException;
import dao.ListingsDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteListingServlet")
public class DeleteListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer sellerPid = (Integer) session.getAttribute("sellerProfileId");
        if (sellerPid == null) sellerPid = 1;

        try {
            int lid = Integer.parseInt(request.getParameter("lid"));
            new ListingsDao().deleteListing(lid, sellerPid);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.sendRedirect("seller_dashboard.jsp");
    }
}