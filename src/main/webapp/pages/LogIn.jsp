<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn - Kithub</title>
<jsp:include page="/components/Favicon.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SignUp.css">
</head>
<body>
<div class="auth-page">
    <div class="auth-bg"></div>
    <div class="auth-overlay"></div>

    <nav class="auth-nav">
        <a href="Home.jsp" class="brand">Kithub<span>.</span></a>
    </nav>
    
    <%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
    String toastText = null;
    String toastType = "ok";

    if ("signup_ok".equals(msg)) {
        toastText = "Account created. Please log in.";
        toastType = "ok";
    } else if ("welcome".equals(msg)) {
        toastText = "Welcome back!";
        toastType = "ok";
    } else if ("invalid".equals(error)) {
        toastText = "Invalid email or password.";
        toastType = "err";
    } else if ("failed".equals(error)) {
        toastText = "Could not sign up. Try another email.";
        toastType = "err";
    }
		%>
		
		<% if (toastText != null) { %>
		<div id="toast" class="toast toast-<%= toastType %>">
		    <%= toastText %>
		</div>
		<% } %>

    <div class="form-container">
        <h2>Welcome Back</h2>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        
            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            <input type="password" name="pass" class="form-control" placeholder="Password" required>
            
            <button type="submit" class="btn" >Log In</button>
        </form>
        
        <% if ("invalid".equals(request.getParameter("error"))) { %>
    <p style="color: #E0A79C; text-align: center; margin-top: 1rem;">
        Invalid email or password. Please try again.
    </p>
<% } %>
        
        <p class="auth-footer">
            Don't have an account? <a href="SignUp.jsp">Sign Up</a>
        </p>
    </div>
</div>

</body>
</html>