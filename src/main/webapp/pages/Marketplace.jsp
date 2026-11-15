<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dao.ListingsDao, models.Listing" %>
<%

    if (session.getAttribute("userEmail") == null) {
        response.sendRedirect("LogIn.jsp");
        return;
    }

    ListingsDao dao = new ListingsDao();
    List<Listing> books = dao.getAllActiveListings();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kithub Marketplace</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Marketplace.css">

</head>
<body>


<header class="mk-hero">
    <h1>Explore the <span>Marketplace</span></h1>
    <p>Find books and notes from fellow students. Bid a fair price within the seller's range and strike a deal.</p>
</header>

<main class="mk-container">
    
    <div class="mk-grid">
        <% if (books.isEmpty()) { %>
            <div style="grid-column: 1 / -1; text-align: center; padding: 4rem; color: rgba(255,255,255,0.5);">
                <h2>No books listed yet. Check back later!</h2>
            </div>
        <% } else { %>
            <% for (Listing b : books) { %>

                <a href="book_details.jsp?lid=<%= b.getLid() %>" class="mk-card">
                    
                    <div class="mk-card-image">

                        <span class="mk-badge <%= "Lend".equals(b.getListingType()) ? "lend" : "" %>">
                            <%= b.getListingType() %>
                        </span>

                        <% if (b.getImageUrl() != null && !b.getImageUrl().trim().isEmpty()) { %>
                            <img src="<%= b.getImageUrl() %>" alt="Book Cover" style="width:100%; height:100%; object-fit:cover;">
                        <% } else { %>
                            <span class="mk-cover-placeholder">📚</span>
                        <% } %>
                    </div>

                    <div class="mk-card-body">
                        <div class="mk-card-type"><%= b.getItemType() %> &middot; <%= b.getGenre() != null ? b.getGenre() : "General" %></div>
                        <h3 class="mk-card-title"><%= b.getTitle() %></h3>
                        <p class="mk-card-author"><%= b.getAuthor() != null ? b.getAuthor() : "Unknown Author" %></p>

                        <div class="mk-card-price-box">
                            <div>
                                <div class="mk-price-label">Price Range</div>
                                <div class="mk-price-value">
                                    &#8377;<%= String.format("%.0f", b.getMinPrice()) %> - &#8377;<%= String.format("%.0f", b.getMaxPrice()) %>
                                </div>
                            </div>
                            <div class="mk-btn-view">Bid Now &rarr;</div>
                        </div>
                    </div>
                </a>
            <% } %>
        <% } %>
    </div>

</main>

<jsp:include page="../components/Footer.jsp" />

</body>
</html>