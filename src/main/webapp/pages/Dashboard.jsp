<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
    String userEmail = (String) session.getAttribute("userEmail");
    String userName = (String) session.getAttribute("userName");

    if (userEmail == null) {
        response.sendRedirect("LogIn.jsp");
        return;
    }

    if (userName == null || userName.trim().isEmpty()) {
        userName = "Reader";
    }  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard — Kithub</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/components/Navbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Dashboard.css">
</head>
<body>

<div class="dashboard-page">


    <div class="dash-bg"></div>
    <div class="dash-overlay"></div>


    <jsp:include page="/components/Navbar.jsp" />


    <main class="hero-content">
        <h1 class="title">Namaste, <%-- <%= userName --%></h1>

        <p class="subtitle">
            Welcome to your personal book corner. Discover your next great read,
            borrow from your community, or share your own collection.
        </p>

        <div class="actions">
            <a href="BrowseListings.jsp" class="btn btn-primary">Buy a Book</a>
            <a href="Explore.jsp" class="btn btn-secondary">Explore</a>
        </div>
    </main>

</div>
<section id="about" class="about-section">
    <div class="about-inner">
        <h2 class="section-title">A quieter way to move books.</h2>

        <p class="section-lead">
            Kithub is built for students, societies, and city readers who want books to travel
            further than one shelf. List what you own, bid fairly, lend for a while,
            and keep good books in circulation.
        </p>

        <div class="about-grid">
            <article class="about-card">
                <span class="about-number">01</span>
                <h3>Buy & Sell</h3>
                <p>
                    List textbooks, novels, and notebooks with a fair price range.
                    Buyers place bids within your limits.
                </p>
            </article>

            <article class="about-card">
                <span class="about-number">02</span>
                <h3>Bid with intent</h3>
                <p>
                    No chaotic auctions. Sellers set min–max ranges.
                    Buyers bid thoughtfully. Sellers accept what feels right.
                </p>
            </article>

            <article class="about-card">
                <span class="about-number">03</span>
                <h3>Lend & share</h3>
                <p>
                    Not every book needs to be sold. Lend for a set period
                    and bring community reading back into everyday life.
                </p>
            </article>
        </div>

        <div id="categories" class="categories-row">
            <h3 class="categories-title">Popular corners</h3>
            <div class="category-pills">
                <span>Academic</span>
                <span>Fiction</span>
                <span>Competitive Exams</span>
                <span>Notebooks</span>
                <span>Comics</span>
                <span>Self Growth</span>
            </div>
        </div>

    </div>
</section>

<jsp:include page="/components/Footer.jsp" />

</body>
</html>