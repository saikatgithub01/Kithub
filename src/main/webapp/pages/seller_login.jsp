<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

            <button type="submit" class="btn">Enter KSP</button>
        </form>

        <p class="auth-footer">
            New seller?
            <a href="seller_signup.jsp">Create Seller Profile</a>
        </p>
    </div>

</div>

</body>
</html>