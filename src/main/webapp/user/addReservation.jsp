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

<title>Add Reservation | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>

<style>
body {
	background: #f4f6f9;
	padding-top: 90px;
}
</style>

</head>

<body>

	<%@include file="userNavbar.jsp"%>

	<div class="container">

		<div class="card p-4 mt-4">

			<h4 class="text-center mb-4">Add New Reservation</h4>

			<form action="../addReservation" method="post">

				<div class="mb-3">
					<label>Address</label> <input type="text" name="address"
						class="form-control" required>
				</div>

				<div class="mb-3">
					<label>Contact Number</label> <input type="text" name="contact"
						class="form-control" required>
				</div>

				<div class="mb-3">
					<label>Room Type</label> <select name="roomType"
						class="form-control" required>
						<option value="">--Select Room--</option>
						<option>Single Room</option>
						<option>Double Room</option>
						<option>Twin Room</option>
					</select>
				</div>

				<div class="mb-3">
					<label>Check-in Date</label> <input type="date" name="checkIn"
						class="form-control" required>
				</div>

				<div class="mb-3">
					<label>Check-out Date</label> <input type="date" name="checkOut"
						class="form-control" required>
				</div>

				<button class="btn btn-primary w-100">Add Reservation</button>

			</form>

		</div>
	</div>

</body>
</html>