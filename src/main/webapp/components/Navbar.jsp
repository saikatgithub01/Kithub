<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String navUserEmail = (String) session.getAttribute("userEmail");
    String navUserName = (String) session.getAttribute("userName");
    boolean isLoggedIn = (navUserEmail != null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kithub</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/components/Navbar_style.css">
</head>
<body>
<nav class="navbar">
    <div class="nav-left">
        <a href="<%= isLoggedIn ? request.getContextPath() + "/pages/Dashboard.jsp" : request.getContextPath() + "/pages/Home.jsp" %>" class="brand">Kithub<span>.</span></a>
    </div>
    
    <div class="nav-middle">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/pages/Dashboard.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/pages/Dashboard.jsp#about">About</a>
            <a href="${pageContext.request.contextPath}/pages/Marketplace.jsp">Marketplace</a>
            <a href="${pageContext.request.contextPath}/pages/my_bids.jsp">My Bids</a>
            <a href="${pageContext.request.contextPath}/pages/Dashboard.jsp#contact">Contact Us</a>
        </div>
    </div>
	
    <div class="nav-right">
        <%
            Boolean hasSeller = (Boolean) session.getAttribute("hasSellerProfile");
            if (hasSeller == null) hasSeller = false;
        %>
        
        <% if (isLoggedIn) { %>

            <% if (hasSeller) { %>
                <a href="${pageContext.request.contextPath}/pages/Seller_Dashboard.jsp" class="btn-seller">
                    Enter KSP
                </a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/pages/seller_signup.jsp" class="btn-seller">
                    Create Seller Profile
                </a>
            <% } %>


            <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn-logout" onclick="return confirm('Are you sure you want to log out?');">
                Log Out
            </a>
            
        <% } else { %>

            <a href="${pageContext.request.contextPath}/pages/LogIn.jsp" class="btn-seller" style="background: transparent; color: #F3E6D2; border: 1px solid rgba(243, 230, 210, 0.3);">
                Log In
            </a>
            <a href="${pageContext.request.contextPath}/pages/SignUp.jsp" class="btn-seller">
                Sign Up
            </a>
        <% } %>
    </div>
</nav>
</body>
</html>