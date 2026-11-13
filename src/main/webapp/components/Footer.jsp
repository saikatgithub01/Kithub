<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kithub</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/components/Footer_style.css">
</head>
<body>

<footer id="contact" class="site-footer">
    <div class="footer-inner">

        <div class="footer-top">
            <div class="footer-brand-block">
                <a href="Dashboard.jsp" class="footer-brand">Kithub<span>.</span></a>
                <p class="footer-tagline">
                    A corner for readers, sellers & borrowers.
                    Buy, sell, bid and lend books across campus and city.
                </p>
            </div>

            <div class="footer-col">
                <h4>Explore</h4>
                <a href="Dashboard.jsp">Home</a>
                <a href="#about">About</a>
                <a href="#categories">Categories</a>
                <a href="CreateSellerProfile.jsp">Become a Seller</a>
            </div>

            <div class="footer-col">
                <h4>Support</h4>
                <a href="#contact">Contact Us</a>
                <a href="#">Help Center</a>
                <a href="#">Community Guidelines</a>
                <a href="#">FAQs</a>
            </div>

            <div class="footer-col footer-contact">
                <h4>Contact Us</h4>
                <p>Email: <a href="mailto:hello@kithub.com">hello@kithub.com</a></p>
                <p>Phone: +91 98765 43210</p>
                <p>Based in campuses & communities across India</p>

                <form class="footer-form" action="#" method="post" onsubmit="return false;">
                    <label for="footerEmail">Write to us</label>
                    <div class="footer-form-row">
                        <input id="footerEmail" type="email" placeholder="Your email" required>
                        <button type="submit">Send</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="footer-bottom">
            <p>© 2026 Kithub. Crafted for book lovers.</p>
            <div class="footer-bottom-links">
                <a href="#">Privacy</a>
                <a href="#">Terms</a>
            </div>
        </div>

    </div>
</footer>

</body>
</html>