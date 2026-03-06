<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.entity.Reservation"%>

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

<%
Reservation r = (Reservation) request.getAttribute("reservation");

long diff = r.getCheckOut().getTime() - r.getCheckIn().getTime();
long nights = diff / (1000 * 60 * 60 * 24);

int rate = 0;

if (r.getRoomType().equals("Single Room"))
	rate = 9000;
else if (r.getRoomType().equals("Twin Room"))
	rate = 12000;
else
	rate = 15000;

long total = nights * rate;
%>

<!DOCTYPE html>
<html>
<head>

<title>Payment Gateway | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>

<style>
body {
	background: #f4f6f9;
	padding-top: 90px;
}

.payment-card {
	max-width: 500px;
	margin: auto;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	background: white;
}
</style>

</head>

<body>

	<div class="container">

		<div class="payment-card">

			<h4 class="text-center mb-4">Secure Payment</h4>

			<form action="processPayment" method="post">

				<input type="hidden" name="resId" value="<%=r.getId()%>">

				<div class="mb-3">
					<label>Room Type</label> <input class="form-control"
						value="<%=r.getRoomType()%>" readonly>
				</div>

				<div class="mb-3">
					<label>Total Nights</label> <input class="form-control"
						value="<%=nights%>" readonly>
				</div>

				<div class="mb-3">
					<label>Total Amount (LKR)</label> <input
						class="form-control fw-bold" value="<%=total%>" readonly>
				</div>

				<hr>

				<h6>Card Details</h6>

				<div class="mb-3">
					<label>Card Number</label> <input type="text" class="form-control"
						required>
				</div>

				<div class="mb-3">
					<label>Name on Card</label> <input type="text" class="form-control"
						required>
				</div>

				<div class="row">
					<div class="col-md-6">
						<label>Expiry</label> <input type="text" class="form-control"
							placeholder="MM/YY" required>
					</div>

					<div class="col-md-6">
						<label>CVV</label> <input type="password" class="form-control"
							required>
					</div>
				</div>

				<button class="btn btn-success w-100 mt-4">
					Pay LKR
					<%=total%>
				</button>

			</form>

		</div>

	</div>

</body>
</html>