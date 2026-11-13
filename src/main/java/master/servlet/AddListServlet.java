package master.servlet;

import java.io.IOException;
import dao.ListingsDao;
import models.Listing;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddListServlet")
public class AddListServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer sellerPid = (Integer) session.getAttribute("sellerProfileId");
        if (sellerPid == null) {
            sellerPid = 1; 
        }

        try {
            double minPrice = Double.parseDouble(request.getParameter("min_price"));
            double maxPrice = Double.parseDouble(request.getParameter("max_price"));

            if (minPrice > maxPrice) {
                response.sendRedirect("add_book.jsp?error=invalid_price");
                return;
            }

            Listing l = new Listing();
            l.setSellerPid(sellerPid);
            l.setItemType(request.getParameter("item_type"));
            l.setListingType(request.getParameter("listing_type"));
            l.setTitle(request.getParameter("title").trim());
            l.setAuthor(request.getParameter("author"));
            l.setGenre(request.getParameter("genre"));
            l.setDescription(request.getParameter("description"));
            l.setImageUrl(request.getParameter("image_url"));
            l.setMinPrice(minPrice);
            l.setMaxPrice(maxPrice);

            String lendDur = request.getParameter("lend_dur_days");
            if (lendDur != null && !lendDur.trim().isEmpty()) {
                l.setLendDurDays(Integer.parseInt(lendDur));
            }

            new ListingsDao().addListing(l);
            response.sendRedirect("seller_dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_book.jsp?error=1");
        }
    }

}
