<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>Booking Receipt | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>

<style>
body {
	background: #f4f6f9;
	padding-top: 80px;
}

.receipt-card {
	max-width: 600px;
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

		<div class="receipt-card">

			<h3 class="text-center mb-4">--- Ocean View Resort ---</h3>

			<hr>

			<h5>Booking Receipt</h5>

			<p>
				<b>Reservation No:</b>
				<%=r.getId()%></p>

			<p>
				<b>Room Type:</b>
				<%=r.getRoomType()%></p>

			<p>
				<b>Check-in:</b>
				<%=r.getCheckIn()%></p>

			<p>
				<b>Check-out:</b>
				<%=r.getCheckOut()%></p>

			<p>
				<b>Total Nights:</b>
				<%=nights%></p>

			<p>
				<b>Rate per Night:</b> LKR
				<%=rate%></p>

			<hr>

			<h4>
				Total Paid: LKR
				<%=total%></h4>

			<hr>

			<p class="text-success fw-bold">Payment Successful ✔</p>

			<button class="btn btn-primary" onclick="window.print()">
				Print Receipt</button>

			<a href="userDashboard" class="btn btn-success"> Back to
				Dashboard </a>

		</div>

	</div>

</body>
</html>