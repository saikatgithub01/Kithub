<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp - Kithub</title>
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
        <h2>Create Account</h2>

        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <input type="text" name="nm" class="form-control" placeholder="Full Name" required>
            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
            <input type="text" name="city" class="form-control" placeholder="City / Campus" required>
            <input type="password" name="pass" class="form-control" placeholder="Password" required>
            <input type = "submit" class="btn" value="Sign Up"/>
            
        </form>
        
        <p class="auth-footer">
            Already have an account? <a href="LogIn.jsp">Log In</a>
        </p>
    </div>
</div>

</body>
</html>