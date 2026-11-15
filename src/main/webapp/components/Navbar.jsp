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
        <a href="<%= isLoggedIn ? "Dashboard.jsp" : "Home.jsp" %>" class="brand">Kithub<span>.</span></a>
    </div>
    
    <div class="nav-middle">
        <div class="nav-links">
            <a href="<%= "Dashboard.jsp" %>">Home</a>
            <a href="#about">About</a>
            <a href="#categories">Categories</a>
            <a href="my_bids.jsp">My Bids</a>
            <a href="#contact">Contact Us</a>
        </div>
	</div>
	
	<div class ="nav-right">
		<a href="seller_signup.jsp" class="btn-seller">Create Seller Account</a>
	</div>
</nav>
</body>
</html>