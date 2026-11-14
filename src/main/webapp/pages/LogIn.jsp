<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn - Kithub</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/SignUp.css">
</head>
<body>
<div class="auth-page">
    <div class="auth-bg"></div>
    <div class="auth-overlay"></div>

    <nav class="auth-nav">
        <a href="Home.jsp" class="brand">Kithub<span>.</span></a>
    </nav>

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