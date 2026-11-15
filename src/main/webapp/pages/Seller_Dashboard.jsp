<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dao.ListingsDao, models.Listing, models.OfferDTO" %>
<%
    HttpSession s = request.getSession();
    String sellerUsername = (String) s.getAttribute("sellerUsername");
    Integer sellerPid = (Integer) s.getAttribute("sellerProfileId");

    if (sellerUsername == null) sellerUsername = "Seller"; 
    if (sellerPid == null) sellerPid = 1; 

    ListingsDao dao = new ListingsDao();
    List<Listing> listings = dao.getSellerListings(sellerPid);
    List<OfferDTO> offers = dao.getSellerOffers(sellerPid);
    
    boolean hasListings = !listings.isEmpty(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSP - Seller Dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/seller_dashboard.css">
</head>
<body>

<div class="ksp-page">
    <div class="ksp-bg"></div>
    <div class="ksp-overlay"></div>

    <nav class="ksp-nav">
        <a href="seller_dashboard.jsp" class="brand">Kithub<span>.</span></a>
        <a href="Dashboard.jsp" class="ksp-nav-link">Switch to Buyer Dashboard</a>
    </nav>

    <main class="ksp-main">
        <header class="ksp-hello">
            <div>
                <h1>Namaste, KS <span><%= sellerUsername %></span></h1>
                <p>Manage your inventory, set price ranges, and finalize offers.</p>
            </div>
            <a href="Seller_add_list.jsp" class="ksp-btn">Add New Listing</a>
        </header>

        <% if (!hasListings) { %>
            <section style="text-align: center; padding: 5rem 2rem; border: 1px dashed rgba(243, 230, 210, 0.2); border-radius: 12px;">
                <h2 style="font-weight: 500; font-size: 1.5rem; color: #FBF6EE;">Your inventory is empty</h2>
                <p style="margin: 1rem 0 2rem; color: rgba(247, 241, 232, 0.5);">List your first item to start receiving offers from buyers.</p>
                <a href="Seller_add_list.jsp" class="ksp-btn">Create First Listing</a>
            </section>
        <% } else { %>

            <section>
                <div class="ksp-section-head">
                    <h2>Active Listings</h2>
                </div>
                
                <div class="ksp-grid">
                    <% for (Listing l : listings) { %>
                        <article class="ksp-card">
                            <div class="ksp-card-header">
                                <span class="ksp-type"><%= l.getItemType() %> &middot; <%= (l.getGenre() != null && !l.getGenre().isEmpty()) ? l.getGenre() : "General" %></span>
                                
                                <% if ("Lend".equals(l.getListingType())) { %>
                                    <span class="ksp-tag ksp-tag-lend">Lend</span>
                                <% } else { %>
                                    <span class="ksp-tag">Sale</span>
                                <% } %>
                            </div>
                            
                            <h3><%= l.getTitle() %></h3>
                            <p class="ksp-card-author"><%= (l.getAuthor() != null && !l.getAuthor().isEmpty()) ? l.getAuthor() : "Unknown Author" %></p>

                            <div class="ksp-price-box">
                                <small><%= "Lend".equals(l.getListingType()) && l.getLendDurDays() != null ? l.getLendDurDays() + " Days Range" : "Accepted Range" %></small>
                                <strong>&#8377;<%= String.format("%.0f", l.getMinPrice()) %> &ndash; &#8377;<%= String.format("%.0f", l.getMaxPrice()) %></strong>
                            </div>

                            <div class="ksp-card-actions">
                                <% if (l.getOfferCount() > 0) { %>
                                    <a href="#offers" class="ksp-btn ksp-btn-ghost ksp-btn-small">Offers (<%= l.getOfferCount() %>)</a>
                                <% } else { %>
                                    <a href="#offers" class="ksp-btn ksp-btn-ghost ksp-btn-small" style="opacity: 0.5; pointer-events: none;">No Offers Yet</a>
                                <% } %>
                                
                                <a href="${pageContext.request.contextPath}/DeleteListServlet?lid=<%= l.getLid() %>" class="ksp-btn ksp-btn-danger ksp-btn-small" onclick="return confirm('Delete this listing permanently? This cannot be undone.');">Delete</a>
                            </div>
                        </article>
                    <% } %>
                </div>
            </section>

            <% if (!offers.isEmpty()) { %>
            <section id="offers">
                <div class="ksp-section-head">
                    <h2>Incoming Offers</h2>
                </div>
                
                <div class="ksp-offers-container">
                    <% for (OfferDTO o : offers) { %>
                        <article class="ksp-offer-row" <%= "Pending".equals(o.getStatus()) ? "" : "style='opacity: 0.6;'" %>>
                            <div class="ksp-offer-details">
                                <h3><%= o.getBookTitle() %></h3>
                                <p>Offer from <span><%= o.getBuyerName() %></span></p>
                            </div>
                            <div class="ksp-offer-middle">
                                <small><%= "Pending".equals(o.getStatus()) ? "Offered Amount" : "Finalized Amount" %></small>
                                <strong>&#8377;<%= String.format("%.0f", o.getAmount()) %></strong>
                            </div>
                            <div class="ksp-offer-actions">
    <% if ("Pending".equals(o.getStatus())) { %>

        <a href="${pageContext.request.contextPath}/UpdateBidServlet?bid=<%= o.getBidId() %>&status=Accepted" 
           class="ksp-btn ksp-btn-small">Accept</a>
        
        <a href="${pageContext.request.contextPath}/UpdateBidServlet?bid=<%= o.getBidId() %>&status=Rejected" 
           class="ksp-btn ksp-btn-danger ksp-btn-small">Reject</a>

    <% } else if ("Accepted".equals(o.getStatus())) { %>
        <div class="ksp-status ksp-status-accepted">Accepted</div>

    <% } else { %>
        <div class="ksp-status ksp-status-rejected">Rejected</div>
    <% } %>
</div>
                        </article>
                    <% } %>
                </div>
            </section>
            <% } %>

        <% } %>
    </main>
</div>

</body>
</html>