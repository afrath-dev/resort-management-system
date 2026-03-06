<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
if (session.getAttribute("adminObj") == null) {
    response.sendRedirect("../admin.jsp");
    return;
}

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Admin Help | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>

<style>
body {
	background: #f4f6f9;
	padding-top: 90px;
}

.help-header {
	background: linear-gradient(135deg, #0d6efd, #198754);
	color: white;
	padding: 35px;
	border-radius: 15px;
}

.help-card {
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	height: 100%;
	display: flex;
	flex-direction: column;
}
</style>

</head>

<body>

	<%@include file="adminNavbar.jsp"%>

	<div class="container mt-4">

		<!-- HEADER -->

		<div class="help-header text-center mb-4">

			<h2>Admin Dashboard Guide</h2>

			<p>Manage reservations, monitor users and control system
				activity.</p>

		</div>


		<div class="row">

			<!-- SYSTEM OVERVIEW -->

			<div class="col-md-6 mb-4">

				<div class="card help-card p-4">

					<h4 class="text-primary">System Overview</h4>

					<p class="text-muted">The admin dashboard displays important
						system statistics including:</p>

					<ul class="text-muted">

						<li>Total number of registered users</li>

						<li>Total number of reservations</li>

						<li>System activity overview chart</li>

					</ul>

				</div>

			</div>


			<!-- VIEW RESERVATIONS -->

			<div class="col-md-6 mb-4">

				<div class="card help-card p-4">

					<h4 class="text-success">View All Reservations</h4>

					<p class="text-muted">The reservation table shows all bookings
						made by users.</p>

					<ul class="text-muted">

						<li>User full name</li>

						<li>Address</li>

						<li>Contact number</li>

						<li>Room type</li>

						<li>Check-in and check-out dates</li>

						<li>Reservation status</li>

					</ul>

				</div>

			</div>


			<!-- RESERVATION STATUS -->

			<div class="col-md-6 mb-4">

				<div class="card help-card p-4">

					<h4 class="text-warning">Reservation Status</h4>

					<ul class="text-muted">

						<li><b>Pending</b> – Reservation created but payment not
							completed.</li>

						<li><b>Approved</b> – Payment completed successfully.</li>

						<li><b>Cancelled</b> – Reservation cancelled by user or
							expired.</li>

					</ul>

				</div>

			</div>


			<!-- SEARCH FEATURE -->

			<div class="col-md-6 mb-4">

				<div class="card help-card p-4">

					<h4 class="text-danger">Search Reservations</h4>

					<p class="text-muted">Admins can search reservations using the
						search bar above the table.</p>

					<ul class="text-muted">

						<li>Search by name</li>

						<li>Search by contact number</li>

						<li>Search by room type</li>

					</ul>

				</div>

			</div>

		</div>

	</div>

</body>
</html>