<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ListingsDao, models.Listing" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("LogIn.jsp"); return;
    }
    
    int lid = Integer.parseInt(request.getParameter("lid"));
    Listing book = new ListingsDao().getListingById(lid);
    
    if (book == null) {
        response.sendRedirect("marketplace.jsp"); return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bid on <%= book.getTitle() %></title>
<jsp:include page="/components/Favicon.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book_details.css">
</head>
<body>


<div class="bd-page">
    <div class="bd-card">
        
        <div class="bd-image">
            <% if (book.getImageUrl() != null && !book.getImageUrl().isEmpty()) { %>
                <img src="<%= book.getImageUrl() %>" alt="Book Cover">
            <% } else { %>
                <span class="bd-placeholder">📚</span>
            <% } %>
        </div>

        <div class="bd-content">
            <div class="bd-tags">
                <span class="bd-tag <%= "Lend".equals(book.getListingType()) ? "bd-tag-lend" : "" %>">
                    <%= book.getListingType() %>
                </span>
                <span class="bd-tag" style="background: rgba(255,255,255,0.1); color: #fff;"><%= book.getItemType() %></span>
            </div>

            <h1 class="bd-title"><%= book.getTitle() %></h1>
            <p class="bd-author">By <%= book.getAuthor() != null ? book.getAuthor() : "Unknown" %> &middot; <%= book.getGenre() %></p>
            
            <p class="bd-desc"><%= book.getDescription() != null ? book.getDescription() : "No description provided by seller." %></p>

            <div class="bd-bid-box">
                <div class="bd-range">
                    <div class="bd-range-item">
                        <small>Min Acceptable</small>
                        <strong>&#8377;<%= String.format("%.0f", book.getMinPrice()) %></strong>
                    </div>
                    <div class="bd-range-item">
                        <small>Max Expected</small>
                        <strong>&#8377;<%= String.format("%.0f", book.getMaxPrice()) %></strong>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/PlaceBidServlet" method="post">
                    <input type="hidden" name="lid" value="<%= book.getLid() %>">
                    
                    <div class="bd-form-group">

                        <input type="number" name="bid_amount" class="bd-input" 
                               placeholder="Enter your bid..." 
                               min="<%= book.getMinPrice() %>" 
                               max="<%= book.getMaxPrice() %>" step="1" required>
                    </div>
                    
                    <button type="submit" class="bd-btn">Place Your Bid</button>
                </form>
            </div>
            
        </div>
    </div>
</div>

</body>
</html>