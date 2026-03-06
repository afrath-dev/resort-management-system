<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | Paradise Resort</title>
<%@include file="component/allcss.jsp"%>

<style>
body {
    background: url("img/Resort3.jpg") no-repeat center center/cover;
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
    background: rgba(0, 0, 0, 0.55);
    border-radius: 20px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.4);
    padding: 30px;
    color: white;
}

.login-card input {
    background: rgba(255,255,255,0.9);
}

.btn-admin {
    background-color: #dc3545;
    border: none;
}

.btn-admin:hover {
    background-color: #bb2d3b;
}
</style>

</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="login-wrapper">
    <div class="login-card">

        <h3 class="text-center mb-3">Admin Panel Login</h3>
        <p class="text-center mb-4">Authorized Access Only</p>

        <!-- 🔴 ERROR MESSAGE BLOCK -->
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center">
                ${errorMsg}
            </div>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <form action="adminlogin" method="post">

            <div class="mb-3">
                <label class="form-label">Admin Email</label>
                <input required name="email" type="email" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input required name="password" type="password" class="form-control">
            </div>

            <button type="submit" class="btn btn-admin w-100 text-white">
                Login as Admin
            </button>

        </form>

    </div>
</div>

</body>
</html>