<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSP-LogIn</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/seller_auth.css">
</head>
<body>

<div class="auth-page">

    <div class="auth-bg"></div>
    <div class="auth-overlay"></div>

    <nav class="auth-nav">
        <a href="Dashboard.jsp" class="brand">Kithub<span>.</span></a>
    </nav>

    <div class="form-container">
        <h2>Seller Login</h2>
        <form action="SellerLoginServlet" method="post">


            <div class="form-section">
                <input
                    type="text"
                    name="seller_username"
                    class="form-control"
                    placeholder="KSP username"
                    required
                >
            </div>

         
            <div class="form-section form-section-id">
                <input
                    type="password"
                    name="seller_unique_id"
                    class="form-control"
                    placeholder="KSP ID"
                    required
                >
            </div>

            <button type="submit" class="btn" >Enter KSP</button>
        </form>
        
        <% if ("invalid".equals(request.getParameter("error"))) { %>
    		<p class="form-sub" style="color:#E0A79C; border:1px solid rgba(201,106,90,0.3); padding:0.75rem; border-radius:4px; 				background:rgba(201,106,90,0.08); margin-top:1rem;">Invalid Username or KSP ID. Please check and try again.</p>
		<% } %>

        <p class="auth-footer">
            New seller?
            <a href="seller_signup.jsp">Create Seller Profile</a>
        </p>
    </div>

</div>

</body>
</html>