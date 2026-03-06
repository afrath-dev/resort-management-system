<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Register | Ocean View Resort</title>
<%@include file="component/allcss.jsp"%>

<style>
body {
    background: url("img/Resort2.jpg") no-repeat center center/cover;
    background-attachment: fixed;
}

.register-wrapper {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 80px;
}

.register-card {
    width: 100%;
    max-width: 420px;
    backdrop-filter: blur(12px);
    background: rgba(255, 255, 255, 0.15);
    border-radius: 20px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.35);
    padding: 30px;
    color: white;
}

.register-card input {
    background: rgba(255,255,255,0.85);
}

.register-title {
    font-weight: bold;
    margin-bottom: 15px;
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

<div class="register-wrapper">
    <div class="register-card">

        <h3 class="text-center register-title">Create Your Account</h3>
        <p class="text-center mb-4">Join us for a luxury experience</p>

        <form action="user_register" method="post">

		    <div class="mb-3">
		        <label class="form-label">Full Name</label>
		        <input required name="fullName" type="text" class="form-control">
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Email</label>
		        <input required name="email" type="email" class="form-control">
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Password</label>
		        <input required name="password" type="password" class="form-control">
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Address</label>
		        <input required name="address" type="text" class="form-control">
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Contact Number</label>
		        <input required name="contact" type="text" class="form-control">
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Room Type</label>
		        <select name="roomType" class="form-control" required>
		            <option value="">-- Select Room --</option>
		            <option value="Single Room">Single Room</option>
		            <option value="Double Room">Double Room</option>
		            <option value="Twin Room">Twin Room</option>
		        </select>
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Check-in Date</label>
		        <input required name="checkIn" type="date" class="form-control">
		    </div>
		
		    <div class="mb-3">
		        <label class="form-label">Check-out Date</label>
		        <input required name="checkOut" type="date" class="form-control">
		    </div>
		
		    <button type="submit" class="btn btn-resort w-100 text-white">
		        Register & Book
		    </button>
		    
		    <div class="text-center mt-3">
		        <span style="font-size:14px;">Already have an account?</span>
		        <a href="user.jsp" class="clink">Login</a>
		    </div>

		</form>
    </div>
</div>

</body>
</html>