<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dao.BidDao, models.BuyerBidDTO" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("LogIn.jsp"); return;
    }
    
    List<BuyerBidDTO> myBids = new BidDao().getBidsByBuyer(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bids & Orders</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/my_bids.css">
</head>
<body>


<div class="mb-page">
    <div class="mb-header">
        <h1>My Bids & Orders</h1>
        <p>Track the status of your offers. If accepted, you can proceed to checkout.</p>
    </div>

    <div class="mb-list">
        <% if (myBids.isEmpty()) { %>
            <div style="text-align: center; padding: 4rem; border: 1px dashed rgba(255,255,255,0.2); border-radius: 8px;">
                <h2 style="font-weight: 500; color: #FBF6EE;">Your cart is empty</h2>
                <p style="margin: 1rem 0 2rem; color: rgba(255,255,255,0.5);">Explore the marketplace and place your first bid.</p>
                <a href="marketplace.jsp" class="mb-btn mb-btn-success" style="width: auto;">Explore Marketplace</a>
            </div>
        <% } else { %>
            
            <% for (BuyerBidDTO bid : myBids) { %>
                <div class="mb-card">
                    <div class="mb-image">
                        <% if (bid.getImageUrl() != null && !bid.getImageUrl().isEmpty()) { %>
                            <img src="<%= bid.getImageUrl() %>" alt="Cover">
                        <% } else { %>
                            <span class="mb-placeholder">📚</span>
                        <% } %>
                    </div>

                    <div class="mb-details">
                        <h3><%= bid.getBookTitle() %></h3>
                        <p>Seller: <span class="seller">@<%= bid.getSellerName() %></span></p>
                        
                        <% if ("Rejected".equals(bid.getStatus())) { %>
                            <p style="color: #E0A79C; margin-top: 0.5rem; font-size: 0.8rem;">Seller rejected this offer. Try bidding higher.</p>
                        <% } else if ("Accepted".equals(bid.getStatus())) { %>
                            <p style="color: #8DAA9D; margin-top: 0.5rem; font-size: 0.8rem;">Offer accepted! Ready for checkout.</p>
                        <% } %>
                    </div>

                    <div class="mb-action-area">
                        <div class="mb-amount-label">Your Offer</div>
                        <div class="mb-amount">&#8377;<%= String.format("%.0f", bid.getAmount()) %></div>


                        <% if ("Pending".equals(bid.getStatus())) { %>
                            <div class="mb-btn mb-btn-pending">Waiting for Seller</div>
                            
                        <% } else if ("Accepted".equals(bid.getStatus())) { %>
                            <a href="#" class="mb-btn mb-btn-success">Proceed to Buy</a>
                            
                        <% } else if ("Rejected".equals(bid.getStatus())) { %>

                            <a href="book_details.jsp?lid=<%= bid.getLid() %>" class="mb-btn mb-btn-danger">Bid Higher</a>
                        <% } %>
                    </div>
                </div>
            <% } %>

        <% } %>
    </div>
</div>

<jsp:include page="../components/Footer.jsp" />

</body>
</html>