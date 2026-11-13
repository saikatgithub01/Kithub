<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSP-Sign Up</title>
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
        <h2>Create Seller Profile</h2>

        <form method="post">

            <!-- Step 1: username -->
            <div class="form-section">
                <input
                    type="text"
                    name="seller_username"
                    class="form-control"
                    placeholder="Enter seller username"
                    minlength="3"
                    maxlength="30"
                    value="${sessionScope.pendingSellerUsername != null ? sessionScope.pendingSellerUsername : ''}"
                    required
                >
            </div>

            <!-- Step 2: ID shown only after Generate servlet sets it -->
            <div class="form-section form-section-id">
                <input
                    type="hidden"
                    name="seller_unique_id"
                    value="${sessionScope.pendingSellerUniqueId != null ? sessionScope.pendingSellerUniqueId : ''}"
                >

                <div class="id-box ${sessionScope.pendingSellerUniqueId != null ? 'id-box-ready' : ''}">
                    <strong>
                        ${sessionScope.pendingSellerUniqueId != null ? sessionScope.pendingSellerUniqueId : 'KSP-XXXX-XXXX'}
                    </strong>
                    <small>
                        ${sessionScope.pendingSellerUniqueId != null
                            ? 'Save this ID now — it is your password for every KSP login'
                            : 'Click Generate ID first — this code will be your KSP password'}
                    </small>
                </div>
            </div>

            <button
                type="submit"
                class="btn btn-generate"
                formaction="GenerateSellerIdServlet"
            >
                Generate ID
            </button>

            <button
                type="submit"
                class="btn"
                formaction="CreateSellerProfileServlet"
            >
                Create KSP Account
            </button>
        </form>

        <p class="auth-footer">
            Already a seller?
            <a href="seller_login.jsp">Login to KSP</a>
        </p>
    </div>

</div>

</body>
</html>