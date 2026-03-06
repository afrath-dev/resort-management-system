<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login | Ocean View Resort</title>
<%@include file="component/allcss.jsp"%>

<style>
body {
    background: url("img/Resort2.jpg") no-repeat center center/cover;
    height: 100vh;
}

.login-wrapper {
    height: 90vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-card {
    width: 100%;
    max-width: 400px;
    backdrop-filter: blur(10px);
    background: rgba(255, 255, 255, 0.15);
    border-radius: 20px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.3);
    padding: 30px;
    color: white;
}

.login-card input {
    background: rgba(255,255,255,0.8);
}

.login-title {
    font-weight: bold;
    margin-bottom: 20px;
}

.btn-resort {
    background-color: #0d6efd;
    border: none;
}

.btn-resort:hover {
    background-color: #084298;
}

.clink {
    color: #ffffff;
    text-decoration: none;
    font-weight: 500;
}

.clink:hover {
    text-decoration: underline;
    color: #ffd700;
}

</style>

</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="login-wrapper">
    <div class="login-card">

        <h3 class="text-center login-title">Welcome Back</h3>
        <p class="text-center mb-4">Login to continue your luxury experience</p>

        <form action="userLogin" method="post">

            <div class="mb-3">
                <label class="form-label">Email address</label>
                <input required name="email" type="email" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input required name="password" type="password" class="form-control">
            </div>

            <button type="submit" class="btn btn-resort w-100 text-white">
                Login
            </button>
            
            <div class="text-center mt-3">
    			<span style="font-size: 14px;">Don't have an account?</span>
    			<a href="signup.jsp" class="clink">create one</a>
			</div>

        </form>

    </div>
</div>

</body>
</html>