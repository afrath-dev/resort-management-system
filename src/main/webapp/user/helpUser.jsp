<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.entity.User"%>

<%
HttpSession sess = request.getSession(false);

if (sess == null || sess.getAttribute("userObj") == null) {
	response.sendRedirect(request.getContextPath() + "/user.jsp");
	return;
}

User user = (User) sess.getAttribute("userObj");

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Help | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>

<style>

body{
    background:#f4f6f9;
    padding-top:90px;
}

.help-card{
    border-radius:12px;
    box-shadow:0 4px 20px rgba(0,0,0,0.1);
}

.help-header{
    background:linear-gradient(135deg,#0d6efd,#198754);
    color:white;
    padding:35px;
    border-radius:15px;
}

</style>

</head>

<body>

<%@include file="userNavbar.jsp"%>

<div class="container mt-4">

    <!-- HEADER -->
    <div class="help-header text-center mb-4">
        <h2>User Dashboard Guide</h2>
        <p>Learn how to manage your reservations and payments.</p>
    </div>

    <div class="row">

        <!-- VIEW RESERVATIONS -->
        <div class="col-md-6 mb-4">
            <div class="card help-card p-4">

                <h4 class="text-primary">View Reservations</h4>

                <p class="text-muted">
                After logging in, you will see your <b>User Dashboard</b>.
                This page shows all your reservations and booking details.
                </p>

                <ul class="text-muted">
                    <li>Reservation Number</li>
                    <li>Room Type</li>
                    <li>Check-in and Check-out dates</li>
                    <li>Reservation Status</li>
                    <li>Available Actions</li>
                </ul>

            </div>
        </div>


        <!-- MAKE PAYMENT -->
        <div class="col-md-6 mb-4">
            <div class="card help-card p-4">

                <h4 class="text-success">Make Payment</h4>

                <p class="text-muted">
                If a reservation status is <b>Pending</b>, you will see a
                <b>Make Payment</b> button.
                </p>

                <ol class="text-muted">
                    <li>Click <b>Make Payment</b>.</li>
                    <li>Enter your card details.</li>
                    <li>Confirm the payment.</li>
                    <li>A booking receipt will be generated.</li>
                </ol>

            </div>
        </div>


        <!-- CANCEL RESERVATION -->
        <div class="col-md-6 mb-4">
            <div class="card help-card p-4">

                <h4 class="text-danger">Cancel Reservation</h4>

                <p class="text-muted">
                If you change your plans, you can cancel a reservation
                before completing the payment.
                </p>

                <ul class="text-muted">
                    <li>Click the <b>Cancel</b> button.</li>
                    <li>The reservation status will become <b>Cancelled</b>.</li>
                    <li>Cancelled reservations cannot be paid.</li>
                </ul>

            </div>
        </div>


        <!-- CHECK-IN EXPIRED -->
        <div class="col-md-6 mb-4">
            <div class="card help-card p-4">

                <h4 class="text-secondary">Check-in Expired</h4>

                <p class="text-muted">
                If the check-in date has passed and payment was not completed,
                the reservation will automatically change to:
                </p>

                <ul class="text-muted">
                    <li><b>Status:</b> Cancelled</li>
                    <li><b>Action:</b> Check-in Expired</li>
                </ul>

                <p class="text-muted">
                In this case the reservation is no longer valid.
                </p>

            </div>
        </div>

    </div>

</div>

</body>
</html>