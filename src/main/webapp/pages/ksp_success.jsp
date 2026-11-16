<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String newKspId = (String) session.getAttribute("newKspId");
    String newKspUsername = (String) session.getAttribute("newKspUsername");

    if (newKspId == null) {
        response.sendRedirect("Dashboard.jsp");
        return;
    }

    session.removeAttribute("newKspId");
    session.removeAttribute("newKspUsername");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSP Account Created</title>
<jsp:include page="/components/Favicon.jsp" />
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
        <h2>KSP Account Created</h2>

        <div class="id-box id-box-ready" style="margin-top: 1rem;">
            <strong><%= newKspId %></strong>
            <small>This ID will not be shown again. Please save it securely.</small>
        </div>

        <a href="seller_login.jsp" class="btn" style="display:block; text-align:center; text-decoration:none; margin-top:1rem;letter-spacing: 0;">
            Go to KSP Login
        </a>  
    </div>
</div>

</body>
</html>